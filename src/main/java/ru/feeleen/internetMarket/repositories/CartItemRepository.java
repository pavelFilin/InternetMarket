package ru.feeleen.internetMarket.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.feeleen.internetMarket.entities.CartItem;

public interface CartItemRepository extends CrudRepository<CartItem, Long> {
}
