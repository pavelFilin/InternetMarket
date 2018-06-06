package ru.feeleen.internetMarket.restControllers;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ru.feeleen.internetMarket.entities.Cart;
import ru.feeleen.internetMarket.entities.CartItem;
import ru.feeleen.internetMarket.entities.Product;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.json.CartJson;
import ru.feeleen.internetMarket.repositories.CartItemRepository;
import ru.feeleen.internetMarket.repositories.CartRepository;
import ru.feeleen.internetMarket.repositories.UserRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
public class RestCartController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private CartItemRepository cartItemRepository;

    @RequestMapping(value = "/addtocart", method = RequestMethod.GET, produces = "application/json")
    public String addToCart(@AuthenticationPrincipal User user, @RequestParam(name = "id") Product product) {
        if (user.getCart() == null) {
            Cart cart = new Cart();
            cart.setUser(user);
            user.setCart(cart);
            if (user.getCart().getCartItems() == null) {
                user.getCart().setCartItems(new ArrayList<CartItem>());
            }
        } else {
            Cart cart = null;
            Optional<Cart> optionalCart = cartRepository.findById(user.getCart().getId());
            if (optionalCart.isPresent()) {
                user.setCart(optionalCart.get());
            }
        }


        boolean isProductExist = false;
        List<CartItem> userCartItems = user.getCart().getCartItems();
        for (CartItem userCartItem : userCartItems) {
            if (userCartItem.getProduct().getId() == product.getId()) {
                userCartItem.setAmount(userCartItem.getAmount() + 1);
                isProductExist = true;
//                userRepository.save(user);
                cartRepository.save(user.getCart());
                break;
            }
        }

        if (!isProductExist) {
            CartItem cartItem = new CartItem();
            cartItem.setProduct(product);
            cartItem.setAmount(1);
            cartItem.setCart(user.getCart());
            user.getCart().getCartItems().add(cartItem);
//            userRepository.save(user);
            cartRepository.save(user.getCart());
        }

        return new Gson().toJson(new CartJson(user.getCart().getTotalItems(), user.getCart().getTotalPrise()));
    }

    @RequestMapping(value = "/deletecartitem", method = RequestMethod.GET, produces = "application/json")
    public String deleteCartItem(@AuthenticationPrincipal User user, @RequestParam(name = "id") Product product) {
        CartItem deleteItem = null;
        Cart cart = user.getCart();
        Optional<Cart> optionalCart = cartRepository.findById(user.getCart().getId());
        if (optionalCart.isPresent()) {
            cart = optionalCart.get();
        }
        for (CartItem cartItem : cart.getCartItems()) {
            if (cartItem.getProduct().getId() == product.getId()) {
                deleteItem = cartItem;
                break;
            }
        }

        cart.getCartItems().remove(deleteItem);

        cartRepository.save(cart);

        return new Gson().toJson(new CartJson(user.getCart().getTotalItems(), user.getCart().getTotalPrise()));
    }

    @RequestMapping(value = "/changeamount", method = RequestMethod.GET, produces = "application/json")
    public String changeAmount(@AuthenticationPrincipal User user, @RequestParam(name = "id") Product product, @RequestParam Integer amount) {
        Optional<Cart> cartOptional = cartRepository.findById(user.getCart().getId());
        Cart cart = cartOptional.get();
        for (CartItem cartItem : cart.getCartItems()) {
            if (cartItem.getProduct().getId() == product.getId()) {
                cartItem.setAmount(amount);
                break;
            }
        }

        cartRepository.save(cart);
        return new Gson().toJson(new CartJson(user.getCart().getTotalItems(), user.getCart().getTotalPrise()));
    }

}
