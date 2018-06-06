package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.feeleen.internetMarket.entities.Product;
import ru.feeleen.internetMarket.services.CategoryService;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.repositories.ProductRepository;

import java.util.Collections;
import java.util.List;

@Controller
public class MainController {
    private final int QUERY_LIMIT = 30;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductRepository productRepository;

    private final int MAX_PRODUCT_ON_PAGE = 20;

    @GetMapping("/")
    public String getIndex(@AuthenticationPrincipal User user, Model model) {

        model.addAttribute("categor", categoryService.getTreeCategories());
        List<Product> products = (List<Product>) (productRepository.findAll());
        if (products.size() > MAX_PRODUCT_ON_PAGE) {
            Collections.shuffle(products);
            products = products.subList(0, MAX_PRODUCT_ON_PAGE);
        }
        model.addAttribute("products", products);
        return "index";
    }
}
