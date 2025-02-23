package vn.noreo.laptopshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import vn.noreo.laptopshop.domain.Product;
import vn.noreo.laptopshop.domain.dto.RegisterDTO;
import vn.noreo.laptopshop.service.ProductService;

@Controller
public class HomepageController {

    private final ProductService productService;

    public HomepageController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/")
    public String getHomepage(Model model) {
        List<Product> allProducts = this.productService.getAllProducts();
        model.addAttribute("allProducts", allProducts);
        return "client/homepage/homepage";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerUser") RegisterDTO registerDTO) {

        return "client/auth/register";
    }
}
