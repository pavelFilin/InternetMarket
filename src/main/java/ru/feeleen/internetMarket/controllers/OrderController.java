package ru.feeleen.internetMarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.feeleen.internetMarket.entities.*;
import ru.feeleen.internetMarket.repositories.CartRepository;
import ru.feeleen.internetMarket.repositories.OrderRepository;
import ru.feeleen.internetMarket.repositories.UserContactsRepository;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;

@Controller
@RequestMapping("order")
public class OrderController {
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private UserContactsRepository userContactsRepository;

    @Autowired
    private CartRepository cartRepository;

    @GetMapping("makeorder")
    public String getMakeOder(@AuthenticationPrincipal User user, Model model) {
        Cart cart = cartRepository.findById(user.getCart().getId()).get();
        UserContacts userContacts = userContactsRepository.findById(user.getUserContacts().getId()).get();
        model.addAttribute("cart", cart);
        model.addAttribute("userContacts", userContacts);
        return "ordering";
    }

    @PostMapping("makeorder")
    public String MakeOder(@AuthenticationPrincipal User user, @RequestParam Cart cart, @RequestParam String address, @RequestParam String phone) {
        if (user.getOrders()==null) {
            user.setOrders(new ArrayList<Order>());
        }

        Order order = new Order();
        Set<OrderedProduct> orderedProducts = new HashSet<>();
        for (CartItem cartItem : cart.getCartItems()) {
            orderedProducts.add(new OrderedProduct(order, cartItem.getProduct(), cartItem.getAmount()));
        }

        order.setExecutionStage(ExecutionStage.Unhandled);
        order.setUser(user);
        order.setOrderedProducts(orderedProducts);
        order.setProductsPrise(cart.getTotalPrise());
        order.setAddress(address);
        order.setPhone(phone);

        orderRepository.save(order);

        return "redirect:/user/profile";
    }
}
