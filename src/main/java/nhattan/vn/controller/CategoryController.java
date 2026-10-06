package nhattan.vn.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import jakarta.validation.Valid;
import nhattan.vn.Service.ICategoryService;
import nhattan.vn.entity.Category;

@Controller
@RequestMapping("/admin/categories")
public class CategoryController {

    private final ICategoryService categoryService;

    public CategoryController(ICategoryService categoryService) {
        this.categoryService = categoryService;
    }

    // READ + SEARCH
    @GetMapping("")
    public String list(Model model, @RequestParam(name = "keyword", required = false) String keyword) {
        List<Category> list = categoryService.searchByName(keyword);
        model.addAttribute("categories", list);
        model.addAttribute("keyword", keyword);
        return "admin/categories/list";
    }

    // CREATE (form)
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("category", new Category());
        return "admin/categories/addOrEdit";
    }

    // UPDATE (form)
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model, RedirectAttributes ra) {
        return categoryService.findById(id).map(category -> {
            model.addAttribute("category", category);
            return "admin/categories/addOrEdit";
        }).orElseGet(() -> {
            ra.addFlashAttribute("error", "Category không tồn tại!");
            return "redirect:/admin/categories";
        });
    }

    // CREATE + UPDATE (submit)
    @PostMapping("/save")
    public String save(@Valid @ModelAttribute("category") Category category,
                       BindingResult result, RedirectAttributes ra) {
        if (category.getId() != null && categoryService.findById(category.getId()).isEmpty()) {
            ra.addFlashAttribute("error", "Category không tồn tại!");
            return "redirect:/admin/categories";
        }
        if (result.hasErrors()) {
            return "admin/categories/addOrEdit";
        }
        boolean isNew = category.getId() == null;
        categoryService.save(category);
        ra.addFlashAttribute("message", isNew ? "Thêm thể loại thành công!" : "Cập nhật thể loại thành công!");
        return "redirect:/admin/categories";
    }

    // DELETE (POST, không dùng GET để tránh bị xóa nhầm qua link)
    @PostMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id, RedirectAttributes ra) {
        if (categoryService.findById(id).isPresent()) {
            categoryService.deleteById(id);
            ra.addFlashAttribute("message", "Xóa thể loại thành công!");
        } else {
            ra.addFlashAttribute("error", "Category không tồn tại!");
        }
        return "redirect:/admin/categories";
    }
}
