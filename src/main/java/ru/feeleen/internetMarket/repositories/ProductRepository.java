package ru.feeleen.internetMarket.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ru.feeleen.internetMarket.entities.Category;
import ru.feeleen.internetMarket.entities.Product;

import java.util.List;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {
    Product findByName(String name);

    List<Product> findAllByName(String name);
    List<Product> findAllByNameLike(String name);
    List<Product> findAllByNameLikeAndAvailable(String name, boolean available);

    List<Product> findByCategory(Category category);

    List<Product> findAllByAvailable(boolean available);

    List<Product> findAllByCategoryAndAvailable(Category category, boolean available);
}
