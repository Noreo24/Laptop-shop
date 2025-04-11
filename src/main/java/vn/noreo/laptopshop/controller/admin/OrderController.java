package vn.noreo.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.noreo.laptopshop.domain.Order;
import vn.noreo.laptopshop.domain.OrderDetail;
import vn.noreo.laptopshop.domain.Product;
import vn.noreo.laptopshop.service.OrderService;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class OrderController {

    public final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getAllOrderPage(Model model) {
        List<Order> allOrders = orderService.getAllOrders();
        model.addAttribute("allOrders", allOrders);
        return "admin/order/view-all-order";
    }

    @GetMapping("/admin/order/{id}")
    public String getOrderDetailPage(Model model, @PathVariable long id) {
        Order currentOrder = orderService.getOrderById(id);
        model.addAttribute("currentOrder", currentOrder);
        model.addAttribute("currentOrderDetails", currentOrder.getOrderDetails());
        return "admin/order/view-order-detail";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrderPage(Model model, @PathVariable long id) {
        Order currentOrder = orderService.getOrderById(id);
        model.addAttribute("currentOrder", currentOrder);
        return "admin/order/update-order";
    }

    @PostMapping("/admin/order/update")
    public String updateOrder(@ModelAttribute("currentOrder") Order currentOrder) {
        this.orderService.updateOrder(currentOrder);
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String getDeleteOrderPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("currentOrder", new Order());
        return "admin/order/delete-order";
    }

    @PostMapping("/admin/order/delete")
    public String deleteOrder(Model model, @ModelAttribute("currentOrder") Product currentOrder) {
        this.orderService.deleteOrderById(currentOrder.getId());
        return "redirect:/admin/order";
    }
}
