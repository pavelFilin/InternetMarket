package ru.feeleen.internetMarket.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.feeleen.internetMarket.entities.Order;
import ru.feeleen.internetMarket.entities.User;

import java.util.List;

public interface OrderRepository extends CrudRepository<Order, Long> {
    List<Order> findAllByUser(User user);
}
