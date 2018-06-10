package ru.feeleen.internetMarket.restControllers;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ru.feeleen.internetMarket.entities.ExecutionStage;
import ru.feeleen.internetMarket.entities.Order;
import ru.feeleen.internetMarket.entities.User;
import ru.feeleen.internetMarket.repositories.OrderRepository;
import ru.feeleen.internetMarket.services.MailSender;

import javax.xml.ws.Service;

@RestController
public class RestOrderController {
    private final String MAIL_SUBJECT_CHANGE_EXECUTION_STAGE = "Статус заказа изменен";
    private final String MAIL_MESSANGE_CHANGE_EXECUTION_STAGE = "Статус заказа изменен";

    @Autowired
    private MailSender mailSender;

    @Autowired
    private OrderRepository orderRepository;
        @RequestMapping(value = "/order/changeexecutionstage", method = RequestMethod.GET, produces = "application/json")
    public String changeAmount(@AuthenticationPrincipal User user, @RequestParam(name = "id") Order order, @RequestParam String executionStage) throws Exception {
        if (!user.isAdmin()) {
            return null;
        }

        order.setExecutionStage(ExecutionStage.valueOf(executionStage));

        orderRepository.save(order);

        String message  = String.format("%s: %s", MAIL_MESSANGE_CHANGE_EXECUTION_STAGE, order.getExecutionStage().name());
        mailSender.send(order.getUser().getEmail(), MAIL_SUBJECT_CHANGE_EXECUTION_STAGE, message);

        return new Gson().toJson("success");
    }
}
