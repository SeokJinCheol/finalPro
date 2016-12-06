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

	@RequestMapping("/siteintro")
	public String siteintro(Model model) {
		model.addAttribute("CONTENT", "menu/menu5/left_menu/siteintro.jsp");
		model.addAttribute("LEFT", "menu/menu5/left.jsp");
		return "main";
	}

	@RequestMapping("/provider")
	public String provider(Model model) {
		model.addAttribute("CONTENT", "menu/menu5/left_menu/provider.jsp");
		model.addAttribute("LEFT", "menu/menu5/left.jsp");
		return "main";
	}

	@RequestMapping("/lender")
	public String lender(Model model) {
		model.addAttribute("CONTENT", "menu/menu5/left_menu/lender.jsp");
		model.addAttribute("LEFT", "menu/menu5/left.jsp");
		return "main";
	}
}