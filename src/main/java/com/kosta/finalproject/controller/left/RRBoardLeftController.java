package com.kosta.finalproject.controller.left;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.finalproject.dao.MailImpl;
import com.kosta.finalproject.dao.RRBoardDaoImpl;
import com.kosta.finalproject.vo.MailVO;
import com.kosta.finalproject.vo.RPboardVO;
import com.kosta.finalproject.vo.RRboardVO;
import com.kosta.finalproject.vo.SearchVO;
import com.kosta.finalproject.vo.UploadVO;

@Controller
public class RRBoardLeftController {

	@Autowired
	MailImpl mailImpl;
	
	@Autowired
	private RRBoardDaoImpl dao;

	@RequestMapping("/menu3_1")
	public String menu3_1(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		System.out.println(auth.toString());

		model.addAttribute("id", session_id);

		model.addAttribute("CONTENT", "menu/menu3/left_menu/menu3_1.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	@RequestMapping("/RRboardinsert")
	public String RRboardinsert(Model model, HttpServletRequest request, UploadVO dto) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		RRboardVO vo = new RRboardVO();
		String fileName = null;
		MultipartFile uploadfile = dto.getFile();

		// 이미지 처리
		if (uploadfile == null) {
		} else {
			fileName = uploadfile.getOriginalFilename();
			dto.setOname(fileName);
			try {
				File file = new File(
						"C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/BoardImg/"
								+ fileName);

				int indexes = fileName.lastIndexOf(".");
				if (indexes != -1) {
					while (file.exists()) {
						indexes = fileName.lastIndexOf(".");
						System.out.println("순서 = " + indexes);
						String extension = fileName.substring(indexes);
						System.out.println("확장자 = " + extension);
						String newFileName = fileName.substring(0, indexes) + "_" + extension;
						System.out.println("새 파일 이름 = " + newFileName);
						fileName = newFileName;
						file = new File(
								"C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/BoardImg/"
										+ newFileName);
					}

					uploadfile.transferTo(file);
				}
			} catch (IOException e) {
				e.printStackTrace();
			} // try - catch
		} // if

		/*
		 * //날짜 타입으로 변환 SimpleDateFormat sdf = new
		 * SimpleDateFormat("yyyy-MM-dd"); Date startDate=null, endDate=null;
		 * try { startDate = sdf.parse(request.getParameter("startDate"));
		 * endDate = sdf.parse(request.getParameter("endDate"));
		 * 
		 * } catch (ParseException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
		// vo 삽입
		vo.setStartDate(request.getParameter("startDate"));
		vo.setEndDate(request.getParameter("endDate"));
		vo.setRegisterId(session_id);
		vo.setTitle(request.getParameter("title"));
		vo.setCategory(request.getParameter("category"));
		vo.setCompany(request.getParameter("company"));
		vo.setBill(Integer.parseInt(request.getParameter("bill")));
		vo.setAdress(request.getParameter("adress"));
		vo.setSpotNum(request.getParameter("spotNum"));
		vo.setContents(request.getParameter("contents"));
		if (fileName.equals(null)||fileName.length()<1) {
			vo.setImg("이미지없음.jpg");
		} else {
			vo.setImg(fileName);
		}

		System.out.println(vo.toString());

		dao.RRboardinsert(vo);
		// 모델 전송
		model.addAttribute("id", session_id);

		return "redirect:menu3";
	}

	@RequestMapping("/showContentsForm")
	public String showContentsForm(Model model, @RequestParam("codeNum") int codeNum) {

		// id 체크
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("id", session_id);

		// 체크
		RRboardVO vo = dao.getcontents(codeNum);
		// vo 전송
		model.addAttribute("vo", dao.getcontents(codeNum));
		model.addAttribute("CONTENT", "menu/menu3/showContentsForm.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	@RequestMapping("/insertSubmit")
	public String insertSubmit(Model model, @RequestParam("codeNum") int codeNum,
			@RequestParam("contents") String contents, @RequestParam("bill") int bill,
			@RequestParam("userstartDate") String userstartDate, @RequestParam("userendDate") String userendDate) {
		
		// 세션 아이디 가져 오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		// vo 생성
		RPboardVO vo = new RPboardVO();

		// 세팅1
		vo.setCodeNum(codeNum);
		vo.setReaquestId(session_id);
		vo.setContents(contents);
		vo.setUserendDate(userendDate);
		vo.setUserstartDate(userstartDate);
		vo.setBill(bill);

		RRboardVO rrvo = dao.getcontents(codeNum);

		// 세팅2
		vo.setCompany(rrvo.getCompany());
		vo.setRegisterId(rrvo.getRegisterId());
		vo.setSpotNum(rrvo.getSpotNum());
		vo.setAdress(rrvo.getAdress());
		vo.setCategory(rrvo.getCategory());
		vo.setImg(rrvo.getImg());
		vo.setStartDate(rrvo.getStartDate());
		vo.setEndDate(rrvo.getEndDate());
		// vo.setBill(bill);

		dao.RPboardinsert(vo);

		return "redirect:menu3";
	}

	@RequestMapping("/menu3_2")
	public String menu3_2(Model model) {
		// 리스트 지도로 리다이렉트
		return "redirect:menu3";
	}

	// 리스트형 대관 확인
	@RequestMapping("/menu3_3")
	public String menu3_3(Model model) {

		RRboardVO vo = new RRboardVO();

		vo.setPackageStatus("대여가능");

		List<RRboardVO> result = dao.SelectALL(vo);

		System.out.println("size=" + result.size());

		model.addAttribute("total", result.size());
		model.addAttribute("list", result);
		model.addAttribute("CONTENT", "menu/menu3/left_menu/menu3_3.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	// 관리자 대관 확인 수정
	@RequestMapping(value = "/RRlist", method = RequestMethod.GET)
	public String RRlistGet(Model model) {
		RRboardVO vo = new RRboardVO();

		List<RRboardVO> result = dao.SelectALLAD(vo);

		System.out.println("size=" + result.size());

		model.addAttribute("total", result.size());
		model.addAttribute("list", result);
		model.addAttribute("CONTENT", "menu/menu3/admin/RRlist.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	// 관리자 대관 확인 수정 + 검색
	@RequestMapping(value = "/RRlist", method = RequestMethod.POST)
	public String RRlistPost(Model model, @RequestParam("status") String status) {

		RRboardVO vo = new RRboardVO();

		System.out.println(status);
		
		vo.setPackageStatus(status);

		List<RRboardVO> result = dao.SelectALLAD(vo);

		System.out.println("size=" + result.size());

		model.addAttribute("total", result.size());
		model.addAttribute("list", result);
		model.addAttribute("CONTENT", "menu/menu3/admin/RRlist.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}
	
	//관리자 rrb수저페이지
	@RequestMapping("/modyADRRB")
	public String modyADRRB(Model model, @RequestParam("codeNum") int codeNum) {

		// id 체크
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("id", session_id);

		// 체크
		RRboardVO vo = dao.getcontents(codeNum);
		// vo 전송
		model.addAttribute("vo", dao.getcontents(codeNum));
		model.addAttribute("CONTENT", "menu/menu3/admin/modyRRB.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}
	// 관리자 RRBupdate
	@RequestMapping("/RRBADupdate")
	public String RRBADupdate(Model model, UploadVO dto, @RequestParam("contents") String contents,
			@RequestParam("bill") int bill, @RequestParam("title") String title, @RequestParam("adress") String adress,
			@RequestParam("company") String company, @RequestParam("spotNum") String spotNum,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			@RequestParam("category") String category, @RequestParam("codeNum") int codeNum) {
		// 파일처리
		String fileName = null;
		MultipartFile uploadfile = dto.getFile();

		if (uploadfile == null) {
		} else {
			fileName = uploadfile.getOriginalFilename();
			dto.setOname(fileName);
			try {
				File file = new File(
						"C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/BoardImg/"
								+ fileName);

				int indexes = fileName.lastIndexOf(".");
				if (indexes != -1) {
					while (file.exists()) {
						indexes = fileName.lastIndexOf(".");
						System.out.println("순서 = " + indexes);
						String extension = fileName.substring(indexes);
						System.out.println("확장자 = " + extension);
						String newFileName = fileName.substring(0, indexes) + "_" + extension;
						System.out.println("새 파일 이름 = " + newFileName);
						fileName = newFileName;
						file = new File(
								"C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/BoardImg/"
										+ newFileName);
					}

					uploadfile.transferTo(file);
				}
			} catch (IOException e) {
				e.printStackTrace();
			} // try - catch
		} // if

		// vo 생성
		RRboardVO vo = new RRboardVO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		// 세팅
		vo.setCategory(category);
		vo.setContents(contents);
		vo.setTitle(title);
		vo.setAdress(adress);
		vo.setCompany(company);
		vo.setContents(contents);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		vo.setRegisterId(session_id);
		vo.setCodeNum(codeNum);

		if (fileName.equals(null)||fileName.length()<1) {
			vo.setImg("이미지없음.jpg");
		} else {
			vo.setImg(fileName);
		}

		System.out.println(vo.toString());

		dao.RRBupdate(vo);

		return "redirect:RRlist";
	}


	@RequestMapping("/setRRBstatus")
	public String RRset(Model model, @RequestParam("status") String status, @RequestParam("codeNum") int codeNum,
							@RequestParam("Rid")String rid) {

		RRboardVO vo = new RRboardVO();

		vo.setCodeNum(codeNum);
		vo.setPackageStatus(status);

		dao.setRRStatus(vo);

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		
		// 현재시간 가져오기
		long time = System.currentTimeMillis();
		SimpleDateFormat ctime = new SimpleDateFormat("yyyy-MM-dd");
		String CurrentTime = ctime.format(new Date(time));

		MailVO mailvo = new MailVO();
		
		mailvo.setRid(rid);
		mailvo.setSid(session_id);
		mailvo.setText(codeNum+"번 글의 상태가 "+status+"로 변경 됐습니다.");
		mailvo.setSenddate(CurrentTime);

		mailImpl.sendmail(mailvo);

		
		return "redirect:RRlist?status='허가대기'";
	}

	// 정산부
	@RequestMapping("/menu3_4")
	public String menu3_4(Model model, HttpServletRequest request) {

		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		String date = request.getParameter("month1");
		String key = "";
		SearchVO vo = new SearchVO();

		vo.setStatus("정산완료");

		if (keyWord != null && keyField != null && date != null) {
			// codeNum 검색
			if (keyField.equals("codeNum") && keyWord.length() > 1) {

				key = "and " + request.getParameter("keyField") + " = " + request.getParameter("keyWord").trim();

			} else if (keyField.equals("adress") || keyField.equals("reaquestId")) {// 다른
																					// 정보로
																					// 검색

				key = "and " + request.getParameter("keyField") + " like '%" + request.getParameter("keyWord").trim()
						+ "%'";
			}

			key += "and registerDate between to_date('" + date + " 00:00:01','YYYY-MM HH24:MI:SS') and to_date('"
					+ request.getParameter("month2") + " 23:59:59','YYYY-MM HH24:MI:SS')";

			vo.setKeyWord(key);
		}

		System.out.println("key:" + key);

		List<RPboardVO> result = dao.SelectCalc(vo);
		model.addAttribute("keyword", "");
		model.addAttribute("list", result);
		model.addAttribute("CONTENT", "menu/menu3/admin/calclist.jsp");
		model.addAttribute("LEFT", "join/admin_left.jsp");
		return "main";
	}

	// 관리자용 페이지 rp보드 보기
	@RequestMapping("/menu3_5")
	public String menu3_5(Model model, HttpServletRequest request) {

		SearchVO vo = new SearchVO();

		if (request.getParameter("Status") != null) {
			vo.setStatus(request.getParameter("Status"));
		}
		;

		List<RPboardVO> result = dao.showALL(vo);

		model.addAttribute("list", result);
		model.addAttribute("CONTENT", "menu/menu3/left_menu/menu3_5.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	//// 관리자용 수정
	// 수정폼으로 보내기
	@RequestMapping("/modifyRPB2")
	public String modifyRPB2(Model model, @RequestParam("seqNum") int seqNum) {

		RPboardVO vo = dao.selectModyRPB(seqNum);
		RRboardVO dto = dao.getcontents(vo.getCodeNum());

		model.addAttribute("dto", dto);
		model.addAttribute("vo", vo);
		model.addAttribute("CONTENT", "menu/menu3/admin/modyRPB.jsp");
		model.addAttribute("LEFT", "join/admin_left.jsp");
		return "main";
	}

	// 수정하기
	@RequestMapping("/updateRPB2")
	public String updateRPB2(Model model, @RequestParam("codeNum") int codeNum,
			@RequestParam("contents") String contents, @RequestParam("bill") int bill,
			@RequestParam("userstartDate") String userstartDate, @RequestParam("userendDate") String userendDate,
			@RequestParam("reaquestId") String reaquestId, @RequestParam("seqNum") int seqNum

	) {
		// vo 생성
		RPboardVO vo = new RPboardVO();
		// 세팅
		vo.setCodeNum(codeNum);
		vo.setReaquestId(reaquestId);
		vo.setContents(contents);
		vo.setUserendDate(userendDate);
		vo.setUserstartDate(userstartDate);
		vo.setBill(bill);
		vo.setSeqNum(seqNum);

		System.out.println(vo.toString());

		dao.updateRPB(vo);

		return "redirect:menu3_4";
	}

	//// 일반회원용
	// 수정폼으로 보내기
	@RequestMapping("/modifyRPB")
	public String modifyRPB(Model model, @RequestParam("seqNum") int seqNum) {

		RPboardVO vo = dao.selectModyRPB(seqNum);
		System.out.println(vo.toString());
		model.addAttribute("vo", vo);
		model.addAttribute("CONTENT", "menu/menu3/admin/modyRPB.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	// 수정하기
	@RequestMapping("/updateRPB")
	public String updateRPB(Model model, @RequestParam("codeNum") int codeNum,
			@RequestParam("contents") String contents, @RequestParam("bill") int bill,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			@RequestParam("userstartDate") String userstartDate, @RequestParam("userendDate") String userendDate,
			@RequestParam("adress") String adress, @RequestParam("registerId") String registerId,
			@RequestParam("reaquestId") String reaquestId, @RequestParam("seqNum") int seqNum

	) {
		// vo 생성
		RPboardVO vo = new RPboardVO();
		// 세팅
		vo.setCodeNum(codeNum);
		vo.setReaquestId(reaquestId);
		vo.setContents(contents);
		vo.setUserendDate(userendDate);
		vo.setUserstartDate(userstartDate);
		vo.setBill(bill);
		vo.setRegisterId(registerId);
		vo.setAdress(adress);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);

		dao.updateRPB(vo);

		return "redirect:menu3_5";
	}

	@RequestMapping("/setRPBstatus")
	public String setRPBstatus(Model model, @RequestParam("seqNum") int seqNum, @RequestParam("status") String status,
			@RequestParam("Rid")String rid, @RequestParam("codeNum")int codeNum) {
		// vo 생성
		RPboardVO vo = new RPboardVO();
		// 세팅
		vo.setSeqNum(seqNum);
		vo.setPackageStatus(status);

		System.out.println("sta" + status);

		dao.setRPBstatus(vo);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		
		// 현재시간 가져오기
		long time = System.currentTimeMillis();
		SimpleDateFormat ctime = new SimpleDateFormat("yyyy-MM-dd");
		String CurrentTime = ctime.format(new Date(time));

		MailVO mailvo = new MailVO();
		
		mailvo.setRid(rid);
		mailvo.setSid(session_id);
		mailvo.setText(codeNum+"번 글에 대한 대관 신청 상태가 "+status+"로 변경 됐습니다.");
		mailvo.setSenddate(CurrentTime);

		mailImpl.sendmail(mailvo);

		return "redirect:menu3_5";
	}

	// 마이 페이지

	@RequestMapping("/myRRBlist")
	public String myRRBlist(Model model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		System.out.println(session_id);
		List<RRboardVO> vo = dao.myRoomlist(session_id);

		model.addAttribute("list", vo);
		model.addAttribute("CONTENT", "menu/menu3/mypage/myRoomlist.jsp");
		model.addAttribute("LEFT", "join/mypage_left.jsp");
		return "main";
	}

	@RequestMapping("/myRPBlist")
	public String myRPBlist(Model model) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		List<RPboardVO> vo = dao.myRentlist(session_id);

		model.addAttribute("list", vo);
		model.addAttribute("CONTENT", "menu/menu3/mypage/myRentlist.jsp");
		model.addAttribute("LEFT", "join/mypage_left.jsp");
		return "main";
	}

	@RequestMapping("/myModifyRPB")
	public String myModifyRPB(Model model, @RequestParam("seqNum") int seqNum) {

		RPboardVO vo = dao.selectModyRPB(seqNum);
		RRboardVO dto = dao.getcontents(vo.getCodeNum());

		model.addAttribute("dto", dto);
		model.addAttribute("vo", vo);
		model.addAttribute("CONTENT", "menu/menu3/mypage/modyRPB.jsp");
		model.addAttribute("LEFT", "join/mypage_left.jsp");
		return "main";
	}

	@RequestMapping("/myModifyRRB")
	public String myModifyRRB(Model model, @RequestParam("codeNum") int codeNum) {

		RRboardVO vo = dao.getcontents(codeNum);

		model.addAttribute("vo", vo);
		model.addAttribute("CONTENT", "menu/menu3/mypage/modyRRB.jsp");
		model.addAttribute("LEFT", "join/mypage_left.jsp");
		return "main";
	}

	//자기 상태 수정
	@RequestMapping("/setMyRRBstatus")
	public String setMyRRBstatus(Model model, @RequestParam("status") String status, @RequestParam("codeNum") int codeNum) {

		RRboardVO vo = new RRboardVO();

		vo.setCodeNum(codeNum);
		vo.setPackageStatus(status);

		dao.setRRStatus(vo);

		return "redirect:myRRBlist";
	}
	
	// RRBupdate
	@RequestMapping("/RRBupdate")
	public String RRBupdate(Model model, UploadVO dto, @RequestParam("contents") String contents,
			@RequestParam("bill") int bill, @RequestParam("title") String title, @RequestParam("adress") String adress,
			@RequestParam("company") String company, @RequestParam("spotNum") String spotNum,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			@RequestParam("category") String category, @RequestParam("codeNum") int codeNum) {
		// 파일처리
		String fileName = null;
		MultipartFile uploadfile = dto.getFile();

		if (uploadfile == null) {
		} else {
			fileName = uploadfile.getOriginalFilename();
			dto.setOname(fileName);
			try {
				File file = new File(
						"C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/BoardImg/"
								+ fileName);

				int indexes = fileName.lastIndexOf(".");
				if (indexes != -1) {
					while (file.exists()) {
						indexes = fileName.lastIndexOf(".");
						System.out.println("순서 = " + indexes);
						String extension = fileName.substring(indexes);
						System.out.println("확장자 = " + extension);
						String newFileName = fileName.substring(0, indexes) + "_" + extension;
						System.out.println("새 파일 이름 = " + newFileName);
						fileName = newFileName;
						file = new File(
								"C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/BoardImg/"
										+ newFileName);
					}

					uploadfile.transferTo(file);
				}
			} catch (IOException e) {
				e.printStackTrace();
			} // try - catch
		} // if

		// vo 생성
		RRboardVO vo = new RRboardVO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		// 세팅
		vo.setCategory(category);
		vo.setContents(contents);
		vo.setTitle(title);
		vo.setAdress(adress);
		vo.setCompany(company);
		vo.setContents(contents);
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		vo.setRegisterId(session_id);
		vo.setCodeNum(codeNum);

		if (fileName.equals(null)||fileName.length()<1) {
			vo.setImg("이미지없음.jpg");
		} else {
			vo.setImg(fileName);
		}

		System.out.println(vo.toString());

		dao.RRBupdate(vo);

		return "redirect:myRRBlist";
	}

	// RPBupdate
	// 수정하기
	@RequestMapping("/RPBupdate")
	public String RPBupdate(Model model, @RequestParam("contents") String contents, @RequestParam("bill") int bill,
			@RequestParam("userstartDate") String userstartDate, @RequestParam("userendDate") String userendDate,
			@RequestParam("reaquestId") String reaquestId, @RequestParam("seqNum") int seqNum

	) {
		// vo 생성
		RPboardVO vo = new RPboardVO();
		// 세팅
		vo.setReaquestId(reaquestId);
		vo.setContents(contents);
		vo.setUserendDate(userendDate);
		vo.setUserstartDate(userstartDate);
		vo.setBill(bill);
		vo.setSeqNum(seqNum);

		System.out.println(vo.toString());

		dao.updateRPB(vo);

		return "redirect:myRPBlist";
	}
}