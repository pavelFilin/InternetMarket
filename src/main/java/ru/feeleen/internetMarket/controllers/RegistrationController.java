package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.helpers.ErrorHelpers.ControllerUtils;
import ru.feeleen.internetMarket.repositories.UserRepository;
import ru.feeleen.internetMarket.services.UserService;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserService userService;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@Valid User user, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            model.addAttribute("user", user);
            return "registration";
        } else {
            if (!userService.addUser(user)) {
                model.addAttribute("massage", "Пользователь с таким email уже зарегистрирован");
                return "registration";
            }
        }

        return "login";
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
        if (userService.sendResetPasswordMail(email)) {
            model.addAttribute("message", "На почту отправлено письмо для востановление пароля");
        } else {
            model.addAttribute("message", "email не найден");
        }
        return "login";
    }

    @PostMapping("/resetpassword")
    public String saveNewPassword(@RequestParam String password, @RequestParam String token, Model model) {
        if (userService.resetPassword(password, token) && !StringUtils.isEmpty(password)) {
            model.addAttribute("message", "пароль изменен");
        } else if (!StringUtils.isEmpty(password)){
            model.addAttribute("message", "Ссылка не действительна");
        } else {
            model.addAttribute("message", "Поле не может быть пустым");
        }
        return "login";
    }

    @GetMapping("/resetpassword/{token}")
    public String getSaveNewPassword(@PathVariable String token, Model model) {
        model.addAttribute("token", token);
        return "resetpassword";
    }
}
