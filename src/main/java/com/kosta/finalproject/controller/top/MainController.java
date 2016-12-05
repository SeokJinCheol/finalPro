package com.kosta.finalproject.controller.top;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collections;
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
import com.kosta.finalproject.dao.CheckBoardDaoImpl;
import com.kosta.finalproject.dao.FinalDaoImpl;
import com.kosta.finalproject.dao.QandADaoImpl;
import com.kosta.finalproject.dao.RRBoardDaoImpl;
import com.kosta.finalproject.dao.RegisterBoardDaoImpl;
import com.kosta.finalproject.vo.CheckBoardVO;
import com.kosta.finalproject.vo.RRboardVO;
import com.kosta.finalproject.vo.RegisterBoardVO;
import com.kosta.finalproject.vo.UsersVO;

@Controller
@SessionAttributes({ "id" })
public class MainController {
	
	@Autowired
	private RegisterBoardDaoImpl registerBoardDaoImpl;
	
	@Autowired
	private FinalDaoImpl finalDaoImpl;

	@Autowired
	private BoardDaoImpl boardDaoImpl;

	@Autowired
	private QandADaoImpl qandADaoImpl;
	
	@Autowired
	private CheckBoardDaoImpl checkBoardDaoImpl;

	@Autowired
	private RRBoardDaoImpl	RRBoardDaoImpl;
	
	// Main
	@RequestMapping("/main")
	public String main(Model model) {
		
		//장소대여 main
		RRboardVO vo1 =	RRBoardDaoImpl.getMain("강당");
		RRboardVO vo2 =	RRBoardDaoImpl.getMain("사무실");
		RRboardVO vo3 =	RRBoardDaoImpl.getMain("회의실");
		RRboardVO vo4 =	RRBoardDaoImpl.getMain("공터");
		RRboardVO vo5 =	RRBoardDaoImpl.getMain("기타");
		
		model.addAttribute("vo1", vo1);
		model.addAttribute("vo2", vo2);
		model.addAttribute("vo3", vo3);
		model.addAttribute("vo4", vo4);
		model.addAttribute("vo5", vo5);
		
		//물건대여 main
		List<RegisterBoardVO> registervo1 = registerBoardDaoImpl.getMain("DIY용품");
		List<RegisterBoardVO> registervo2 = registerBoardDaoImpl.getMain("공구");
		List<RegisterBoardVO> registervo3 = registerBoardDaoImpl.getMain("주방용품");
		List<RegisterBoardVO> registervo4 = registerBoardDaoImpl.getMain("전자기기");
		List<RegisterBoardVO> registervo5 = registerBoardDaoImpl.getMain("레져용품");
		
		model.addAttribute("registervo1", registervo1);
		model.addAttribute("registervo2", registervo2);
		model.addAttribute("registervo3", registervo3);
		model.addAttribute("registervo4", registervo4);
		model.addAttribute("registervo5", registervo5);

		model.addAttribute("CONTENT", "mainpage.jsp");
		return "main";
	}

	//////////////////////////////////////////////////////////////////////////////////////////////////
	// about_us
	@RequestMapping("/about_us")
	public String about_us(Model model) {
		model.addAttribute("CONTENT", "about_us.jsp");
		model.addAttribute("LEFT", "menu/menu5/left.jsp");
		
		return "main";
	}
	
	// Cost get
	@RequestMapping(value="/Cost", method = RequestMethod.GET)
	public String Cost(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		int check=0;
		
		model.addAttribute("check", check);
		return "Cost";
	}
	
