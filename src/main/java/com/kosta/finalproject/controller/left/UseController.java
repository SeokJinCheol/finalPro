package com.kosta.finalproject.controller.left;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UseController {

	@RequestMapping("/use")
	public String use(Model model) {
		model.addAttribute("CONTENT", "menu/menu5/left_menu/use.jsp");
		model.addAttribute("LEFT", "menu/menu5/left.jsp");
		return "main";
	}

	@RequestMapping("/rule")
	public String rule(Model model) {
		model.addAttribute("CONTENT", "menu/menu5/left_menu/rule.jsp");
		model.addAttribute("LEFT", "menu/menu5/left.jsp");
		return "main";
	}

	@RequestMapping("/menu5_3")
	public String menu5_3(Model model) {
		model.addAttribute("CONTENT", "menu/menu5/left_menu/menu5_3.jsp");
		model.addAttribute("LEFT", "menu/menu5/left.jsp");
		return "main";
	}

	@RequestMapping("/menu5_4")
	public String menu5_4(Model model) {
		model.addAttribute("CONTENT", "menu/menu5/left_menu/menu5_4.jsp");
		model.addAttribute("LEFT", "menu/menu5/left.jsp");
		return "main";
	}

	@RequestMapping("/menu5_5")
	public String menu5_5(Model model) {
		model.addAttribute("CONTENT", "menu/menu5/left_menu/menu5_5.jsp");
		model.addAttribute("LEFT", "menu/menu5/left.jsp");
		return "main";
	}

}
