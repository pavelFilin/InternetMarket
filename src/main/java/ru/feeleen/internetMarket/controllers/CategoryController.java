package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.feeleen.internetMarket.entities.Product;
import ru.feeleen.internetMarket.services.CategoryService;
import ru.feeleen.internetMarket.entities.Category;
import ru.feeleen.internetMarket.repositories.CategoryRepository;
import ru.feeleen.internetMarket.services.ProductService;

import java.util.List;

@Controller
@RequestMapping("categories")
public class CategoryController {
    private final String DONT_DELETE = "Невозможно удалить";

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ProductService productService;

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
        try {
            categoryService.saveCategory(title, parent);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/categories/diagram  ";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("delete/{category}")
    public String deleteCategory(@PathVariable Category category, Model model) {
        try {
            categoryRepository.delete(category);
        } catch (Exception e) {
            model.addAttribute("message", DONT_DELETE);
        }
        return "redirect:/categories/diagram";
    }

    @GetMapping("{category}")
    public String getCategory(@PathVariable Category category, Model model) {
        List<Category> subCategories = categoryService.getSubCategories(category);
        List<Product> products = productService.findByCategoryAndAvailable(category, true);
        model.addAttribute("subcategories", subCategories);
        model.addAttribute("products", products);
        model.addAttribute("categories", categoryService.getTreeCategories());
        return "category";
    }

}
