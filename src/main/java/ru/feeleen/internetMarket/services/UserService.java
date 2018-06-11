package ru.feeleen.internetMarket.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.feeleen.internetMarket.entities.Cart;
import ru.feeleen.internetMarket.entities.Role;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.entities.UserContacts;
import ru.feeleen.internetMarket.repositories.UserContactsRepository;
import ru.feeleen.internetMarket.repositories.UserRepository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Optional;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {
    private final String MAIL_SUBJECT_RESET_PASSWORD = "Сброс пароля";
    private final String MAIL_MESSAGE_RESET_PASSWORD = "Для сброса пароля перейдите по ссылке";
    private final String ADDRESS_PATH = "localhost:8080";

    @Autowired
    private UserContactsRepository userContactsRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MailSender mailSender;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        return userRepository.findByEmail(s);
    }

    public boolean addUser(User user) {
        User userFromDb = userRepository.findByEmail(user.getEmail());
        if (userFromDb != null) {
            return false;
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRoles(Collections.singleton(Role.USER));

        user.setOrders(new ArrayList<>());

        Cart cart = new Cart();
        cart.setUser(user);
        user.setCart(cart);

        UserContacts userContacts = new UserContacts();
        userContacts.setUser(user);
        user.setUserContacts(userContacts);

        user.setActivationCode(UUID.randomUUID().toString());
        userRepository.save(user);

        String message = String.format(
                "Hello, %s! \n" +
                        "Для подтверждения регистрации перейдите по ссылке:  http://localhost:8080/activate/%s",
                user.getFirstName(),
                user.getActivationCode()
        );

        mailSender.send(user.getEmail(), "Activation code", message);

        return true;
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
        if (address != null && address != userContacts.getAddress()) {
            userContacts.setAddress(address);
            userContactsRepository.save(userContacts);
            return true;
        } else {
            return false;
        }
    }


    public boolean setCity(User user, String city) {
        UserContacts userContacts = getUserContactsFromDataBase(user);
        if (city != null && city != userContacts.getCity()) {
            userContacts.setCity(city);
            userContactsRepository.save(userContacts);
            return true;
        } else {
            return false;
        }
    }

    public boolean setCountry(User user, String country) {
        UserContacts userContacts = getUserContactsFromDataBase(user);
        if (country != null && country != userContacts.getCountry()) {
            userContacts.setCountry(country);
            userContactsRepository.save(userContacts);
            return true;
        } else {
            return false;
        }
    }

    public boolean setPhone(User user, String phone) {
        UserContacts userContacts = getUserContactsFromDataBase(user);

        if (phone != null && phone != userContacts.getPhone()) {
            userContacts.setPhone(phone);
            userContactsRepository.save(userContacts);
            return true;
        } else {
            return false;
        }
    }

    public UserContacts getUserContactsFromDataBase(User user) {
        if (user.getUserContacts() == null) {
            UserContacts userContacts = new UserContacts();
            userContacts.setUser(user);
            user.setUserContacts(userContacts);
        }
        UserContacts userContacts = user.getUserContacts();
        if (userContacts.getId() != null) {
            Optional<UserContacts> userContactsOptional = userContactsRepository.findById(userContacts.getId());
            if (userContactsOptional.isPresent()) {
                userContacts = userContactsOptional.get();
            }
        }

        return userContacts;
    }

    public boolean activateUser(String code) {
        User user = userRepository.findByActivationCode(code);
        if (user.getActivationCode() == null) {
            return false;
        }

        user.setActivationCode("null");
        user.setActive(true);
        userRepository.save(user);
        return true;
    }

    public boolean sendResetPasswordMail(String email) {
        User user = userRepository.findByEmail(email);
        if (user == null) {
            return false;
        }
        String uuid = UUID.randomUUID().toString();

        String message = String.format("%s http://%s/resetpassword/%s", MAIL_SUBJECT_RESET_PASSWORD, ADDRESS_PATH, uuid);

        user.setToken(uuid);
        userRepository.save(user);

        mailSender.send(user.getEmail(), MAIL_SUBJECT_RESET_PASSWORD, message);
        return true;
    }

    public boolean resetPassword(String password, String token) {
        User user = userRepository.findByToken(token);
        if (user == null) {
            return false;
        }

        user.setPassword(passwordEncoder.encode(password));
        user.setToken(null);

        userRepository.save(user);

        return true;
    }
}
