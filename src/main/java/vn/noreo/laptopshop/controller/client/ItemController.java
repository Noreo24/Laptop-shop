package vn.noreo.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.noreo.laptopshop.domain.Cart;
import vn.noreo.laptopshop.domain.CartDetail;
import vn.noreo.laptopshop.domain.Order;
import vn.noreo.laptopshop.domain.Product;
import vn.noreo.laptopshop.domain.User;
import vn.noreo.laptopshop.service.OrderService;
import vn.noreo.laptopshop.service.ProductService;

@Controller
public class ItemController {

    private final ProductService productService;
    private final OrderService orderService;

    public ItemController(ProductService productService, OrderService orderService) {
        this.productService = productService;
        this.orderService = orderService;
    }

    // View product detail - User
    @GetMapping("/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.getProductById(id);
        model.addAttribute("currentProduct", currentProduct);
        return "client/product/view-product-detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(HttpServletRequest request, @PathVariable long id) {
        HttpSession session = request.getSession(false);

        long productId = id;
        String email = (String) session.getAttribute("email");

        this.productService.handleAddProductToCart(email, productId, session, 1);
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User newUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        newUser.setId(id);

        Cart cart = this.productService.getCartByUser(newUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice = totalPrice + cartDetail.getPrice() * cartDetail.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);

        return "client/cart/view-cart";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleRemoveCartDetail(cartDetailId, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckOutPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.getCartByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice = totalPrice + cd.getPrice() * cd.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(
            HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone) {
        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone);

        return "redirect:/thanks";
    }

    @GetMapping("/thanks")
    public String getThanksPage(Model model) {
        return "client/cart/thanks";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        List<Order> orders = this.orderService.getOrdersByUser(currentUser);
        model.addAttribute("orders", orders);
        return "client/cart/order-history";
    }

    @PostMapping("/add-product-to-cart-from-product-detail")
    public String handleAddToCartFromProductDetail(@RequestParam("id") long id, @RequestParam("quantity") long quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, id, session, quantity);
        return "redirect:/product/" + id;
    }

    @GetMapping("/all-products")
    public String getAllProductsPage(Model model, @RequestParam("page") Optional<String> pageOptional,
            @RequestParam("name") Optional<String> nameOptional,
            @RequestParam("min-price") Optional<String> minPriceOptional,
            @RequestParam("max-price") Optional<String> maxPriceOptional,
            @RequestParam("factory") Optional<String> factoryOptional,
            @RequestParam("price-range") Optional<String> priceRangeOptional) {

        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (NumberFormatException e) {
        }

        Pageable pageable = PageRequest.of(page - 1, 6);

        String name = nameOptional.isPresent() ? nameOptional.get() : "";
        double minPrice = minPriceOptional.isPresent() ? Double.parseDouble(minPriceOptional.get()) : 0;
        double maxPrice = maxPriceOptional.isPresent() ? Double.parseDouble(maxPriceOptional.get()) : 0;
        String factory = factoryOptional.isPresent() ? factoryOptional.get() : "";
        String priceRange = priceRangeOptional.isPresent() ? priceRangeOptional.get() : "";
        ;
        // Page<Product> products = this.productService.getAllProductsByName(pageable,
        // name);
        // Case 1: search by min price
        // Page<Product> products =
        // this.productService.getAllProductsByMinPrice(pageable, minPrice);
        // Case 2: search by max price
        // Page<Product> products =
        // this.productService.getAllProductsByMaxPrice(pageable, maxPrice);
        // Case 3: search by factory
        // Page<Product> products =
        // this.productService.getAllProductsByFactory(pageable, factory);
        // Case 4: search by list factory
        // List<String> listFactory = Arrays.asList(factoryOptional.get().split(","));
        // Page<Product> products =
        // this.productService.getAllProductsByFactorys(pageable, listFactory);
        // Case 5: search by price range
        Page<Product> products = this.productService.getAllProductsByPriceRange(pageable, priceRange);

        List<Product> allProducts = products.getContent();

        model.addAttribute("allProducts", allProducts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());
        return "client/product/view-all-products";
    }

}
