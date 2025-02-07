package vn.noreo.laptopshop.service;

import org.springframework.stereotype.Service;

import vn.noreo.laptopshop.domain.User;
import vn.noreo.laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public String handleHello() {
        return "Hello from service";
    }

    public User handleSaveUser(User user) {
        User u = this.userRepository.save(user);
        System.out.println("Create user: " + u);
        return u;
    }
}
