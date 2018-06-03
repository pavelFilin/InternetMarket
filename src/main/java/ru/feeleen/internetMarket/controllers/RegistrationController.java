package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.feeleen.internetMarket.entities.Cart;
import ru.feeleen.internetMarket.entities.Role;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.entities.UserContacts;
import ru.feeleen.internetMarket.repositories.UserRepository;

import java.util.Collection;
import java.util.Collections;

@Controller
public class RegistrationController {
    @Autowired
    UserRepository userRepository;
    @GetMapping("registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("registration")
    public String addUser(User user, Model model){
        User userFromDb = userRepository.findByEmail(user.getEmail());
        if (userFromDb != null){
            model.addAttribute("message", "User exist");
            return "registration";
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setCart(new Cart());
        user.setUserContacts(new UserContacts());
        userRepository.save(user);
        return "redirect:/login";
    }
}
