package ru.feeleen.internetMarket.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.feeleen.internetMarket.entities.Order;

public interface OrderRepository extends CrudRepository<Order, Long> {
}
