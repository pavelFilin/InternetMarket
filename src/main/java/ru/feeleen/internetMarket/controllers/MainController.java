package ru.feeleen.internetMarket.controllers;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.feeleen.internetMarket.entities.User;

@Controller
public class MainController{
    @GetMapping("/")
    public String getIndex( @AuthenticationPrincipal User user, Model model) {
        return "index";
    }
}
