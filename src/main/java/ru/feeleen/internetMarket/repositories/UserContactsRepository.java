package ru.feeleen.internetMarket.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.feeleen.internetMarket.entities.UserContacts;

public interface UserContactsRepository extends CrudRepository<UserContacts, Long>{
}
