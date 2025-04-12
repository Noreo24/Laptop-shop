package vn.noreo.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.noreo.laptopshop.domain.Order;
import vn.noreo.laptopshop.domain.Product;
import vn.noreo.laptopshop.service.OrderService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrderController {

    public final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getAllOrderPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (NumberFormatException e) {
        }

        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Order> allOrders = this.orderService.getAllOrders(pageable);
        List<Order> allOrdersPaging = allOrders.getContent();
        model.addAttribute("allOrders", allOrdersPaging);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", allOrders.getTotalPages());
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
