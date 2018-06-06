package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.feeleen.internetMarket.entities.Cart;
import ru.feeleen.internetMarket.entities.Order;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.entities.UserContacts;
import ru.feeleen.internetMarket.repositories.UserContactsRepository;
import ru.feeleen.internetMarket.services.CartService;
import ru.feeleen.internetMarket.services.OrderService;

@Controller
@RequestMapping("order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private CartService cartService;

    @Autowired
    private UserContactsRepository userContactsRepository;

    @GetMapping("makeorder")
    public String getMakeOder(@AuthenticationPrincipal User user, Model model) {
        Cart cart = cartService.getCartByUser(user);
        UserContacts userContacts = userContactsRepository.findById(user.getUserContacts().getId()).get();
        model.addAttribute("cart", cart);
        model.addAttribute("userContacts", userContacts);
        return "ordering";
    }

    @PostMapping("makeorder")
    public String MakeOder(@AuthenticationPrincipal User user, @RequestParam Cart cart, @RequestParam String address, @RequestParam String phone) {
        orderService.makeOrder(user, cart, address, phone);
        cartService.clearCart(cart.getId());

        return "redirect:/user/profile";
    }

    @GetMapping("{order}")
    public String getOrder(@AuthenticationPrincipal User user, @PathVariable Order order, Model model) {
        if (user.isAdmin() || orderService.findAllByUser(user).contains(order)){
            model.addAttribute("order", order);
            model.addAttribute("userContacts", userContactsRepository.findById(order.getUser().getUserContacts().getId()).get());
            return "order";
        } else{
            return null;
        }

    }
}
