package vn.noreo.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.noreo.laptopshop.domain.Order;
import vn.noreo.laptopshop.domain.OrderDetail;
import vn.noreo.laptopshop.domain.User;
import vn.noreo.laptopshop.repository.OrderDetailRepository;
import vn.noreo.laptopshop.repository.OrderRepository;

@Service
public class OrderService {

    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<Order> getAllOrders() {
        return this.orderRepository.findAll();
    }

    public List<Order> getOrdersByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

    public Order getOrderById(long id) {
        Optional<Order> orderOptional = this.orderRepository.findById(id);
        if (orderOptional.isPresent()) {
            return orderOptional.get();
        } else {
            return null;
        }
    }

    public void deleteOrderById(long id) {
        Optional<Order> orderOptional = this.orderRepository.findById(id);
        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            List<OrderDetail> orderDetails = currentOrder.getOrderDetails();
            for (OrderDetail od : orderDetails) {
                this.orderDetailRepository.deleteById(od.getId());
            }
            this.orderRepository.deleteById(id);
        }
    }

    public void updateOrder(Order order) {
        Optional<Order> orderOptional = this.orderRepository.findById(order.getId());
        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }

    public long countOrders() {
        return this.orderRepository.count();
    }
}
