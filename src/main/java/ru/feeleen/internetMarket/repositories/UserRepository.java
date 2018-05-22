package ru.feeleen.internetMarket.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.feeleen.internetMarket.entities.User;


public interface UserRepository extends JpaRepository<User, Long>{
    User findByEmail(String Email);
}
