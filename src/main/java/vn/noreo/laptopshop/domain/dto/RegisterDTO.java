package vn.noreo.laptopshop.domain.dto;

import vn.noreo.laptopshop.service.validator.RegisterChecked;

// Không phải là 1 entity/table trong database => k viết hàm tạo (constructor), k viết logic xử lý => k dùng @Entity, @Table, ...
@RegisterChecked
public class RegisterDTO {

    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String confirmPassword;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

}
