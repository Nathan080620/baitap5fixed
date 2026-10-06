package nhattan.vn.entity;

import java.io.Serializable;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Username không được để trống")
    @Size(max = 50, message = "Username tối đa 50 ký tự")
    @Column(name = "username", length = 50, unique = true, nullable = false)
    private String username;

    @NotBlank(message = "Email không được để trống")
    @Email(message = "Email không hợp lệ")
    @Size(max = 100, message = "Email tối đa 100 ký tự")
    @Column(name = "email", length = 100, unique = true, nullable = false)
    private String email;

    // Lưu dạng BCrypt hash. Kiểm tra "bắt buộc nhập" được xử lý trong UserController
    // (khi sửa user, để trống = giữ nguyên mật khẩu cũ).
    @Column(name = "password", length = 255, nullable = false)
    private String password;

    @Size(max = 100, message = "Họ tên tối đa 100 ký tự")
    @Column(name = "fullname", columnDefinition = "NVARCHAR(100)")
    private String fullname;

    @Pattern(regexp = "ADMIN|USER", message = "Vai trò phải là ADMIN hoặc USER")
    @Column(name = "role", length = 20)
    private String role = "USER";

    public User() {
    }

    public User(Long id, String username, String email, String password, String fullname, String role) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.fullname = fullname;
        this.role = role;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
