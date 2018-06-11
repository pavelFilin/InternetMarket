package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ru.feeleen.internetMarket.entities.Product;
import ru.feeleen.internetMarket.helpers.ErrorHelpers.ControllerUtils;
import ru.feeleen.internetMarket.services.CategoryService;
import ru.feeleen.internetMarket.services.ProductService;

import javax.validation.Valid;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

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
        model.addAttribute("categories", categoryService.findAll());
        return "addproduct";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("addproduct")
    public String addProduct(
            @RequestParam("file") MultipartFile file,
            @RequestParam String categoryTemp,
            @Valid Product product,
            BindingResult bindingResult,
            Model model
    ) throws IOException {

        if (bindingResult.hasErrors()){
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            System.out.println("errors");
            model.addAttribute("categoryTree", categoryService.getTreeCategories());
            model.addAttribute("categories", categoryService.findAll());
            return "addproduct";
        } else {
           productService.add(product.getName(), product.getPrice(), categoryTemp, product.getDescription(), product.getWarrantyMonths(), file);
        }

         return "redirect:/product/" + productService.findByName(product.getName()).getId();
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("editproduct/{productCurrent}")
    public String editProduct(
            @PathVariable Product productCurrent,
            @RequestParam("file") MultipartFile file,
            @RequestParam String categoryTemp,
            @Valid Product product,
            BindingResult bindingResult,
            Model model

    ) throws IOException {
        if (bindingResult.hasErrors()){
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            System.out.println("errors");
            model.addAttribute("categoryTree", categoryService.getTreeCategories());
            model.addAttribute("categories", categoryService.findAll());
            model.addAttribute("product", product);
            return "redirect:/product/" + productCurrent.getId();
        } else {
            productService.updateProduct(productCurrent, product.getName(), product.getPrice(), categoryTemp, product.getDescription(), product.getWarrantyMonths(), file, product.isAvailable());
        }
        return "redirect:/product/" + productCurrent.getId();
    }
}
