package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.feeleen.internetMarket.Services.CategoryService;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.repositories.ProductRepository;

@Controller
public class MainController{
    private  final int QUERY_LIMIT=30;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/")
    public String getIndex( @AuthenticationPrincipal User user, Model model) {

        model.addAttribute("categor", categoryService.getTreeCategories());
        model.addAttribute("products", productRepository.findAll());
        return "index";
    }
}
