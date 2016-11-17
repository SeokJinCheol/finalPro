package com.kosta.finalproject.controller.left;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LeftController3 {
	
	@RequestMapping("/menu3_1")
	public String menu3_1(Model model) {
		model.addAttribute("CONTENT", "menu/menu3/left_menu/menu3_1.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	@RequestMapping("/menu3_2")
	public String menu3_2(Model model) {
		model.addAttribute("CONTENT", "menu/menu3/left_menu/menu3_2.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	@RequestMapping("/menu3_3")
	public String menu3_3(Model model) {
		model.addAttribute("CONTENT", "menu/menu3/left_menu/menu3_3.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	@RequestMapping("/menu3_4")
	public String menu3_4(Model model) {
		model.addAttribute("CONTENT", "menu/menu3/left_menu/menu3_4.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	@RequestMapping("/menu3_5")
	public String menu3_5(Model model) {
		model.addAttribute("CONTENT", "menu/menu3/left_menu/menu3_5.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}
}
