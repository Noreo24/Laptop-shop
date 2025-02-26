package vn.noreo.laptopshop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import vn.noreo.laptopshop.service.CustomUserDetailsService;
import vn.noreo.laptopshop.service.UserService;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfig {

    // Khai báo, nói với Spring là dùng BCryptPasswordEncoder trong dự án
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /*
     * Khai báo, nói với Spring là dùng CustomUserDetailsService (ghi đè
     * UserDetailsService của Spring) trong dự án
     */
    @Bean
    public UserDetailsService userDetailsService(UserService userService) {
        return new CustomUserDetailsService(userService);
    }

    // Quản lý, sử dụng vào trong dự án các sự kiện dc khai báo bên trên
    @Bean
    public DaoAuthenticationProvider authProvider(
            PasswordEncoder passwordEncoder,
            UserDetailsService userDetailsService) {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder);
        /*
         * Câu lệnh dưới để hiển thị UsernameNotFoundException trong
         * CustomUserDetailsService.java (User not found), còn off câu lệnh sẽ hiển thị
         * mặc định
         */
        // authProvider.setHideUserNotFoundExceptions(false);
        return authProvider;
    }
}
