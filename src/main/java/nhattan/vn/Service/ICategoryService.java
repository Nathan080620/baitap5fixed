package nhattan.vn.Service;

import java.util.List;
import java.util.Optional;
import nhattan.vn.entity.Category;

public interface ICategoryService {
    List<Category> findAll();
    List<Category> searchByName(String keyword);
    Category save(Category category);
    Optional<Category> findById(Long id);
    void deleteById(Long id);
}
