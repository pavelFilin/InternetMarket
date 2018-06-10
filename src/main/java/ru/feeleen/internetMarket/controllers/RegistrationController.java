package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.feeleen.internetMarket.entities.Cart;
import ru.feeleen.internetMarket.entities.Role;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.entities.UserContacts;
import ru.feeleen.internetMarket.repositories.UserRepository;
import ru.feeleen.internetMarket.services.UserService;

import javax.jws.WebParam;
import java.util.Collection;
import java.util.Collections;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserService userService;
    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Model model){
        if (!userService.addUser(user)) {
            model.addAttribute("massage", "Пользователь с таким email уже зарегистрирован");
            return "registration";
        } else

            return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(@PathVariable String code, Model model) {
        boolean isActivated = userService.activateUser(code);
        if (isActivated) {
            model.addAttribute("message", "Пользователь активирован");
        } else {
            model.addAttribute("message", "Неверный код активации");    
        }
        return "login";
    }

    @GetMapping("/requestresetpassword")
    public String getsetpassword() {
        return "requestresetpassword";
    }

    @PostMapping("/requestresetpassword")
    public String sendresetpassword(@RequestParam String email, Model model) {
        if(userService.sendResetPasswordMail(email)) {
            model.addAttribute("message", "На почту отправлено письмо для востановление пароля");
        } else {
            model.addAttribute("message", "email не найден");
        }
        return "login";
    }

    @PostMapping("/resetpassword")
    public String saveNewPassword(@RequestParam String password, @RequestParam String token, Model model) {
        if (userService.resetPassword(password, token)) {
            model.addAttribute("message", "пароль изменен");
        } else {
            model.addAttribute("message", "Ссылка не действительна");
        }
        return "login";
    }

    @GetMapping("/resetpassword/{token}")
    public String getSaveNewPassword(@PathVariable String token, Model model) {
        model.addAttribute("token", token);
        return "resetpassword";
    }
 }
