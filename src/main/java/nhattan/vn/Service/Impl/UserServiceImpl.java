package nhattan.vn.Service.Impl;

import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import nhattan.vn.Service.IUserService;
import nhattan.vn.entity.User;
import nhattan.vn.repository.IUserRepository;

@Service
public class UserServiceImpl implements IUserService {

    private final IUserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserServiceImpl(IUserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll(Sort.by("id"));
    }

    @Override
    public List<User> search(String keyword) {
        if (keyword != null && !keyword.isBlank()) {
            String k = keyword.trim();
            return userRepository
                    .findByUsernameContainingIgnoreCaseOrEmailContainingIgnoreCaseOrFullnameContainingIgnoreCase(
                            k, k, k, Sort.by("id"));
        }
        return findAll();
    }

    /**
     * Thêm mới: mã hóa mật khẩu nhập vào.
     * Cập nhật: nếu để trống mật khẩu thì giữ nguyên mật khẩu cũ, ngược lại mã hóa mật khẩu mới.
     */
    @Override
    @Transactional
    public User save(User user) {
        boolean blankPassword = user.getPassword() == null || user.getPassword().isBlank();
        if (user.getId() != null && blankPassword) {
            User old = userRepository.findById(user.getId())
                    .orElseThrow(() -> new IllegalArgumentException("User không tồn tại"));
            user.setPassword(old.getPassword());
        } else {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
        }
        return userRepository.save(user);
    }

    @Override
    public Optional<User> findById(Long id) {
        return userRepository.findById(id);
    }

    @Override
    public void deleteById(Long id) {
        userRepository.deleteById(id);
    }

    @Override
    public boolean isUsernameTaken(String username, Long excludeId) {
        if (username == null || username.isBlank()) {
            return false;
        }
        String u = username.trim();
        return excludeId == null
                ? userRepository.existsByUsernameIgnoreCase(u)
                : userRepository.existsByUsernameIgnoreCaseAndIdNot(u, excludeId);
    }

    @Override
    public boolean isEmailTaken(String email, Long excludeId) {
        if (email == null || email.isBlank()) {
            return false;
        }
        String e = email.trim();
        return excludeId == null
                ? userRepository.existsByEmailIgnoreCase(e)
                : userRepository.existsByEmailIgnoreCaseAndIdNot(e, excludeId);
    }
}
