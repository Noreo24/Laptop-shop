package vn.noreo.laptopshop.domain.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import vn.noreo.laptopshop.service.validator.RegisterChecked;

// Không phải là 1 entity/table trong database => k viết hàm tạo (constructor), k viết logic xử lý => k dùng @Entity, @Table, ...
@RegisterChecked
public class RegisterDTO {

    @NotBlank(message = "Vui lòng nhập firstName bao gồm chữ cái hoa - thường, số, ký tự!")
    @Size(min = 3, message = "First name phải có tối thiểu 3 ký tự")
    private String firstName;

    @NotBlank(message = "Vui lòng nhập lastName bao gồm chữ cái hoa - thường, số,ký tự!")
    @Size(min = 3, message = "Last name phải có tối thiểu 3 ký tự")
    private String lastName;

    @Email(message = "Email không hợp lệ", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;
    private String password;

    @Size(min = 3, message = "Confirm password phải có tối thiểu 3 ký tự")
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
