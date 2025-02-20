package vn.noreo.laptopshop.service;

import java.util.List;
// import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.noreo.laptopshop.domain.Product;
import vn.noreo.laptopshop.repository.ProductRepository;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public Product handleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    /*
     * Vì bên Repository không định nghĩa function nào nên nếu muốn dùng hàm
     * findById thì phải trả về Optional
     */
    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProductById(long id) {
        this.productRepository.deleteById(id);
    }
}
