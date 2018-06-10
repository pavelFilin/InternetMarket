package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.feeleen.internetMarket.entities.Product;
import ru.feeleen.internetMarket.repositories.ProductRepository;
import ru.feeleen.internetMarket.services.CategoryService;

import java.util.Collections;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductRepository productRepository;

    private final int MAX_PRODUCT_ON_PAGE = 20;

    @GetMapping("/")
    public String getIndex(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        List<Product> products = null;
        model.addAttribute("categor", categoryService.getTreeCategories());
        if (filter != null && !filter.isEmpty()) {
            products = productRepository.findAllByNameLikeAndAvailable("%" + filter + "%", true);
            model.addAttribute("filter", filter);
        } else {
            products = (List<Product>) (productRepository.findAllByAvailable(true));
            if (products.size() > MAX_PRODUCT_ON_PAGE) {
                Collections.shuffle(products);
                products = products.subList(0, MAX_PRODUCT_ON_PAGE);
            }
        }

        model.addAttribute("products", products);
        return "index";
    }
}
