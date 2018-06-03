package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.feeleen.internetMarket.entities.Cart;
import ru.feeleen.internetMarket.entities.CartItem;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.repositories.CartRepository;

import java.util.LinkedList;
import java.util.Optional;

@Controller
public class CartController {
    @Autowired
    private CartRepository cartRepository;

    @GetMapping("/cart")
    public String getCart(@AuthenticationPrincipal User user, Model model) {
        if (user.getCart() == null) {
            user.setCart(new Cart());
        }

        if (user.getCart().getCartItems() == null) {
            user.getCart().setCartItems(new LinkedList<CartItem>());
        }

        Cart cart = user.getCart();
        Optional<Cart> cartOptional = cartRepository.findById(user.getCart().getId());
        if (cartOptional.isPresent()){
            cart = cartOptional.get();
        }
        model.addAttribute("cart", cart);
        return "cart";
    }
}
