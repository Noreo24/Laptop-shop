package vn.noreo.laptopshop.service;

import java.util.List;
// import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.noreo.laptopshop.domain.Cart;
import vn.noreo.laptopshop.domain.CartDetail;
import vn.noreo.laptopshop.domain.Product;
import vn.noreo.laptopshop.domain.User;
import vn.noreo.laptopshop.repository.CartDetailRepository;
import vn.noreo.laptopshop.repository.CartRepository;
import vn.noreo.laptopshop.repository.ProductRepository;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
    }

    public Product handleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public List<Product> getAllProducts() {
        return this.productRepository.findAll();
    }

    /*
     * Vì bên Repository nếu không định nghĩa function findById nên nếu muốn dùng
     * hàm
     * findById thì phải trả về Optional
     */
    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProductById(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session) {

        // Lấy thông tin user
        User user = this.userService.getUserByEmail(email);

        if (user != null) {

            // Check user đã có cart hay chưa
            Cart cart = this.cartRepository.findByUser(user);

            // Tạo mới cart nếu user chưa có
            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(0);

                cart = this.cartRepository.save(newCart);
            }

            // Lưu cart_detail
            /* B1: Tìm product by id */
            Product product = this.productRepository.findById(productId);

            /*
             * B2: Check sản phẩm đã từng được thêm vào giỏ hàng hay chưa, nếu đã có thì
             * update quantity trong cart_detail
             */
            CartDetail oldCartDetail = this.cartDetailRepository.findByCartAndProduct(cart, product);
            /*
             * B3: Lưu vào cart_detail nếu là product mới tăng quantity lên 1
             */
            if (oldCartDetail == null) {
                CartDetail newCartDetail = new CartDetail();
                newCartDetail.setCart(cart);
                newCartDetail.setProduct(product);
                newCartDetail.setPrice(product.getPrice());
                newCartDetail.setQuantity(1);

                this.cartDetailRepository.save(newCartDetail);

                // Update sum trong cart và hiển thị lên giao diện
                int sum = cart.getSum() + 1;
                cart.setSum(cart.getSum() + 1);
                this.cartRepository.save(cart);
                session.setAttribute("sum", sum);
            } else {
                /*
                 * Vì sum chỉ tăng khi thêm mặt hàng mới chứ không tăng khi thêm số lượng của
                 * cùng 1 mặt hàng nên sẽ không update sum ở vòng else, khi nó dùng để tăng số
                 * lượng của 1 mặt hàng
                 */
                oldCartDetail.setQuantity(oldCartDetail.getQuantity() + 1);

                this.cartDetailRepository.save(oldCartDetail);
            }
        }
    }

    public Cart getCartByUser(User user) {
        return this.cartRepository.findByUser(user);
    }
}