	// Cost post
		@RequestMapping(value="/Cost", method = RequestMethod.POST)
		public String Cost1(HttpServletRequest request, Model model) throws Exception {
			request.setCharacterEncoding("utf-8");

			String keyword = request.getParameter("keyword");
			int times = Integer.parseInt(request.getParameter("times"));
			int check = 0;
						
			if(keyword.equals("category1")){ check = 3000 * times;
			} else if(keyword.equals("category2")){ check = 1000 * times;
		    } else if(keyword.equals("category3")){ check = 2000 * times;
            } else if(keyword.equals("category4")){ check = 3000 * times;
            } else if(keyword.equals("category5")){ check = 1000 * times;
		    } else if(keyword.equals("category6")){ check = 2000 * times;
            } else if(keyword.equals("category7")){ check = 3000 * times;
            } else if(keyword.equals("category8")){ check = 5000 * times;
		    } else if(keyword.equals("category9")){ check = 5000 * times;
            } else if(keyword.equals("category10")){ check = 5000 * times;
            } else if(keyword.equals("category11")){ check = 6000 * times;
            } else if(keyword.equals("category12")){ check = 6000 * times;
            } else if(keyword.equals("category13")){ check = 3000 * times;
            } else if(keyword.equals("category14")){ check = 50000 * times;
            } else if(keyword.equals("category15")){ check = 60000 * times;
            } else if(keyword.equals("category16")){ check = 70000 * times;
            } else if(keyword.equals("category17")){ check = 80000 * times;
            } else if(keyword.equals("category18")){ check = 90000 * times;
            } else if(keyword.equals("category19")){ check = 100000 * times;
            } else if(keyword.equals("category21")){ check = 110000 * times;
            } else if(keyword.equals("category22")){ check = 120000 * times;
            }
		
			model.addAttribute("check", check);
			
			return "Cost";
		}

