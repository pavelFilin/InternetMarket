package ru.feeleen.internetMarket.controllers;


import org.omg.PortableInterceptor.USER_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.feeleen.internetMarket.Services.UserService;
import ru.feeleen.internetMarket.entities.Role;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.repositories.UserRepository;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    UserRepository userRepository;
    @Autowired
    private UserService userService;

    @GetMapping("profile")
    public String getProfile(@AuthenticationPrincipal User user, Model model){
        model.addAttribute("firstName", user.getFirstName());
        model.addAttribute("secondName", user.getSecondName());
        return "profile";
    }

    @PostMapping("profile/changefirstname")
    public String changeFirstName(@RequestParam String firstName, @AuthenticationPrincipal User user){
        userService.changeFirstName(user, firstName);
        return "redirect:/user/profile";
    }
    @PostMapping("profile/changesecondname")
    public String changeSecondName(@RequestParam String secondName, @AuthenticationPrincipal User user){
        userService.changeFirstName(user, secondName);
        return "redirect:/user/profile";
    }

    @GetMapping
    public String getUserList(Model model){
        model.addAttribute("users", userRepository.findAll());
        return "userlist";
    }

    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "useredit";
    }

    @PostMapping
    public String userSave(
            @RequestParam Map<String, String> form,
            @RequestParam("userID") User user) {

        user.getRoles().clear();

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        for (String key : form.keySet()) {
            if (roles.contains(key)){
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
        return " redirect:/user";
    }
}
