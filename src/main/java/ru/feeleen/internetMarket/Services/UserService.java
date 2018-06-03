package ru.feeleen.internetMarket.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.entities.UserContacts;
import ru.feeleen.internetMarket.repositories.UserContactsRepository;
import ru.feeleen.internetMarket.repositories.UserRepository;

import java.util.Optional;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserContactsRepository userContactsRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        return userRepository.findByEmail(s);
    }

    public boolean changeFirstName(User user, String firstName) {
        User UserDTO = userRepository.findByEmail(user.getEmail());
        if (firstName != null && !firstName.isEmpty() && firstName != UserDTO.getFirstName()) {
            user.setFirstName(firstName);
            userRepository.save(user);
            return true;
        } else {
            return false;
        }
    }

    public boolean changeSecondName(User user, String secondName) {
        User UserDTO = userRepository.findByEmail(user.getEmail());
        if (secondName != null && !secondName.isEmpty() && secondName != UserDTO.getSecondName()) {
            user.setSecondName(secondName);
            userRepository.save(user);
            return true;
        } else {
            return false;
        }
    }

    public boolean setAddress(User user, String address) {
        UserContacts userContacts = getUserContactsFromDataBase(user);

        User UserDTO = userRepository.findByEmail(user.getEmail());
        if (address != null && !address.isEmpty() && address != userContacts.getAddress()) {
            userContacts.setAddress(address);
            userContactsRepository.save(userContacts);
            return true;
        } else {
            return false;
        }
    }



    public boolean setCity(User user, String city) {
        UserContacts userContacts = getUserContactsFromDataBase(user);
        if (city != null && !city.isEmpty() && city != userContacts.getCity()) {
            userContacts.setCity(city);
            userContactsRepository.save(userContacts);
            return true;
        } else {
            return false;
        }
    }

    public boolean setCountry(User user, String country) {
        UserContacts userContacts = getUserContactsFromDataBase(user);
        if (country != null && !country.isEmpty() && country != userContacts.getCountry()) {
            userContacts.setCountry(country);
            userContactsRepository.save(userContacts);
            return true;
        } else {
            return false;
        }
    }

    public boolean setPhone(User user, String phone) {
        UserContacts userContacts = getUserContactsFromDataBase(user);

        if (phone != null && !phone.isEmpty() && phone != userContacts.getPhone()) {
            userContacts.setPhone(phone);
            userContactsRepository.save(userContacts);
            return true;
        } else {
            return false;
        }
    }

    public UserContacts getUserContactsFromDataBase(User user) {
        if (user.getUserContacts()==null) {
            UserContacts userContacts = new UserContacts();
            userContacts.setUser(user);
            user.setUserContacts(userContacts);
        }
        UserContacts userContacts = user.getUserContacts();
        if (userContacts.getId()!=null) {
            Optional<UserContacts> userContactsOptional = userContactsRepository.findById(userContacts.getId());
            if (userContactsOptional.isPresent()) {
                userContacts = userContactsOptional.get();
            }
        }

        return userContacts;
    }

}
