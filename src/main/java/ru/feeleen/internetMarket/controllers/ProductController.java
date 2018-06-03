package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ru.feeleen.internetMarket.Services.CategoryService;
import ru.feeleen.internetMarket.entities.Product;
import ru.feeleen.internetMarket.repositories.CategoryRepository;
import ru.feeleen.internetMarket.repositories.ProductRepository;

import javax.websocket.server.PathParam;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
@RequestMapping("product")
public class ProductController {
    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CategoryRepository categoryRepository;


    @GetMapping("{productID}")
    public String getProduct(@PathVariable("productID") Product product , Model model) {
        model.addAttribute("categories",categoryService.getTreeCategories());
        model.addAttribute("product", product);
        return "product";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("addproduct")
    public String getAddProduct(Model model) {
        model.addAttribute("categories", categoryRepository.findAll());
        return "addproduct";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("addproduct")
    public String addProduct(
            @RequestParam String title,
            @RequestParam("price") Integer price,
            @RequestParam(name = "warrantyMonths", required = false) Integer warrantyMonths,
            @RequestParam String category,
            @RequestParam String description,
            @RequestParam("file") MultipartFile file,
            Model model
    ) throws IOException {
        Product product = new Product(title, price, categoryRepository.findByTitle(category), description, warrantyMonths);
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

        return "redirect:/product/" + product.getId();
    }



}
