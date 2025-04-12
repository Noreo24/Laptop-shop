package vn.noreo.laptopshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.noreo.laptopshop.domain.Order;
import vn.noreo.laptopshop.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findByUser(User user);

    Page<Order> findAll(Pageable pageable); // Phân trang tất cả đơn hàng

    // Page<Order> findByUser(User user, Pageable pageable); // Phân trang đơn hàng
    // của 1 user

    // List<Order> findByStatus(String status); // Tìm kiếm đơn hàng theo trạng thái

    // List<Order> findByStatusAndUser(String status, User user); // Tìm kiếm đơn
    // hàng theo trạng thái và user
}
