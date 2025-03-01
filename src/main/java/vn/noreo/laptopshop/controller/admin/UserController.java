package vn.noreo.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.noreo.laptopshop.domain.User;
import vn.noreo.laptopshop.service.UploadService;
import vn.noreo.laptopshop.service.UserService;

// Mô hình MVC
@Controller
public class UserController {

    // // DI: Dependency injection
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    // // Không dùng Autowired vì không tốt cho test
    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        model.addAttribute("noreo", "test");
        List<User> listUsers = this.userService.getAllUsersByEmail("11@gmail.com");
        System.out.println(listUsers);
        model.addAttribute("tuan", "From Controller with Model");
        return "hello";
    }

    @GetMapping("/admin/user")
    public String getAllUserPage(Model model) {
        List<User> allUsers = userService.getAllUsers();
        model.addAttribute("allUsers", allUsers);
        return "admin/user/view-all-user";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User currentUser = userService.getUserById(id);
        model.addAttribute("currentUser", currentUser);
        return "admin/user/view-user-detail";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create-user";
    }

    /*
     * @RequestParam lấy ở ô input có name = avatarFile trong
     * create-user.jsp
     */
    @PostMapping(value = "/admin/user/create")
    public String createUser(Model model, @ModelAttribute("newUser") @Valid User newUser,
            BindingResult newUserBindingResult,
            @RequestParam("avatarFile") MultipartFile file) {

        // Validate
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create-user";
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(newUser.getPassword());

        newUser.setAvatar(avatar);
        newUser.setPassword(hashPassword);
        newUser.setRole(this.userService.getRoleByName(newUser.getRole().getName()));

        this.userService.handleSaveUser(newUser);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = userService.getUserById(id);
        model.addAttribute("currentUser", currentUser);
        return "admin/user/update-user";
    }

    @PostMapping("/admin/user/update")
    public String updateUser(Model model, @ModelAttribute("currentUser") @Valid User currentUser,
            BindingResult currentUserBindingResult,
            @RequestParam("updateAvatarFile") MultipartFile file) {

        if (currentUserBindingResult.hasErrors()) {
            return "admin/user/update-user";
        }

        User userUpdated = this.userService.getUserById(currentUser.getId());
        if (userUpdated != null) {
            if (!file.isEmpty()) {
                String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
                userUpdated.setAvatar(avatar);
            }

            userUpdated.setAddress(currentUser.getAddress());
            userUpdated.setFullName(currentUser.getFullName());
            userUpdated.setPhone(currentUser.getPhone());
            userUpdated.setRole(this.userService.getRoleByName(currentUser.getRole().getName()));
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
