package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.feeleen.internetMarket.services.CategoryService;
import ru.feeleen.internetMarket.entities.Category;
import ru.feeleen.internetMarket.repositories.CategoryRepository;

@Controller
@RequestMapping("categories")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private CategoryRepository categoryRepository;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("diagram")
    public String getSchemaOfCategories(Model model) {
        model.addAttribute("categories", categoryRepository.findAll());
        return "categorydiagram";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("addcategory")
    public String getAddCategory(Model model) {
        model.addAttribute("categories", categoryRepository.findAll());
        return "addcategory";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("addcategory")
    public String addCategory(
            @RequestParam String title,
            @RequestParam(name = "parent", required = false) String parent
    ) {
        categoryService.saveCategory(title, parent);
        return "redirect:/categories";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("delete/{category}")
    public String userEditForm(@PathVariable Category category, Model model) {
        categoryRepository.delete(category);
        return "redirect:/categories";
    }
}
