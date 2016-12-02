package com.kosta.finalproject.controller.top;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.finalproject.dao.MailImpl;
import com.kosta.finalproject.dao.RegisterBoardDaoImpl;
import com.kosta.finalproject.dao.RequestBoardDaoImpl;
import com.kosta.finalproject.vo.MailVO;
import com.kosta.finalproject.vo.RegisterBoardVO;
import com.kosta.finalproject.vo.RequestBoardVO;

@Controller
public class MypageController {
	@Autowired
	private MailImpl mailImpl;

	@Autowired
	private RegisterBoardDaoImpl registerBoardDaoImpl;
	
    @Autowired
    private RequestBoardDaoImpl requestBoardDaoImpl;


	// 나의 대여 목록
	@RequestMapping("/myrentlist")
	public String myrentlist(Model model) {

		// 로그인 정보 확인
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		// 나의 대여목록
		List<RegisterBoardVO> MyRegisterselect = registerBoardDaoImpl.MyRegisterselect(session_id);

		model.addAttribute("MyRegisterselect", MyRegisterselect);

		model.addAttribute("CONTENT", "join/myrentlist.jsp");
		model.addAttribute("LEFT", "join/mypage_left.jsp");
		return "main";
	}

	@RequestMapping("/mymaillist")
	public String mymaillist(Model model, HttpServletRequest request) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		List<MailVO> maillist = mailImpl.mymaillist(session_id);

		model.addAttribute("maillist", maillist);
		model.addAttribute("CONTENT", "mypage/mymaillist.jsp");
		model.addAttribute("LEFT", "join/mypage_left.jsp");
		return "main";
	}

	@RequestMapping("/myrequest")
	public String myrequest(Model model, HttpServletRequest request) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);
		String mypage = "mypage";

		List<RequestBoardVO> myrequest = requestBoardDaoImpl.RequestBoardUserSelectAll(session_id);

		model.addAttribute("mypage", mypage);
		model.addAttribute("myrequest", myrequest);
		model.addAttribute("CONTENT", "mypage/myrequest.jsp");
		model.addAttribute("LEFT", "join/mypage_left.jsp");
		return "main";
	}
}