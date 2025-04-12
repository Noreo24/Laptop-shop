package vn.noreo.laptopshop.controller.client;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.validation.Valid;
import vn.noreo.laptopshop.domain.Product;
import vn.noreo.laptopshop.domain.User;
import vn.noreo.laptopshop.domain.dto.RegisterDTO;
import vn.noreo.laptopshop.service.ProductService;
import vn.noreo.laptopshop.service.UserService;

@Controller
public class HomepageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public HomepageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/")
    public String getHomepage(Model model) {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Product> products = this.productService.getAllProducts(pageable);
        List<Product> allProducts = products.getContent();
        model.addAttribute("allProducts", allProducts);
        return "client/homepage/homepage";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {
        /*
         * Dùng BindingResult tự động báo lỗi qua view, k cần định nghĩa biến để truyền
         * qua view nữa
         */

        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User newUser = this.userService.RegisterDTOToUser(registerDTO);

        String hashPassword = this.passwordEncoder.encode(newUser.getPassword());

        newUser.setPassword(hashPassword);
        newUser.setRole(this.userService.getRoleByName("USER"));

        this.userService.handleSaveUser(newUser);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getAccessDenyPage(Model model) {
        return "client/auth/access-deny";
    }
}
