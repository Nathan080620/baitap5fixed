package nhattan.vn.configuration;

import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import nhattan.vn.entity.Category;
import nhattan.vn.entity.User;
import nhattan.vn.repository.ICategoryRepository;
import nhattan.vn.repository.IUserRepository;
@Component
public class DataInitializer implements CommandLineRunner {

    private final ICategoryRepository categoryRepository;
    private final IUserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public DataInitializer(ICategoryRepository categoryRepository,
                           IUserRepository userRepository,
                           PasswordEncoder passwordEncoder) {
        this.categoryRepository = categoryRepository;
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) {
        if (categoryRepository.count() == 0) {
            categoryRepository.save(new Category(null, "Lập trình Java"));
            categoryRepository.save(new Category(null, "Công nghệ thông tin"));
            categoryRepository.save(new Category(null, "Điện thoại & Phụ kiện"));
            categoryRepository.save(new Category(null, "Sách giáo trình"));
        }
        if (userRepository.count() == 0) {
            userRepository.save(new User(null, "admin", "admin@gmail.com",
                    passwordEncoder.encode("123456"), "Quản Trị Viên", "ADMIN"));
            userRepository.save(new User(null, "nhattan", "nhattan@gmail.com",
                    passwordEncoder.encode("123456"), "Phạm Nhật Tân", "USER"));
        }
    }
}
