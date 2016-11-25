package com.kosta.finalproject.controller.top;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.finalproject.dao.MailImpl;
import com.kosta.finalproject.dao.RegisterBoardDaoImpl;
import com.kosta.finalproject.vo.RegisterBoardVO;

@Controller
public class MypageController {
	@Autowired
	private MailImpl mailImpl;

	@Autowired
	private RegisterBoardDaoImpl registerBoardDaoImpl;
	
	// ���� �뿩 ���
	@RequestMapping("/myrentlist")
	public String myrentlist(Model model) {

		// �α��� ���� Ȯ��
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		// ���� �뿩���
		List<RegisterBoardVO> MyRegisterselect = registerBoardDaoImpl.MyRegisterselect(session_id);

		model.addAttribute("MyRegisterselect", MyRegisterselect);

		model.addAttribute("CONTENT", "join/myrentlist.jsp");
		model.addAttribute("LEFT", "join/mypage_left.jsp");
		return "main";
	}
}
