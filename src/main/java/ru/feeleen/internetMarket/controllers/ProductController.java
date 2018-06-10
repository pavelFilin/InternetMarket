package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ru.feeleen.internetMarket.entities.Product;
import ru.feeleen.internetMarket.repositories.CategoryRepository;
import ru.feeleen.internetMarket.repositories.ProductRepository;
import ru.feeleen.internetMarket.services.CategoryService;
import ru.feeleen.internetMarket.services.ProductService;

import java.io.IOException;

@Controller
@RequestMapping("product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CategoryRepository categoryRepository;


    @GetMapping("{productID}")
    public String getProduct(@PathVariable("productID") Product product, Model model) {
        model.addAttribute("categoryTree", categoryService.getTreeCategories());
        model.addAttribute("categories", categoryService.findAll());
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
            @RequestParam String name,
            @RequestParam("price") Integer price,
            @RequestParam(name = "warrantyMonths", required = false) Integer warrantyMonths,
            @RequestParam String category,
            @RequestParam String description,
            @RequestParam("file") MultipartFile file,
            Model model
    ) throws IOException {
        productService.add(name, price, category, description, warrantyMonths, file);

        return "redirect:/product/" + productService.findByName(name).getId();
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("editproduct/{product}")
    public String editProduct(
            @PathVariable Product product,
            @RequestParam String name,
            @RequestParam("price") Integer price,
            @RequestParam(name = "warrantyMonths", required = false) Integer warrantyMonths,
            @RequestParam String category,
            @RequestParam String description,
            @RequestParam(value = "file", required = false) MultipartFile file,
            @RequestParam(required = false) boolean available
    ) throws IOException {
        productService.updateProduct(product, name, price, category, description, warrantyMonths, file, available);
        return "redirect:/product/" + product.getId();
    }
}
