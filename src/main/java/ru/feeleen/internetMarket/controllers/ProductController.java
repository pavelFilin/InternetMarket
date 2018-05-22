package ru.feeleen.internetMarket.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("product")
public class ProductController {
    @GetMapping
    public String getProduct(){
        return "product";
    }

    @GetMapping("addproduct")
    public String getAddProduct(){
        return "addProduct";
    }

    @PostMapping("addproduct")
    public String addProduct(
            Model model
    ) {
        return "/product";
    }

}
