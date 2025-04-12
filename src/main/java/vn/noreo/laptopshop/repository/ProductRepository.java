package vn.noreo.laptopshop.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.noreo.laptopshop.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    // Không cần viết function vì spring đã có sẵn rồi
    // Product save(Product product);

    // List<Product> findAll();

    Product findById(long id);

    Page<Product> findAll(Pageable page);
}
