package ru.feeleen.internetMarket.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.feeleen.internetMarket.Services.UserService;
import ru.feeleen.internetMarket.entities.User;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("profile")
    public String getProfile(@AuthenticationPrincipal User user, Model model){
        return "profile";
    }

    @PostMapping("profile/changename")
    public String changeName(){
        return "redirect:profile";
    }

}
