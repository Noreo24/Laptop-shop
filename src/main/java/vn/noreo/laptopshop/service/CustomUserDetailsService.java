package vn.noreo.laptopshop.service;

import java.util.Collections;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
// import vn.noreo.laptopshop.domain.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private UserService userService;

    public CustomUserDetailsService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        // Cách import để tránh trùng lặp
        vn.noreo.laptopshop.domain.User user = this.userService.getUserByEmail(username);
        if (user == null) {
            /*
             * Không để hiển thị ("User not found!") vì hacker có thể biết được user có
             * tồn tại trong db hay không
             */
            throw new UsernameNotFoundException("User not found!");
        }

        return new User(
                user.getEmail(),
                user.getPassword(),
                Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER")));
    }

}
