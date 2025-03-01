package vn.noreo.laptopshop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.DispatcherType;
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

    @Bean
    public AuthenticationSuccessHandler customSuccessHandler() {
        return new CustomSuccessHandler();
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(authorize -> authorize
                        .dispatcherTypeMatchers(DispatcherType.FORWARD,
                                DispatcherType.INCLUDE)
                        .permitAll()

                        .requestMatchers("/", "/login", "/product/**", "/client/**", "/css/**", "/js/**",
                                "/images/**")
                        .permitAll()

                        // hasRole tự động bỏ tiền tố ROLE_ => ROLE_ADMIN = ADMIN
                        .requestMatchers("/admin/**").hasRole("ADMIN")

                        .anyRequest().authenticated())

                .formLogin(formLogin -> formLogin
                        .loginPage("/login")
                        .failureUrl("/login?error")
                        .successHandler(customSuccessHandler())
                        .permitAll())
                // Chuyển đến trang access-deny.jsp nếu dính lỗi 403: không có quyền truy cập
                .exceptionHandling(exception -> exception.accessDeniedPage("/access-deny"));
        return http.build();
    }
}
