package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.services.CartService;

@Controller
@RequestMapping("cart")
public class CartController {
    @Autowired
    private CartService cartService;

    @GetMapping
    public String getCart(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("cart", cartService.getCartByUser(user));
        return "cart";
    }
}
