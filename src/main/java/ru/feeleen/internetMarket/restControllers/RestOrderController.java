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

@RestController
public class RestOrderController {

    @Autowired
    private OrderRepository orderRepository;
        @RequestMapping(value = "/order/changeexecutionstage", method = RequestMethod.GET, produces = "application/json")
    public String changeAmount(@AuthenticationPrincipal User user, @RequestParam(name = "id") Order order, @RequestParam String executionStage) throws Exception {
        if (!user.isAdmin()) {
            return null;
        }

        order.setExecutionStage(ExecutionStage.valueOf(executionStage));

        orderRepository.save(order);
        return new Gson().toJson("success");
    }
}
