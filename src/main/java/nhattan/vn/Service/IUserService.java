package nhattan.vn.Service;

import java.util.List;
import java.util.Optional;
import nhattan.vn.entity.User;

public interface IUserService {
    List<User> findAll();
    List<User> search(String keyword);
    User save(User user);
    Optional<User> findById(Long id);
    void deleteById(Long id);


    boolean isUsernameTaken(String username, Long excludeId);
    boolean isEmailTaken(String email, Long excludeId);
}
