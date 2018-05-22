package ru.feeleen.internetMarket.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.feeleen.internetMarket.entities.Category;
import ru.feeleen.internetMarket.repositories.CategoryRepository;

@Service
public class CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;

    public void saveCategory(String title, String parent) {
        if (parent != null && parent!="NONE" && !parent.isEmpty()) {
            Category parentCategory = categoryRepository.findByTitle(parent);
            Category category = new Category(title, parentCategory);
            categoryRepository.save(category);

        } else {
            Category category = new Category();
            category.setTitle(title);
            categoryRepository.save(category);
        }

    }

}
