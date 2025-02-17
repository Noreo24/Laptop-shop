package vn.noreo.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.noreo.laptopshop.domain.Role;
import vn.noreo.laptopshop.domain.User;
import vn.noreo.laptopshop.repository.RoleRepository;
import vn.noreo.laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public User handleSaveUser(User user) {
        User u = this.userRepository.save(user);
        System.out.println("Create user: " + u);
        return u;
    }

    public void deleteUserById(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String roleName) {
        return this.roleRepository.findByName(roleName);
    }
}
