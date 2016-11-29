package com.kosta.finalproject.controller.left;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.finalproject.dao.CheckBoardDaoImpl;
import com.kosta.finalproject.dao.RegisterBoardDaoImpl;
import com.kosta.finalproject.dao.ReviewImpl;
import com.kosta.finalproject.dao.StorageBoardDaoImpl;
import com.kosta.finalproject.vo.CheckBoardVO;
import com.kosta.finalproject.vo.RegisterBoardVO;
import com.kosta.finalproject.vo.ReviewVO;
import com.kosta.finalproject.vo.StorageBoardVO;

@Controller
public class RegisterBoardLeftController {

	@Autowired
	private ReviewImpl reviewImpl;

	@Autowired
	private RegisterBoardDaoImpl registerBoardDaoImpl;

	@Autowired
	private CheckBoardDaoImpl checkBoardDaoImpl;

	@Autowired
	private StorageBoardDaoImpl storageBoardDaoImpl;

	@RequestMapping("/menu2_1")
	public String menu2_1(Model model) {

		// id 받아오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		String possibility = "대여가능";

		// 대여목록
		List<RegisterBoardVO> Registerpossibility = registerBoardDaoImpl.Registerpossibility(possibility);
		model.addAttribute("Registerpossibility", Registerpossibility);

		model.addAttribute("CONTENT", "menu/menu2/left_menu/menu2_1.jsp");
		model.addAttribute("LEFT", "menu/menu2/left.jsp");
		return "main";
	}

	// 나의 대여 목록
	@RequestMapping("/menu2_2")
	public String menu2_2(Model model) {

		// 로그인 정보 확인
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		// 나의 대여목록
		List<RegisterBoardVO> MyRegisterselect = registerBoardDaoImpl.MyRegisterselect(session_id);

		model.addAttribute("MyRegisterselect", MyRegisterselect);

		model.addAttribute("CONTENT", "menu/menu2/left_menu/menu2_2.jsp");
		model.addAttribute("LEFT", "menu/menu2/left.jsp");
		return "main";
	}

	// 리뷰작성 대여종료
	@RequestMapping("/reviewendrent")
	public String reviewendrent(Model model, HttpServletRequest request) {

		int codeNum = Integer.parseInt(request.getParameter("codeNum"));
		model.addAttribute("codeNum", codeNum);
		model.addAttribute("LEFT", "menu/menu2/left.jsp");
		model.addAttribute("CONTENT", "menu/menu2/Review.jsp");
		return "main";
	}

	// 반납 신청
	@RequestMapping("/endrent")
	public String endrent(Model model, HttpServletRequest request) {

		// 로그인 정보 확인
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		// 리뷰작성
		String reviewtext = request.getParameter("reviewtext");
		if (reviewtext != "") {
			ReviewVO reviewvo = new ReviewVO();
			reviewvo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
			reviewvo.setReviewpoint(Integer.parseInt(request.getParameter("reviewpoint")));
			reviewvo.setReviewtext(request.getParameter("reviewtext"));
			reviewvo.setReviewid(session_id);
			reviewImpl.reviewinsert(reviewvo);
		}

		// 대여가능 게시판 반납신청
		RegisterBoardVO registervo = new RegisterBoardVO();
		String packageStatus = "반납신청";
		registervo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		registervo.setPackageStatus(packageStatus);
		registerBoardDaoImpl.packageStatus(registervo);

		// 물건 체크 현황 반납신청
		CheckBoardVO checkvo = new CheckBoardVO();
		checkvo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		checkvo.setPackageStatus(packageStatus);
		checkBoardDaoImpl.packageStatus(checkvo);

		// 나의 대여목록
		List<RegisterBoardVO> MyRegisterselect = registerBoardDaoImpl.MyRegisterselect(session_id);

		model.addAttribute("MyRegisterselect", MyRegisterselect);

		model.addAttribute("CONTENT", "menu/menu2/left_menu/menu2_2.jsp");
		model.addAttribute("LEFT", "menu/menu2/left.jsp");

		return "main";
	}

	// 대여 취소
	@RequestMapping("/rentcancel")
	public String rentcancel(Model model, HttpServletRequest request) {

		String pagecheck = request.getParameter("pagecheck");

		// 로그인 정보 확인
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		// 대여가능 게시판 취소신청
		RegisterBoardVO registervo = new RegisterBoardVO();
		String packageStatus = "대여가능";
		registervo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		registervo.setPackageStatus(packageStatus);
		registervo.setRegisterId("");
		registervo.setUserstartDate("");
		registervo.setUserendDate("");
		registerBoardDaoImpl.PackageStatusUP(registervo);

		// 물건 체크 현황 반납신청
		CheckBoardVO checkvo = new CheckBoardVO();
		checkvo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		checkvo.setPackageStatus(packageStatus);
		checkvo.setUserstartDate("");
		checkvo.setUserendDate("");
		checkvo.setRentter("");
		checkBoardDaoImpl.Checkrentterup(checkvo);

		if (pagecheck == "admin") {

			String possibility = "대여신청";
			List<RegisterBoardVO> rentreadylist = registerBoardDaoImpl.Registerpossibility(possibility);
			model.addAttribute("rentreadylist", rentreadylist);
			model.addAttribute("CONTENT", "menu/menu2/left_menu/registeradminpage.jsp");

		} else {
			// 나의 대여목록
			List<RegisterBoardVO> MyRegisterselect = registerBoardDaoImpl.MyRegisterselect(session_id);
			model.addAttribute("MyRegisterselect", MyRegisterselect);
			model.addAttribute("CONTENT", "menu/menu2/left_menu/menu2_2.jsp");
		}

		model.addAttribute("LEFT", "menu/menu2/left.jsp");

		return "main";
	}

