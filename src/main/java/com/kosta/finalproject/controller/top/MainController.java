package com.kosta.finalproject.controller.top;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosta.finalproject.dao.BoardDaoImpl;
import com.kosta.finalproject.dao.FinalDaoImpl;
import com.kosta.finalproject.vo.BoardVO;
import com.kosta.finalproject.vo.UsersVO;

@Controller
@SessionAttributes({ "id" })
public class MainController {
	@Autowired
	private FinalDaoImpl finalDaoImpl;

	// Main
	@RequestMapping("/main")
	public String main(Model model) {
		model.addAttribute("CONTENT", "mainpage.jsp");
		return "main";
	}

	// Menu_3
	@RequestMapping("/menu3")
	public String menu3(Model model) {
		model.addAttribute("CONTENT", "menu/menu3/menu3.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////
	// about_us
	@RequestMapping("/about_us")
	public String about_us(Model model) {
		model.addAttribute("CONTENT", "about_us.jsp");
		return "main";
	}

	// 로그인
	@RequestMapping("/Login")
	public String login(Model model) {
		model.addAttribute("CONTENT", "Login.jsp");

		return "main";
	}

	// 이용약관
	@RequestMapping("/agreement")
	public String agreement(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");

		return "join/agreement";
	}

	// 로그아웃
	@RequestMapping("/Logout")
	public String Logout(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();

		model.addAttribute("CONTENT", "main.jsp");
		return "main";
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////
	// 회원리스트
	@RequestMapping("/list")
	public String selectAll(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");

		List<UsersVO> userlist = finalDaoImpl.getMembers();

		model.addAttribute("result", userlist);

		model.addAttribute("LEFT", "join/admin_left.jsp");
		model.addAttribute("CONTENT", "join/list.jsp");

		return "main";
	}

	// 회원가입_Form
	@RequestMapping("/joinForm")
	public String insert(Model model) {

		model.addAttribute("CONTENT", "join/joinForm.jsp");

		return "main";
	}

	// 일반 회원가입
	@RequestMapping(value = "/joinForm1", method = RequestMethod.GET)
	public String insert1(Model model) {
		model.addAttribute("CONTENT", "join/joinForm1.jsp");

		return "main";
	}

	@RequestMapping(value = "/joinForm1", method = RequestMethod.POST)
	public String insert1(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedDate = sdf.parse(request.getParameter("birthday"));
		Timestamp writeDate = new Timestamp(parsedDate.getTime());

		UsersVO vo = new UsersVO();
		vo.setId(id);
		vo.setPwd(request.getParameter("pwd"));
		vo.setName(request.getParameter("name"));
		vo.setBirthday(sdf.format(writeDate));
		vo.setPhoneNum1(request.getParameter("phoneNum1"));
		vo.setPhoneNum2(request.getParameter("phoneNum2"));
		vo.setEmail(request.getParameter("email"));
		vo.setAdress(request.getParameter("adress"));
		vo.setMemberRank(request.getParameter("memberRank"));
		vo.setCompany(request.getParameter("company"));

		finalDaoImpl.insertMember(vo);

		String rightrank = "role_user";
		finalDaoImpl.insertRank(id, rightrank);

		List<UsersVO> userlist = finalDaoImpl.getMembers();

		model.addAttribute("result", userlist);

		model.addAttribute("CONTENT", "mainpage.jsp");

		return "main";
	}

	// 기업 회원가입
	@RequestMapping(value = "/joinForm2", method = RequestMethod.GET)
	public String insert2(Model model) {
		model.addAttribute("CONTENT", "join/joinForm2.jsp");

		return "main";
	}

	@RequestMapping(value = "/joinForm2", method = RequestMethod.POST)
	public String insert2(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedDate = sdf.parse(request.getParameter("birthday"));
		Timestamp writeDate = new Timestamp(parsedDate.getTime());

		UsersVO vo = new UsersVO();
		vo.setId(id);
		vo.setPwd(request.getParameter("pwd"));
		vo.setName(request.getParameter("name"));
		vo.setBirthday(sdf.format(writeDate));
		vo.setPhoneNum1(request.getParameter("phoneNum1"));
		vo.setPhoneNum2(request.getParameter("phoneNum2"));
		vo.setEmail(request.getParameter("email"));
		vo.setAdress(request.getParameter("adress"));
		vo.setMemberRank(request.getParameter("memberRank"));
		vo.setCompany(request.getParameter("company"));

		finalDaoImpl.insertMember(vo);

		String rightrank = "role_com";
		finalDaoImpl.insertRank(id, rightrank);

		List<UsersVO> userlist = finalDaoImpl.getMembers();

		model.addAttribute("result", userlist);

		model.addAttribute("CONTENT", "mainpage.jsp");
		return "main";
	}

	// 중복 아이디 체크
	@RequestMapping("/ConfirmId")
	public String confirmId(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");

		UsersVO result = finalDaoImpl.confirmIdMember(id);
		int check = 0;

		if (result == null) {
			check = 0;
		} else {
			check = 1;
		}

		model.addAttribute("check", check);
		model.addAttribute("id", id);

		return "join/confirmId";
	}

	// MyPage
	@RequestMapping("/mypage")
	public String update(Model model) {
		model.addAttribute("LEFT", "join/mypage_left.jsp");
		model.addAttribute("CONTENT", "join/mypage.jsp");
		return "main";
	}

	// mypage_delete Form
	@RequestMapping(value = "/mypage_delete", method = RequestMethod.GET)
	public String delete(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		model.addAttribute("session_id", session_id);

		model.addAttribute("LEFT", "join/mypage_left.jsp");
		model.addAttribute("CONTENT", "join/mypage_delete.jsp");

		return "main";
	}

	// mypage_delete 기능
	@RequestMapping(value = "/mypage_delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		model.addAttribute("session_id", session_id);

		UsersVO vo = new UsersVO();
		vo.setId(session_id);
		vo.setPwd(request.getParameter("pwd"));

		int result = finalDaoImpl.deleteMember(vo);

		// 삭제 O
		if (result != 0) {
			HttpSession session = request.getSession();
			session.invalidate();

			System.out.println("삭제 OK");

			// Roll도 삭제되는 구문
			finalDaoImpl.deleteRank(session_id);

			return "redirect:main";
		}

		// 삭제 X
		else if (result == 0) {
			model.addAttribute("CONTENT", "join/mypage_delete.jsp");
		}

		List<UsersVO> userlist = finalDaoImpl.getMembers();

		model.addAttribute("id", request.getRequestedSessionId());
		model.addAttribute("result", userlist);

		return "main";
	}

	// mypage_update
	@RequestMapping(value = "/mypage_update", method = RequestMethod.GET)
	public String mypage_update(HttpServletRequest request, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		model.addAttribute("session_id", session_id);

		System.out.println(session_id);

		UsersVO userlist = finalDaoImpl.updateMember(session_id);

		model.addAttribute("result", userlist);

		model.addAttribute("LEFT", "join/mypage_left.jsp");
		model.addAttribute("CONTENT", "join/mypage_update.jsp");

		return "main";
	}

	@RequestMapping(value = "/mypage_update", method = RequestMethod.POST)
	public String mypage_update2(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");

		UsersVO vo = new UsersVO();
		vo.setId(request.getParameter("id"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setName(request.getParameter("name"));
		vo.setBirthday(request.getParameter("birthday"));
		vo.setPhoneNum1(request.getParameter("phoneNum1"));
		vo.setPhoneNum2(request.getParameter("phoneNum2"));
		vo.setEmail(request.getParameter("email"));
		vo.setAdress(request.getParameter("adress"));
		vo.setMemberRank(request.getParameter("memberRank"));
		vo.setCompany(request.getParameter("company"));

		finalDaoImpl.updateMemberPro(vo);

		List<UsersVO> userlist = finalDaoImpl.getMembers();

		model.addAttribute("result", userlist);
		model.addAttribute("CONTENT", "join/mypage.jsp");

		return "main";
	}

	// admin_update
	@RequestMapping(value = "/admin_update", method = RequestMethod.GET)
	public String admin_update(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");

		UsersVO userlist = finalDaoImpl.updateMember(id);

		model.addAttribute("result", userlist);
		model.addAttribute("CONTENT", "join/admin_update.jsp");

		return "main";
	}

	@RequestMapping(value = "/admin_update", method = RequestMethod.POST)
	public String admin_update2(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");

		UsersVO vo = new UsersVO();
		vo.setId(request.getParameter("id"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setName(request.getParameter("name"));
		vo.setBirthday(request.getParameter("birthday"));
		vo.setPhoneNum1(request.getParameter("phoneNum1"));
		vo.setPhoneNum2(request.getParameter("phoneNum2"));
		vo.setEmail(request.getParameter("email"));
		vo.setAdress(request.getParameter("adress"));
		vo.setMemberRank(request.getParameter("memberRank"));
		vo.setCompany(request.getParameter("company"));

		finalDaoImpl.updateMemberPro(vo);

		List<UsersVO> userlist = finalDaoImpl.getMembers();

		model.addAttribute("result", userlist);
		model.addAttribute("CONTENT", "join/list.jsp");

		return "main";
	}

	// admin_delete
	@RequestMapping("/admin_delete")
	public String admin_delete(HttpServletRequest request, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		String id = request.getParameter("m_id");

		model.addAttribute("session_id", session_id);

		UsersVO vo = new UsersVO();
		vo.setId(request.getParameter("m_id"));

		finalDaoImpl.admin_deleteMember(vo);

		// 삭제 O
		System.out.println("삭제 OK");

		// Roll도 삭제되는 구문
		finalDaoImpl.admin_deleteMemberRank(id);

		List<UsersVO> userlist = finalDaoImpl.getMembers();

		model.addAttribute("id", request.getRequestedSessionId());
		model.addAttribute("result", userlist);

		model.addAttribute("CONTENT", "join/list.jsp");

		return "main";
	}
}