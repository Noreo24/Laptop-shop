package vn.noreo.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.noreo.laptopshop.domain.User;
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
        List<User> listUsers = this.userService.getAllUsersByEmail("11@gmail.com");
        System.out.println(listUsers);
        model.addAttribute("tuan", "From Controller with Model");
        return "hello";
    }

    @RequestMapping("/admin/user")
    public String getAllUserPage(Model model) {
        List<User> allUsers = userService.getAllUsers();
        model.addAttribute("allUsers", allUsers);
        return "admin/user/view-all-user";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User currentUser = userService.getUserById(id);
        model.addAttribute("currentUser", currentUser);
        return "admin/user/view-user-detail";
    }

    @RequestMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create-user";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUser(Model model, @ModelAttribute("newUser") User newUser) {
        this.userService.handleSaveUser(newUser);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = userService.getUserById(id);
        model.addAttribute("currentUser", currentUser);
        return "admin/user/update-user";
    }

    @PostMapping("/admin/user/update")
    public String updateUser(Model model, @ModelAttribute("currentUser") User currentUser) {
        User userUpdated = this.userService.getUserById(currentUser.getId());
        if (userUpdated != null) {
            userUpdated.setAddress(currentUser.getAddress());
            userUpdated.setFullName(currentUser.getFullName());
            userUpdated.setPhone(currentUser.getPhone());
            this.userService.handleSaveUser(userUpdated);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("currentUser", new User());
        return "admin/user/delete-user";
    }

    @PostMapping("/admin/user/delete")
    public String deleteUser(Model model, @ModelAttribute("currentUser") User currentUser) {
        this.userService.deleteUserById(currentUser.getId());
        return "redirect:/admin/user";
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
