package ru.feeleen.internetMarket.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.feeleen.internetMarket.entities.Category;


public interface CategoryRepository extends CrudRepository<Category, Long> {
    Category findByTitle(String title);
}
