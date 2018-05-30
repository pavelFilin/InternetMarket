package ru.feeleen.internetMarket.controllers;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.feeleen.internetMarket.entities.Cart;
import ru.feeleen.internetMarket.entities.CartItem;
import ru.feeleen.internetMarket.entities.Product;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.repositories.CartRepository;

import java.util.ArrayList;
import java.util.List;

@RestController
public class CartController {
    @Autowired
    private CartRepository cartRepository;

    @GetMapping("/cart")
    public String getCart(Model model) {
        return "cart";
    }

    @RequestMapping(value = "/addtocart", method = RequestMethod.GET, produces = "application/json")
    public String addToCart(@AuthenticationPrincipal User user, @RequestParam(name = "id") Product product) {
        if (user.getCart() == null) {
            user.setCart(new Cart());
            if (user.getCart().getCartItems() == null) {
                user.getCart().setCartItems(new ArrayList<CartItem>());
            }
        }

        boolean isProductExist= false;
        List<CartItem> userCartItems = user.getCart().getCartItems();
        for (CartItem userCartItem : userCartItems) {
            if (userCartItem.getProduct().getId() == product.getId()) {
                userCartItem.setAmount(userCartItem.getAmount() + 1);
                isProductExist = true;
                cartRepository.save(user.getCart());
                break;
            }
        }

        if (!isProductExist) {
            CartItem cartItem = new CartItem();
            cartItem.setAmount(1);
            cartItem.setCart(user.getCart());
            user.getCart().getCartItems().add(cartItem);
            cartRepository.save(user.getCart());
        }

        return new Gson().toJson(product);
    }


    @PostMapping(value = "lllll", produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public String addToCardd(@AuthenticationPrincipal User user, @RequestBody Product product) {
        if (user.getCart() == null) {
            user.setCart(new Cart());
            if (user.getCart().getCartItems() == null) {
                user.getCart().setCartItems(new ArrayList<CartItem>());
            }
        }

        boolean isProductExist= false;
        List<CartItem> userCartItems = user.getCart().getCartItems();
        for (CartItem userCartItem : userCartItems) {
            if (userCartItem.getProduct().getId() == product.getId()) {
                userCartItem.setAmount(userCartItem.getAmount() + 1);
                isProductExist = true;
                cartRepository.save(user.getCart());
                break;
            }
        }


        if (!isProductExist) {
            CartItem cartItem = new CartItem();
            cartItem.setAmount(1);
            cartItem.setCart(user.getCart());
            user.getCart().getCartItems().add(cartItem);
            cartRepository.save(user.getCart());
        }

        return "redirect:/categories";
    }
}
