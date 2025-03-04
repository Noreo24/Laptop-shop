package vn.noreo.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.noreo.laptopshop.domain.Cart;
import vn.noreo.laptopshop.domain.CartDetail;
import vn.noreo.laptopshop.domain.Product;
import vn.noreo.laptopshop.domain.User;
import vn.noreo.laptopshop.service.ProductService;

@Controller
public class ItemController {

    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
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

        this.productService.handleAddProductToCart(email, productId, session);
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

        return "client/cart/view-cart";
    }
}
