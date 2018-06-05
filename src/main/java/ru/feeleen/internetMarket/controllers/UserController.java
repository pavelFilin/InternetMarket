package ru.feeleen.internetMarket.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.feeleen.internetMarket.Services.UserService;
import ru.feeleen.internetMarket.entities.*;
import ru.feeleen.internetMarket.repositories.OrderRepository;
import ru.feeleen.internetMarket.repositories.UserContactsRepository;
import ru.feeleen.internetMarket.repositories.UserRepository;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    OrderRepository orderRepository;

    @Autowired
    UserContactsRepository userContactsRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    private UserService userService;

    @GetMapping("profile")
    public String getProfile(@AuthenticationPrincipal User user, Model model){
        model.addAttribute("firstName", user.getFirstName());
        model.addAttribute("secondName", user.getSecondName());
        model.addAttribute("userContacts", userService.getUserContactsFromDataBase(user));
        List<Order> allByUserid = orderRepository.findAllByUser(user);
        model.addAttribute("orders", allByUserid);
        model.addAttribute("executionStages", ExecutionStage.values());
        return "profile";
    }

    @PostMapping("profile/changefirstname")
    public String changeFirstName(@RequestParam String firstName, @AuthenticationPrincipal User user){
        userService.changeFirstName(user, firstName);
        return "redirect:/user/profile";
    }

    @PostMapping("profile/changesecondname")
    public String changeSecondName(@RequestParam String secondName, @AuthenticationPrincipal User user){
        userService.changeSecondName(user, secondName);
        return "redirect:/user/profile";
    }

    @PostMapping("profile/setAddress")
    public String setAddress(@RequestParam String address, @AuthenticationPrincipal User user){
        userService.setAddress(user, address);
        return "redirect:/user/profile";
    }

    @PostMapping("profile/setcity")
    public String setCity(@RequestParam String city, @AuthenticationPrincipal User user){
        userService.setCity(user, city);
        return "redirect:/user/profile";
    }

    @PostMapping("profile/setcountry")
    public String setCountry(@RequestParam String country, @AuthenticationPrincipal User user){
        userService.setCountry(user, country);
        return "redirect:/user/profile";
    }
    @PostMapping("profile/setphone")
    public String setPhone(@RequestParam String phone, @AuthenticationPrincipal User user){
        userService.setPhone(user, phone);
        return "redirect:/user/profile";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String getUserList(Model model){
        model.addAttribute("users", userRepository.findAll());
        return "userlist";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "useredit";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
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
