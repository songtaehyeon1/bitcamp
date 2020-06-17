package kr.co.bitcamp.category;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CategoryController {
	//¸®½ºÆ®
	@RequestMapping("/list")
	public String loginFrm() {
		return "category/list";
	}
}
