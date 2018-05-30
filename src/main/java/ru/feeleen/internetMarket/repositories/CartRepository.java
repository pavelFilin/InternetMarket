package ru.feeleen.internetMarket.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.feeleen.internetMarket.entities.Cart;


public interface CartRepository extends CrudRepository<Cart, Long> {

}
