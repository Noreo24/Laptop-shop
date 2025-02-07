package vn.noreo.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.noreo.laptopshop.domain.User;
import vn.noreo.laptopshop.repository.UserRepository;
import vn.noreo.laptopshop.service.UserService;

// Mô hình MVC
@Controller
public class UserController {

    // // DI: Dependency injection
    private final UserService userService;

    // // Không dùng Autowired vì không tốt cho test
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        model.addAttribute("noreo", "test");
        model.addAttribute("tuan", "From Controller with Model");
        return "hello";
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(Model model, @ModelAttribute("newUser") User noreo) {
        System.out.println("Run here" + noreo);
        this.userService.handleSaveUser(noreo);
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
