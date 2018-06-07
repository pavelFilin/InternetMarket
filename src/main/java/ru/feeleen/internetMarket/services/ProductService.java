package ru.feeleen.internetMarket.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ru.feeleen.internetMarket.entities.Category;
import ru.feeleen.internetMarket.entities.Product;
import ru.feeleen.internetMarket.repositories.ProductRepository;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Value("${upload.path}")
    private String uploadPath;

    public void add(String title, Integer price, Category category, String description, Integer warrantyMonths, MultipartFile file) throws IOException {
        Product product = new Product(title, price, category, description, warrantyMonths);
        if (file != null) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadDir + "/" + resultFileName));

            product.setImageUrl(resultFileName);
        }

        productRepository.save(product);
    }

    public Product findByName(String name) {
       return productRepository.findByName(name);
    }

    public List<Product> findByCategory(Category category) {
        return productRepository.findByCategory(category);
    }
}
