package vn.noreo.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.noreo.laptopshop.domain.Cart;
import vn.noreo.laptopshop.domain.CartDetail;
import vn.noreo.laptopshop.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {

    // Check sản phẩm đã có trong cart hay chưa
    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);

    // CartDetail findById(long id);
}
