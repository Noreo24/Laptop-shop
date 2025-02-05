package vn.noreo.laptopshop;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String index() {
        return "Hello World!";
    }

    @GetMapping("/user")
    public String userPage() {
        return "Only USER can access this page!";
    }

    @GetMapping("/admin")
    public String adminPage() {
        return "Only ADMIN can access this page!";
    }
}
