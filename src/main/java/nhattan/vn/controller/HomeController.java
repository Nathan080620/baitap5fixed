package nhattan.vn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping({"/", "/home"})
    public String home() {
        return "web/home";
    }

    @GetMapping("/admin")
    public String admin() {
        return "redirect:/admin/categories";
    }
}