	@RequestMapping("/rentreadylist")
	public String rentreadylist(Model model) {

		// 로그인 정보 확인
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		String possibility = "대여신청";
		List<RegisterBoardVO> rentreadylist = registerBoardDaoImpl.Registerpossibility(possibility);

		model.addAttribute("rentreadylist", rentreadylist);
		model.addAttribute("CONTENT", "menu/menu2/left_menu/registeradminpage.jsp");
		model.addAttribute("LEFT", "menu/menu2/left.jsp");

		return "main";
	}

	// 대여 취소 admin만 가능
	@RequestMapping("/rentcancelend")
	public String rentcancelend(Model model, HttpServletRequest request) throws Exception {

		// 로그인 정보 확인
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		// 대여가능 게시판 반납신청
		RegisterBoardVO registervo = new RegisterBoardVO();
		String packageStatus = "대여가능";
		registervo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		registervo.setPackageStatus(packageStatus);
		registervo.setRegisterId("");
		registervo.setUserstartDate("");
		registervo.setUserendDate("");
		registerBoardDaoImpl.PackageStatusUP(registervo);

		// 물건 체크 현황 반납신청
		CheckBoardVO checkvo = new CheckBoardVO();
		checkvo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		checkvo.setPackageStatus(packageStatus);
		checkvo.setRentter("");
		checkvo.setUserstartDate("");
		checkvo.setUserendDate("");
		checkBoardDaoImpl.Checkrentterup(checkvo);

		// StorageBoard 반납일
		StorageBoardVO storagevo = new StorageBoardVO();

		// 현재시간 가져오기
		long time = System.currentTimeMillis();
		SimpleDateFormat ctime = new SimpleDateFormat("yyyy-MM-dd");
		String CurrentTime = ctime.format(new Date(time));

		storagevo.setEndDate(CurrentTime);
		storagevo.setsNum(Integer.parseInt(request.getParameter("sNum")));
		storagevo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		storageBoardDaoImpl.storageend(storagevo);

		// 대여 목록 카운트
		int codeNum = Integer.parseInt(request.getParameter("codeNum"));
		List<StorageBoardVO> storagecount = storageBoardDaoImpl.codeNumCount(codeNum);
		model.addAttribute("storagecount", storagecount);

		String possibility = "대여신청";
		List<RegisterBoardVO> rentreadylist = registerBoardDaoImpl.Registerpossibility(possibility);
		model.addAttribute("rentreadylist", rentreadylist);
		model.addAttribute("CONTENT", "menu/menu2/left_menu/registeradminpage.jsp");
		model.addAttribute("LEFT", "menu/menu2/left.jsp");

		return "main";
	}

	@RequestMapping("/storageendrent")
	public String storageendrent(Model model, HttpServletRequest request) {

		// 대여 목록 카운트
		int codeNum = Integer.parseInt(request.getParameter("codeNum"));
		List<StorageBoardVO> storagecount1 = storageBoardDaoImpl.codeNumCount1(codeNum);
		model.addAttribute("storagecount1", storagecount1);

		// 정보 띄우기
		List<CheckBoardVO> rentstartlist = checkBoardDaoImpl.codeNumselect(codeNum);
		model.addAttribute("rentstartlist", rentstartlist);

		model.addAttribute("CONTENT", "menu/menu2/write/rantendForm.jsp");
		model.addAttribute("LEFT", "menu/menu2/left.jsp");
		return "main";
	}

	@RequestMapping("/rentoutlist")
	public String rentoutlist(Model model) {

		// 로그인 정보 확인
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		String possibility = "반납신청";
		List<RegisterBoardVO> rentreadylist = registerBoardDaoImpl.Registerpossibility(possibility);
		model.addAttribute("rentreadylist", rentreadylist);
		model.addAttribute("CONTENT", "menu/menu2/left_menu/registeradminpage.jsp");
		model.addAttribute("LEFT", "menu/menu2/left.jsp");

		return "main";
	}

	// 정산
	@RequestMapping("/account")
	public String account(Model model) throws Exception {

		// stroageBoard 갯수 받기
		List<StorageBoardVO> storagecount = storageBoardDaoImpl.storageCount();
		int count = storagecount.get(0).getsNum();

		// storageBoard 정보 뿌리기
		List<StorageBoardVO> storagelist = storageBoardDaoImpl.storageAll();

		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		// 넘겨줄 배열값 생성
		Date[] Date1 = new Date[count];
		Date[] Date2 = new Date[count];
		long[] rentDate = new long[count];
		long[] pay = new long[count];
		// 계산식
		for (int i = 0; i < count; i++) {
			// date 형변환
			if (storagelist.get(i).getEndDate() != null) {
				String sDate = storagelist.get(i).getStartDate();
				Date1[i] = (Date) format.parse(sDate);
				String eDate = storagelist.get(i).getEndDate();
				Date2[i] = (Date) format.parse(eDate);
				// 날짜 시간차
				long rentTime = Date2[i].getTime() - Date1[i].getTime();
				// 일수 변환
				if (rentTime != 0) {
					rentDate[i] = rentTime / (24 * 60 * 60 * 1000);
					pay[i] = rentDate[i] * storagelist.get(i).getBill();
				} else {
					rentDate[i] = 0;
					pay[i] = 0;
				}
			} else {
				rentDate[i] = 0;
				pay[i] = 0;
			}

		}

		model.addAttribute("rentDate", rentDate);
		model.addAttribute("pay", pay);
		model.addAttribute("storagelist", storagelist);

		model.addAttribute("LEFT", "join/admin_left.jsp");
		model.addAttribute("CONTENT", "admin/account.jsp");

		return "main";
	}
}