	// mainSearch
	@RequestMapping("/mainSearch")
	public String mainSearch(Model model, HttpServletRequest request) throws Exception{
				String packageStatus = "대여가능";

				// 검색 확인
				String keyword = request.getParameter("keyword");
				String word = request.getParameter("word");

				// 대여목록
				List<RegisterBoardVO> Registerpossibility = null;
				List<RRboardVO> RRpossibility = null;

				if (keyword == null) {
					Registerpossibility = registerBoardDaoImpl.Registerpossibility(packageStatus);

				} else if (keyword.equalsIgnoreCase("goods") && word != null) {
					Registerpossibility = registerBoardDaoImpl.pselectTitle(packageStatus, word);
		
					model.addAttribute("Registerpossibility", Registerpossibility);
					model.addAttribute("CONTENT", "menu/menu2/left_menu/menu2_1.jsp");
					model.addAttribute("LEFT", "menu/menu2/left.jsp");

				} else if (keyword.equalsIgnoreCase("place") && word != null) {

					RRpossibility = RRBoardDaoImpl.pselectPlace(packageStatus, word);
					
				    model.addAttribute("list", RRpossibility);
				    model.addAttribute("CONTENT", "menu/menu3/left_menu/menu3_3.jsp");
				    model.addAttribute("LEFT", "menu/menu3/left.jsp");
				
			}
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
	// 회원리스트 + 회원검색
		@RequestMapping("/list")
		public String selectAll(HttpServletRequest request, Model model) throws Exception {
			request.setCharacterEncoding("utf-8");
			String keyword = request.getParameter("keyword");
			String word = request.getParameter("word");
			String id = request.getParameter("id");
			int pageSize = 7;
			String pageNum = request.getParameter("pageNum");

			if (pageNum == null)
				pageNum = "1";

			int currentPage = Integer.parseInt(pageNum);

			int startRow = (currentPage * pageSize) - (pageSize - 1);
			int endRow = currentPage * pageSize;
			int count = 0, number = 0;

			
			List<UsersVO> userlist = null;
			
			if (keyword == null) {
				count = finalDaoImpl.getAdAllCount();
			} else if (keyword.equalsIgnoreCase("name") && word != null) {
				count = finalDaoImpl.getAdminNameCount(word);
			} else if (keyword.equalsIgnoreCase("id") && word != null) {
				count = finalDaoImpl.getAdminIDCount(word);
			} else if (keyword.equalsIgnoreCase("memberRank") && word != null) {
				count = finalDaoImpl.getAdminRankCount(word);
			}
			
			int pageCount = Math.round(count / pageSize + (count % pageSize == 0 ? 0 : 1));
			if (count > 0) {
				if (keyword == null) {
					UsersVO users = new UsersVO();
					users.setStartRow(startRow);
					users.setEndRow(endRow);
					userlist = finalDaoImpl.adGetMembers(users);

				} else if (keyword.equalsIgnoreCase("name") && word != null) {
					word = request.getParameter("word");

					userlist = finalDaoImpl.adSelectName(word, startRow, endRow);

					model.addAttribute("word", word);
					model.addAttribute("keyword", keyword);

				} else if (keyword.equalsIgnoreCase("id") && word != null) {
					word = request.getParameter("word");
					userlist = finalDaoImpl.adSelectId(word, startRow, endRow);

					model.addAttribute("word", word);
					model.addAttribute("keyword", keyword);

				} else if (keyword.equalsIgnoreCase("memberRank") && word != null) {
					word = request.getParameter("word");
					userlist = finalDaoImpl.adSelectRank(word, startRow, endRow);

					model.addAttribute("word", word);
					model.addAttribute("keyword", keyword);

				}
				
			} else {
				userlist = Collections.EMPTY_LIST;
			}

			model.addAttribute("result", userlist);
			model.addAttribute("currentPage", new Integer(currentPage));
			model.addAttribute("count", new Integer(count));
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageSize", new Integer(pageSize));
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
		vo.setPostcode(request.getParameter("postcode"));
		vo.setAddress(request.getParameter("address"));
		vo.setAddress2(request.getParameter("address2"));
		vo.setMemberRank(request.getParameter("memberRank"));
		vo.setCompany(request.getParameter("company"));

		finalDaoImpl.insertMember(vo);

		String rightrank = "role_user";
		finalDaoImpl.insertRank(id, rightrank);

		List<UsersVO> userlist = finalDaoImpl.getMembers();

		model.addAttribute("CONTENT", "Login.jsp");

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
		vo.setPostcode(request.getParameter("postcode"));
		vo.setAddress(request.getParameter("address"));
		vo.setAddress2(request.getParameter("address2"));
		vo.setMemberRank(request.getParameter("memberRank"));
		vo.setCompany(request.getParameter("company"));

		finalDaoImpl.insertMember(vo);

		String rightrank = "role_com";
		finalDaoImpl.insertRank(id, rightrank);

		List<UsersVO> userlist = finalDaoImpl.getMembers();

		model.addAttribute("CONTENT", "Login.jsp");
		return "main";
	}

	// 중복 아이디 체크
	@RequestMapping("/ConfirmId")
	public String confirmId(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");

		UsersVO result = finalDaoImpl.confirmIdMember(id);
		int check = 0;

		System.out.println(id);

		if (result == null && id != "") {
			check = 0;
		} else if (result == null && id == "") {
			check = 1;
		} else {
			check = 2;
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
		vo.setPostcode(request.getParameter("postcode"));
		vo.setAddress(request.getParameter("address"));
		vo.setAddress2(request.getParameter("address2"));
		vo.setMemberRank(request.getParameter("memberRank"));
		vo.setCompany(request.getParameter("company"));

		finalDaoImpl.updateMemberPro(vo);

		List<UsersVO> userlist = finalDaoImpl.getMembers();

		model.addAttribute("result", userlist);
		model.addAttribute("CONTENT", "join/mypage.jsp");

		return "main";
	}

	// admin_update
	@RequestMapping(value = "/admin_update", method = RequestMethod.POST)
	public String admin_update(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");

		UsersVO userlist = finalDaoImpl.updateMember(id);

		model.addAttribute("result", userlist);
		model.addAttribute("LEFT", "join/admin_left.jsp");
		model.addAttribute("CONTENT", "join/admin_update.jsp");

		return "main";
	}

	@RequestMapping(value = "/admin_updatePro", method = RequestMethod.POST)
	public String admin_updatePro(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");

		UsersVO vo = new UsersVO();
		vo.setId(request.getParameter("id"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setName(request.getParameter("name"));
		vo.setBirthday(request.getParameter("birthday"));
		vo.setPhoneNum1(request.getParameter("phoneNum1"));
		vo.setPhoneNum2(request.getParameter("phoneNum2"));
		vo.setEmail(request.getParameter("email"));
		vo.setPostcode(request.getParameter("postcode"));
		vo.setAddress(request.getParameter("address"));
		vo.setAddress2(request.getParameter("address2"));
		vo.setMemberRank(request.getParameter("memberRank"));
		vo.setCompany(request.getParameter("company"));

		finalDaoImpl.updateMemberPro(vo);

		return "redirect:list";
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

		return "redirect:list";
	}
}