package com.kosta.finalproject.controller.left;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
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
import org.springframework.web.multipart.MultipartFile;

import com.kosta.finalproject.dao.RegisterBoardDaoImpl;
import com.kosta.finalproject.dao.RequestBoardDaoImpl;
import com.kosta.finalproject.vo.RegisterBoardVO;
import com.kosta.finalproject.vo.RequestBoardVO;
import com.kosta.finalproject.vo.UploadVO;

@Controller
public class RequestBoardLeftController {

	@Autowired
	private RequestBoardDaoImpl requestBoardDaoImpl;
	
	@Autowired
	private RegisterBoardDaoImpl registerBoardDaoImpl;

	@RequestMapping("/menu1_1")
	public String menu1_1(Model model) {
		
		String title = "업 체 별 등 록 현 황";
		model.addAttribute("title", title);

		// id 받아오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		// 기업 등록글 보기
		String company = "업체";
		List<RequestBoardVO> requestlist = requestBoardDaoImpl.companyselect(company);
		model.addAttribute("requestlist", requestlist);

		model.addAttribute("company", company);
		
		model.addAttribute("CONTENT", "menu/menu1/left_menu/menu1_1.jsp");
		model.addAttribute("LEFT", "menu/menu1/left.jsp");
		return "main";
	}

	@RequestMapping("/menu1_2")
	public String menu1_2(Model model) {
		

		// id 받아오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		// 개인 등록글 보기
		String company = "개인";
		List<RequestBoardVO> requestlist = requestBoardDaoImpl.companyselect(company);
		model.addAttribute("requestlist", requestlist);
		
		model.addAttribute("company", company);

		model.addAttribute("CONTENT", "menu/menu1/left_menu/menu1_1.jsp");
		model.addAttribute("LEFT", "menu/menu1/left.jsp");
		return "main";
	}

	@RequestMapping("/menu1_3")
	public String menu1_3(Model model) {

		// id 받아오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);
		// 내가 등록 한글
		List<RequestBoardVO> requestlist = requestBoardDaoImpl.RequestBoardUserSelectAll(session_id);

		model.addAttribute("CONTENT", "menu/menu1/left_menu/menu1_3.jsp");
		model.addAttribute("LEFT", "menu/menu1/left.jsp");
		model.addAttribute("requestlist", requestlist);

		return "main";
	}

	// 등록 글 수정폼
	@RequestMapping("/RequestBoardUpdateForm")
	public String RequestBoardUpdateForm(Model model, HttpServletRequest request) {
		
		//마이페이지 판별
		String mypage = request.getParameter("mypage");
		model.addAttribute("mypage", mypage);
		
		// id 받아오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		// 글번호
		int codeNum = Integer.parseInt(request.getParameter("codeNum"));
		// 글번호 해당 데이터
		List<RequestBoardVO> updatelist = requestBoardDaoImpl.RequestBoardUpdateForm(codeNum);

		model.addAttribute("CONTENT", "menu/menu1/write/requestboardupdateForm.jsp");
		if(mypage.equals("mypage")){
			model.addAttribute("LEFT", "join/mypage_left.jsp");
		}else model.addAttribute("LEFT", "menu/menu1/left.jsp");
		model.addAttribute("updatelist", updatelist);

		return "main";
	}

	@RequestMapping("/requestBoardUpdate")
	public String requestBoardUpdate(Model model, HttpServletRequest request, UploadVO dto) throws Exception {
		
		//마이페이지 판별
		String mypage = request.getParameter("mypage");
		model.addAttribute("mypage", mypage);
		
		//이전 이미지 이름 받아오기
		String img = request.getParameter("img");
		System.out.println(img);
		
		//파일이 null 이 아니면 실행.
	      String fileName = null;
	      
	      System.out.println("이미지 처리 시작");
	      MultipartFile uploadfile = dto.getFile();
	      if (uploadfile != null) {
	          fileName = uploadfile.getOriginalFilename();
	          if(!fileName.equals("")){
	             dto.setOname(fileName);
	             try {
	                 File file = new File("C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/RequestImg/" + fileName);
	                    while(file.exists()) {
	                       int indexes = fileName.lastIndexOf(".");
	                       System.out.println("순서 = "+indexes);
	                       String extension = fileName.substring(indexes);
	                       System.out.println("확장자 = "+extension);
	                       String newFileName = fileName.substring(0, indexes)+"_"+extension;
	                       System.out.println("새 파일 이름 = "+newFileName);
	                       fileName = newFileName;
	                       file = new File("C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/RequestImg/" + newFileName);
	                    }
	                 uploadfile.transferTo(file);
	             } catch (IOException e) {
	                 e.printStackTrace();
	             } // try - catch
	          } else fileName = img;
	      }

		// 날짜 변환
		SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedDate1 = simpledate.parse(request.getParameter("startDate"));
		Date parsedDate2 = simpledate.parse(request.getParameter("endDate"));
		Timestamp startDate = new Timestamp(parsedDate1.getTime());
		Timestamp endDate = new Timestamp(parsedDate2.getTime());

		// id 받아오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		// 글수정
		RequestBoardVO vo = new RequestBoardVO();

		vo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		vo.setTitle(request.getParameter("title"));
		vo.setCategory(request.getParameter("category"));
		vo.setCompany(request.getParameter("company"));
		vo.setStartDate(simpledate.format(startDate));
		vo.setEndDate(simpledate.format(endDate));
		vo.setBill(Integer.parseInt(request.getParameter("bill")));
		vo.setDeposit(Integer.parseInt(request.getParameter("deposit")));
		vo.setContents(request.getParameter("contents"));
		vo.setImg(fileName);

		requestBoardDaoImpl.requestBoardUpdate(vo);
		
		RegisterBoardVO registervo = new RegisterBoardVO();
		registervo.setImg(fileName);
		registervo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		
		registerBoardDaoImpl.imgupdate(registervo);

		// 내가 등록 한글
		List<RequestBoardVO> myrequest = requestBoardDaoImpl.RequestBoardUserSelectAll(session_id);

		model.addAttribute("requestlist", myrequest);
		model.addAttribute("myrequest", myrequest);
		if(mypage.equals("mypage")){
			model.addAttribute("LEFT", "join/mypage_left.jsp");
			model.addAttribute("CONTENT", "mypage/myrequest.jsp");
		}else{ 
			model.addAttribute("LEFT", "menu/menu1/left.jsp");
			model.addAttribute("CONTENT", "menu/menu1/left_menu/menu1_3.jsp");
		}

		return "main";
	}

