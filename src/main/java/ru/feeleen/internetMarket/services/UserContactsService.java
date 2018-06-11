package ru.feeleen.internetMarket.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.entities.UserContacts;
import ru.feeleen.internetMarket.repositories.UserContactsRepository;

import java.util.Optional;

@Service
public class UserContactsService {
    @Autowired
    private UserContactsRepository userContactsRepository;

    public UserContacts getUserContacts(Long id) {
        return userContactsRepository.findById(id).get();
    }

    public UserContacts getUserContactsByUser(User user) {
        UserContacts userContacts = user.getUserContacts();

        if (userContacts == null) {
            userContacts = new UserContacts();
            userContacts.setUser(user);
            user.setUserContacts(userContacts);
            return userContacts;
        } else {
            Optional<UserContacts> optionalUserContacts = userContactsRepository.findById(user.getUserContacts().getId());
            if (optionalUserContacts.isPresent()) {
                userContacts = optionalUserContacts.get();
            }
        }

        return userContacts;
    }
}
