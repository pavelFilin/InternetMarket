package ru.feeleen.internetMarket.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import ru.feeleen.internetMarket.entities.Category;
import ru.feeleen.internetMarket.entities.Product;
import ru.feeleen.internetMarket.helpers.fileHelpers.FileHelper;
import ru.feeleen.internetMarket.repositories.CategoryRepository;
import ru.feeleen.internetMarket.repositories.ProductRepository;

import java.io.IOException;
import java.util.List;

@Service
public class ProductService {
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private ProductRepository productRepository;

    @Value("${upload.path}")
    private String uploadPath;
    @Value("${generalPicture}")
    private String generalPicture;

    public void add(String title, Integer price, String category, String description, Integer warrantyMonths, MultipartFile file)
            throws IOException {
        Product product = new Product(title, price, categoryRepository.findByTitle(category), description, warrantyMonths);
        String path = FileHelper.loadFile(file, uploadPath);
        if (!StringUtils.isEmpty(path)) {
            product.setImageUrl(path);
        }
        product.setAvailable(true);
        productRepository.save(product);
    }

    public Product findByName(String name) {
        return productRepository.findByName(name);
    }

    public List<Product> findByCategory(Category category) {
        return productRepository.findByCategory(category);
    }
    public List<Product> findByCategoryAndAvailable(Category category, boolean available){
        return productRepository.findAllByCategoryAndAvailable(category, available);
    }

    public void updateProduct(Product product, String name, Integer price, String category, String description, Integer warrantyMonths, MultipartFile file, boolean available)
            throws IOException {
        if (!StringUtils.isEmpty(name)) {
            product.setName(name);
        }
        if (!StringUtils.isEmpty(category)) {
            product.setCategory(categoryRepository.findByTitle(category));
        }
        if (!StringUtils.isEmpty(description)) {
            product.setDescription(description);
        }

        String path = FileHelper.loadFile(file, uploadPath);
        if (!StringUtils.isEmpty(path)) {
            product.setImageUrl(path);
        }

        if (price!=null) {
            product.setPrice(price);
        }

        product.setAvailable(available);

        product.setWarrantyMonths(warrantyMonths);

        productRepository.save(product);
    }

    public List<Product> findByAvailable(boolean available){
        return productRepository.findAllByAvailable(available);
    }


}