	@RequestMapping("/requestboarddelete")
	public String requestboarddelete(Model model, HttpServletRequest request) {
		
		//마이페이지 판별
		String mypage = request.getParameter("mypage");
		model.addAttribute("mypage", mypage);

		// id 받아오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		RequestBoardVO vo = new RequestBoardVO();
		vo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		requestBoardDaoImpl.requestBoardDelete(vo);

		List<RequestBoardVO> myrequest = requestBoardDaoImpl.RequestBoardUserSelectAll(session_id);
		model.addAttribute("requestlist", myrequest);
		model.addAttribute("myrequest", myrequest);
		
		if(mypage.equals("mypage")){
			model.addAttribute("LEFT", "join/mypage_left.jsp");
			model.addAttribute("CONTENT", "mypage/myrequest.jsp");
		} else{
			model.addAttribute("CONTENT", "menu/menu1/left_menu/menu1_3.jsp");
			model.addAttribute("LEFT", "menu/menu1/left.jsp");
		}
		

		return "main";
	}

	@RequestMapping("/RequestEnd")
	public String RequestEnd(Model model, HttpServletRequest request) {
		
		//마이페이지 판별
		String mypage = request.getParameter("mypage");
		model.addAttribute("mypage", mypage);

		// id 받아오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		RequestBoardVO vo = new RequestBoardVO();
		String packageStatus = "대여종료신청";
		vo.setPackageStatus(packageStatus);
		vo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		requestBoardDaoImpl.packageStatusupdate(vo);

		// 내 목록보기
		List<RequestBoardVO> myrequest = requestBoardDaoImpl.RequestBoardUserSelectAll(session_id);
		
		model.addAttribute("requestlist", myrequest);
		model.addAttribute("myrequest", myrequest);

		if(mypage.equals("mypage")){
			model.addAttribute("LEFT", "join/mypage_left.jsp");
			model.addAttribute("CONTENT", "mypage/myrequest.jsp");
		}else{ 
			model.addAttribute("LEFT", "menu/menu1/left.jsp");
			model.addAttribute("CONTENT", "menu/menu1/left_menu/menu1_3.jsp");
		}

		return "main";
	}

	// 대여 심사 대기
	@RequestMapping("/rentready")
	public String rentread(Model model) {

		// id 받아오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		String status = "심사중";

		List<RequestBoardVO> requestboardstatus = requestBoardDaoImpl.requeststatus(status);

		model.addAttribute("requestboardstatus", requestboardstatus);
		model.addAttribute("CONTENT", "menu/menu1/left_menu/requeststatus.jsp");
		model.addAttribute("LEFT", "menu/menu1/left.jsp");

		return "main";
	}

	// 대여 종료 대기
	@RequestMapping("/rentend")
	public String rentend(Model model) {

		// id 받아오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		String status = "대여종료신청";

		List<RequestBoardVO> requestboardstatus = requestBoardDaoImpl.requeststatus(status);

		model.addAttribute("requestboardstatus", requestboardstatus);
		model.addAttribute("CONTENT", "menu/menu1/left_menu/requeststatus.jsp");
		model.addAttribute("LEFT", "menu/menu1/left.jsp");

		return "main";
	}

	@RequestMapping("/requestcontent")
	public String content(HttpServletRequest request, Model model) throws Exception {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		int codeNum = Integer.parseInt(request.getParameter("codeNum"));

		List<RequestBoardVO> content = requestBoardDaoImpl.requestcontent(codeNum);

		model.addAttribute("result", content);
		model.addAttribute("LEFT", "menu/menu1/left.jsp");
		model.addAttribute("CONTENT", "menu/menu1/write/content.jsp");
		return "main";
	}

}