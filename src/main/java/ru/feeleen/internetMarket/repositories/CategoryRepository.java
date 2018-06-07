package ru.feeleen.internetMarket.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.feeleen.internetMarket.entities.Category;

import java.util.List;


public interface CategoryRepository extends CrudRepository<Category, Long> {
    Category findByTitle(String title);
    List<Category> findByParent(Category parent);
}
