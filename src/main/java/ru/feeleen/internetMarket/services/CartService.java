package ru.feeleen.internetMarket.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.feeleen.internetMarket.entities.Cart;
import ru.feeleen.internetMarket.entities.CartItem;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.repositories.CartRepository;

import java.util.LinkedList;
import java.util.Optional;

@Service
public class CartService {
    @Autowired
    private CartRepository cartRepository;

    public Cart getCart(Long id) {
        return cartRepository.findById(id).get();
    }

    public Cart getCartByUser(User user) {
        Cart cart = user.getCart();

        if (cart == null) {
            cart = new Cart();
            cart.setUser(user);
            cart.setCartItems(new LinkedList<CartItem>());
            user.setCart(cart);
            return cart;
        }

        if (user.getCart().getCartItems() == null) {
            user.getCart().setCartItems(new LinkedList<CartItem>());
        }


        Optional<Cart> cartOptional = cartRepository.findById(user.getCart().getId());

        if (cartOptional.isPresent()) {
            cart = cartOptional.get();
        }

        return cart;
    }

    public void clearCart(Long id) {
        Cart cart = cartRepository.findById(id).get();
        cart.getCartItems().clear();
        cartRepository.save(cart);
    }
}
