package vn.noreo.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import vn.noreo.laptopshop.service.UserService;

// Mô hình MVC
@Controller
public class UserController {

    // // DI: Dependency injection
    private UserService userService;

    // // Không dùng AutoWired vì không tốt cho test
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        String test = this.userService.handleHello();
        model.addAttribute("noreo", test);
        model.addAttribute("tuan", "From Controller with Model");
        return "hello";
    }
}

// Mô hình restful API
// @RestController
// public class UserController {

// // DI: Dependency injection
// private UserService userService;

// // Không dùng AutoWired vì không tốt cho test
// public UserController(UserService userService) {
// this.userService = userService;
// }

// // Gọi qua Model
// @GetMapping("/")
// public String getHomePage() {
// return this.userService.handleHello();
// }
// }
