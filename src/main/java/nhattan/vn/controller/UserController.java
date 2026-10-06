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
import nhattan.vn.Service.IUserService;
import nhattan.vn.entity.User;

@Controller
@RequestMapping("/admin/users")
public class UserController {

    private final IUserService userService;

    public UserController(IUserService userService) {
        this.userService = userService;
    }

    // READ + SEARCH (username / email / họ tên)
    @GetMapping("")
    public String list(Model model, @RequestParam(name = "keyword", required = false) String keyword) {
        List<User> list = userService.search(keyword);
        model.addAttribute("users", list);
        model.addAttribute("keyword", keyword);
        return "admin/users/list";
    }

    // CREATE (form)
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("user", new User());
        return "admin/users/addOrEdit";
    }

    // UPDATE (form) - không hiển thị lại mật khẩu
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model, RedirectAttributes ra) {
        return userService.findById(id).map(user -> {
            user.setPassword(null);
            model.addAttribute("user", user);
            return "admin/users/addOrEdit";
        }).orElseGet(() -> {
            ra.addFlashAttribute("error", "User không tồn tại!");
            return "redirect:/admin/users";
        });
    }

    // CREATE + UPDATE (submit)
    @PostMapping("/save")
    public String save(@Valid @ModelAttribute("user") User user,
                       BindingResult result, RedirectAttributes ra) {
        boolean isNew = user.getId() == null;

        if (!isNew && userService.findById(user.getId()).isEmpty()) {
            ra.addFlashAttribute("error", "User không tồn tại!");
            return "redirect:/admin/users";
        }
        if (isNew && (user.getPassword() == null || user.getPassword().isBlank())) {
            result.rejectValue("password", "NotBlank", "Mật khẩu không được để trống");
        }
        if (userService.isUsernameTaken(user.getUsername(), user.getId())) {
            result.rejectValue("username", "Duplicate", "Username đã tồn tại");
        }
        if (userService.isEmailTaken(user.getEmail(), user.getId())) {
            result.rejectValue("email", "Duplicate", "Email đã tồn tại");
        }
        if (result.hasErrors()) {
            return "admin/users/addOrEdit";
        }

        userService.save(user);
        ra.addFlashAttribute("message", isNew ? "Thêm người dùng thành công!" : "Cập nhật người dùng thành công!");
        return "redirect:/admin/users";
    }

    // DELETE (POST)
    @PostMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id, RedirectAttributes ra) {
        if (userService.findById(id).isPresent()) {
            userService.deleteById(id);
            ra.addFlashAttribute("message", "Xóa người dùng thành công!");
        } else {
            ra.addFlashAttribute("error", "User không tồn tại!");
        }
        return "redirect:/admin/users";
    }
}
