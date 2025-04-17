package vn.noreo.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.noreo.laptopshop.domain.Cart;
import vn.noreo.laptopshop.domain.CartDetail;
import vn.noreo.laptopshop.domain.Order;
import vn.noreo.laptopshop.domain.OrderDetail;
import vn.noreo.laptopshop.domain.Product;
import vn.noreo.laptopshop.domain.User;
import vn.noreo.laptopshop.domain.dto.ProductCriteriaDTO;
import vn.noreo.laptopshop.repository.CartDetailRepository;
import vn.noreo.laptopshop.repository.CartRepository;
import vn.noreo.laptopshop.repository.OrderDetailRepository;
import vn.noreo.laptopshop.repository.OrderRepository;
import vn.noreo.laptopshop.repository.ProductRepository;
import vn.noreo.laptopshop.service.specification.ProductSpecs;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderDetailRepository orderDetailRepository;
    private final OrderRepository orderRepository;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService,
            OrderDetailRepository orderDetailRepository, OrderRepository orderRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Product handleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    public Page<Product> getAllProducts(Pageable pageable) {
        return this.productRepository.findAll(pageable);
    }

    public Page<Product> getAllProductsWithSpec(Pageable pageable, ProductCriteriaDTO productCriteriaDTO) {

        if (productCriteriaDTO.getTarget() == null
                && productCriteriaDTO.getFactory() == null
                && productCriteriaDTO.getPrice() == null) {
            return this.productRepository.findAll(pageable);
        }

        Specification<Product> combinedSpec = Specification.where(null);

        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            Specification<Product> targetSpec = ProductSpecs.searchByListTarget(productCriteriaDTO.getTarget().get());
            combinedSpec = combinedSpec.and(targetSpec);
        }

        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            Specification<Product> factorySpec = ProductSpecs
                    .searchByListFactory(productCriteriaDTO.getFactory().get());
            combinedSpec = combinedSpec.and(factorySpec);
        }

        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> priceSpec = this.buildPriceSpec(productCriteriaDTO.getPrice().get());
            combinedSpec = combinedSpec.and(priceSpec);
        }

        return this.productRepository.findAll(combinedSpec, pageable);
    }

    public Specification<Product> buildPriceSpec(List<String> listPriceRange) {
        Specification<Product> combinedSpec = (root, query, criteriaBuilder) -> criteriaBuilder.disjunction();

        for (String p : listPriceRange) {
            double minPrice = 0;
            double maxPrice = 0;

            switch (p) {
                case "duoi-10-trieu":
                    minPrice = 0;
                    maxPrice = 10000000;
                    break;
                case "10-15-trieu":
                    minPrice = 10000000;
                    maxPrice = 15000000;
                    break;
                case "15-20-trieu":
                    minPrice = 15000000;
                    maxPrice = 20000000;
                    break;
                case "tren-20-trieu":
                    minPrice = 20000000;
                    maxPrice = 300000000;
                    break;
            }

            if (minPrice != 0 && maxPrice != 0) {
                Specification<Product> rangeSpec = ProductSpecs.searchByPriceRanges(minPrice,
                        maxPrice);
                combinedSpec = combinedSpec.or(rangeSpec);
                /*
                 * combineSpec = combineSpec.or(rangeSpec);: Dùng or để
                 * "price-range=15-toi-20-trieu,20-" vẫn chạy dc và chỉ trả ra kết quả trong
                 * case "15-toi-20-trieu",
                 * nếu không dùng or thì phải là
                 * "price-range=15-toi-20-trieu,20-30-trieu" mới chạy dc và trả ra 2 kết quả
                 * case "15-toi-20-trieu" và "20-toi-30-trieu"
                 */
            }
        }
        return combinedSpec;
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

    public void handleAddProductToCart(String email, long productId, HttpSession session, long quantity) {

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
                newCartDetail.setQuantity(quantity);

                this.cartDetailRepository.save(newCartDetail);

                // Update sum trong cart và hiển thị lên giao diện
                int sum = cart.getSum() + 1;
                cart.setSum(sum);
                this.cartRepository.save(cart);
                session.setAttribute("sum", sum);
            } else {
                /*
                 * Vì sum chỉ tăng khi thêm mặt hàng mới chứ không tăng khi thêm số lượng của
                 * cùng 1 mặt hàng nên sẽ không update sum ở vòng else, khi nó dùng để tăng số
                 * lượng của 1 mặt hàng
                 */
                oldCartDetail.setQuantity(oldCartDetail.getQuantity() + quantity);

                this.cartDetailRepository.save(oldCartDetail);
            }
        }
    }

    public Cart getCartByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();

            Cart currentCart = cartDetail.getCart();
            User currentUser = currentCart.getUser();
            currentUser.setCart(null);

            // delete cart-detail
            this.cartDetailRepository.deleteById(cartDetailId);

            // update cart
            if (currentCart.getSum() > 1) {
                // update current cart
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                // delete cart (sum = 1)
                this.cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
            }
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    public void handlePlaceOrder(
            User user, HttpSession session,
            String receiverName, String receiverAddress, String receiverPhone) {

        // step 1: get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();

            if (cartDetails != null) {

                // create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiveName(receiverName);
                order.setReceiveAddress(receiverAddress);
                order.setReceivePhone(receiverPhone);
                order.setStatus("PENDING");

                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    sum += cd.getPrice() * cd.getQuantity();
                }
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                // create orderDetail

                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());

                    this.orderDetailRepository.save(orderDetail);
                }

                // step 2: delete cart_detail and cart
                for (CartDetail cd : cartDetails) {
                    this.cartDetailRepository.deleteById(cd.getId());
                }

                User currentUser = cart.getUser();
                currentUser.setCart(null);
                this.cartRepository.deleteById(cart.getId());

                // step 3 : update session
                session.setAttribute("sum", 0);
            }
        }
    }

    public long countProducts() {
        return this.productRepository.count();
    }
}
