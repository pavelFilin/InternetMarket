package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.feeleen.internetMarket.Services.CategoryService;
import ru.feeleen.internetMarket.entities.Category;
import ru.feeleen.internetMarket.repositories.CategoryRepository;

@Controller
@RequestMapping("categories")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CategoryRepository categoryRepository;

    @GetMapping
    public String getCategories(Model model) {
        model.addAttribute("categories", categoryRepository.findAll());
        return "categories";
    }

    @GetMapping("addcategory")
    public String getAddCategory(Model model) {
        model.addAttribute("categories", categoryRepository.findAll());
        return "addcategory";
    }

    @PostMapping("addcategory")
    public String addCategory(
            @RequestParam String title,
            @RequestParam(name = "parent", required = false) String parent
    ) {
        categoryService.saveCategory(title, parent);
        return "redirect:/categories";
    }

    @GetMapping("{category}")
    public String userEditForm(@PathVariable Category category, Model model) {
        categoryRepository.delete(category);
        return "redirect:/categories";
    }
}
