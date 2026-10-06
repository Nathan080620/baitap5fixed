package nhattan.vn.Service.Impl;

import java.util.List;
import java.util.Optional;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import nhattan.vn.Service.ICategoryService;
import nhattan.vn.entity.Category;
import nhattan.vn.repository.ICategoryRepository;

@Service
public class CategoryService implements ICategoryService {

    private final ICategoryRepository categoryRepository;

    public CategoryService(ICategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll(Sort.by("id"));
    }

    @Override
    public List<Category> searchByName(String keyword) {
        if (keyword != null && !keyword.isBlank()) {
            return categoryRepository.findByNameContainingIgnoreCase(keyword.trim(), Sort.by("id"));
        }
        return findAll();
    }

    @Override
    public Category save(Category category) {
        return categoryRepository.save(category);
    }

    @Override
    public Optional<Category> findById(Long id) {
        return categoryRepository.findById(id);
    }

    @Override
    public void deleteById(Long id) {
        categoryRepository.deleteById(id);
    }
}
