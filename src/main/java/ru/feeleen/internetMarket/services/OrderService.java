package ru.feeleen.internetMarket.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailMessage;
import org.springframework.stereotype.Service;
import ru.feeleen.internetMarket.entities.*;
import ru.feeleen.internetMarket.repositories.OrderRepository;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class OrderService {
    private final String MAIL_MESSAGE = "Ваш заказ оформлен";
    private final String MAIL_SUBJECT = "Заказ";
    @Autowired
    private MailSender mailSender;

    @Autowired
    private OrderRepository orderRepository;

    public List<Order> findAll() {
        return (List<Order>) orderRepository.findAll();
    }

    public List<Order> findAllByUser(User user) {
        return orderRepository.findAllByUser(user);
    }

    public void makeOrder(User user, Cart cart, String address, String phone) {
        if (user.getOrders() == null) {
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
        List<String> productNames = order.getOrderedProducts().stream().map(OrderedProduct::getProduct).map(Product::getName).collect(Collectors.toList());
        String names = String.join(", ", productNames);
        String message = String.format("%s:\n" +
                "%s"
                , MAIL_MESSAGE, names);

        mailSender.send(user.getEmail(), MAIL_SUBJECT, message);
    }
}
