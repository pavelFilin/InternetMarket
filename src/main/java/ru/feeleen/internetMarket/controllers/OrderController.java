package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import ru.feeleen.internetMarket.entities.Cart;
import ru.feeleen.internetMarket.entities.Order;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.entities.UserContacts;
import ru.feeleen.internetMarket.repositories.UserContactsRepository;
import ru.feeleen.internetMarket.services.CartService;
import ru.feeleen.internetMarket.services.OrderService;
import ru.feeleen.internetMarket.services.UserContactsService;

@Controller
@RequestMapping("order")
public class OrderController {
    private final String ERROR_ORDER_MESSAGE = "Заполните пустые поля";
    @Autowired
    private OrderService orderService;

    @Autowired
    private CartService cartService;

    @Autowired
    private UserContactsService userContactsService;

    @Autowired
    private UserContactsRepository userContactsRepository;

    @GetMapping("makeorder")
    public String getMakeOder(@AuthenticationPrincipal User user, Model model) {
        Cart cart = cartService.getCartByUser(user);
        if (cart == null) {
            cart = new Cart();
            cart.setUser(user);
            user.setCart(new Cart());
        }
        UserContacts userContacts = userContactsService.getUserContactsByUser(user);
        model.addAttribute("cart", cart);
        model.addAttribute("userContacts", userContacts);
        return "ordering";
    }

    @PostMapping("makeorder")
    public String MakeOrder(@AuthenticationPrincipal User user, @RequestParam Cart cart, @RequestParam String address, @RequestParam String phone, Model model) {
        if (StringUtils.isEmpty(address) || StringUtils.isEmpty(phone)) {
            model.addAttribute("cart", cart);
            UserContacts userContacts = userContactsService.getUserContactsByUser(user);
            model.addAttribute("userContacts", userContacts);
            model.addAttribute("error", ERROR_ORDER_MESSAGE);
            return "ordering";
        }
        orderService.makeOrder(user, cart, address, phone);
        cartService.clearCart(cart.getId());

        return "redirect:/user/profile";
    }

    @GetMapping("{order}")
    public String getOrder(@AuthenticationPrincipal User user, @PathVariable Order order, Model model) {
        if (user.isAdmin() || orderService.findAllByUser(user).contains(order)) {
            model.addAttribute("order", order);
            model.addAttribute("userContacts", userContactsRepository.findById(order.getUser().getUserContacts().getId()).get());
            return "order";
        } else {
            return null;
        }
    }
}
