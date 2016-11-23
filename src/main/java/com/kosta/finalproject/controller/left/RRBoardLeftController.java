package com.kosta.finalproject.controller.left;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.finalproject.dao.RRBoardDaoImpl;
import com.kosta.finalproject.vo.RPboardVO;
import com.kosta.finalproject.vo.RRboardVO;
import com.kosta.finalproject.vo.SearchVO;
import com.kosta.finalproject.vo.UploadVO;

@Controller
public class RRBoardLeftController {
	
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
						File file = new File("C:/finalproject/team4/src/main/webapp/resources/BoardImg/" + fileName);

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
								file = new File("C:/finalproject/team4/src/main/webapp/resources/BoardImg/" + newFileName);
							}
						
						uploadfile.transferTo(file);
						}
					} catch (IOException e) {
						e.printStackTrace();
					} // try - catch
				} // if
		
		
	/*	//날짜 타입으로 변환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate=null, endDate=null;
		try {
			startDate = sdf.parse(request.getParameter("startDate"));
			endDate = sdf.parse(request.getParameter("endDate"));

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		//vo 삽입
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
		if(fileName.equals(null)){vo.setImg("이미지없음");}else{
		vo.setImg(fileName);}
		
		
		System.out.println(vo.toString());

		dao.RRboardinsert(vo);
		//모델 전송
		model.addAttribute("id", session_id);
		model.addAttribute("CONTENT", "menu/menu3/menu3.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}
	
	
	@RequestMapping("/showContentsForm")
	public String showContentsForm(Model model, @RequestParam("codeNum")int codeNum) {

		//id 체크
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("id", session_id);
		
		//체크
		RRboardVO vo = dao.getcontents(codeNum);
		System.out.println(vo.toString());
		//vo 전송
		model.addAttribute("vo", dao.getcontents(codeNum));
		model.addAttribute("CONTENT", "menu/menu3/showContentsForm.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}
	
	
	@RequestMapping("/insertSubmit")
	public String insertSubmit(Model model,
			@RequestParam("codeNum")int codeNum,
			@RequestParam("id")String id,
			@RequestParam("contents")String contents,
			@RequestParam("bill")int bill,
			@RequestParam("startDate")String startDate,
			@RequestParam("endDate")String endDate
			) {
		//세션 아이디 가져 오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		//vo 생성
		RPboardVO vo = new RPboardVO();
		
		//세팅1
		vo.setCodeNum(codeNum);
		vo.setReaquestId(id);
		vo.setContents(contents);
		vo.setUserendDate(endDate);
		vo.setUserstartDate(startDate);
		vo.setBill(bill);
		
		RRboardVO rrvo = dao.getcontents(codeNum);
		
		//세팅2
		vo.setCompany(rrvo.getCompany());
		vo.setRegisterId(rrvo.getRegisterId());
		vo.setSpotNum(rrvo.getSpotNum());
		vo.setAdress(rrvo.getAdress());
		vo.setCategory(rrvo.getCategory());
		vo.setImg(rrvo.getImg());
		vo.setStartDate(rrvo.getStartDate());
		vo.setEndDate(rrvo.getEndDate());
		//vo.setBill(bill);
		
		dao.RPboardinsert(vo);
		
		model.addAttribute("vo", dao.getcontents(codeNum));
		model.addAttribute("CONTENT", "menu/menu3/showContentsForm.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}	
	
	
	@RequestMapping("/menu3_2")
	public String menu3_2(Model model) {
		//리스트 지도로 리다이렉트
		return "redirect:menu3";
	}

	
	//리스트형 대관 확인
	@RequestMapping("/menu3_3")
	public String menu3_3(Model model) {
		
		RRboardVO vo = new RRboardVO();
		
		List<RRboardVO> result=dao.SelectALL(vo);
		
		System.out.println("size="+result.size());
		
		model.addAttribute("total", result.size());
		model.addAttribute("list", result);
		model.addAttribute("CONTENT", "menu/menu3/left_menu/menu3_3.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	//정산부
	@RequestMapping("/menu3_4")
	public String menu3_4(Model model,HttpServletRequest resquest
			) {
		
		
		SearchVO vo = new SearchVO();

		//검색부 실패 ㅠㅡㅠ
		vo.setStatus("정산완료");
		if(resquest.getParameter("keyField") != null){
			System.out.println("오지마");
		
		String key= resquest.getParameter("keyField")+" = '%"+resquest.getParameter("keyWord").trim()+"%'";
		vo.setKeyWord(key);
		}
		List<RPboardVO> result=dao.SelectCalc(vo);
		
		model.addAttribute("keyword","");
		model.addAttribute("list",result);
		model.addAttribute("CONTENT", "menu/menu3/admin/calclist.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
		
	}

	
	//관리자용 페이지 rp보드 보기
	@RequestMapping("/menu3_5")
		public String menu3_5(Model model) {
		
		List<RPboardVO> result=dao.showALL();
		
		System.out.println(result.get(0).toString());
		
		model.addAttribute("list", result);
		model.addAttribute("CONTENT", "menu/menu3/left_menu/menu3_5.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}
	
	
	@RequestMapping("/modifyRPB")
	public String modifyRPB(Model model, 
			 @RequestParam("seqNum")int seqNum
			) {
		
		RPboardVO vo=dao.selectModyRPB(seqNum);
	System.out.println(vo.toString());
	model.addAttribute("vo", vo);
	model.addAttribute("CONTENT", "menu/menu3/admin/modyRPB.jsp");
	model.addAttribute("LEFT", "menu/menu3/left.jsp");
	return "main";
}
	@RequestMapping("/updateRPB")
	public String updateRPB(Model model, 	
			@RequestParam("codeNum")int codeNum,
			@RequestParam("contents")String contents,
			@RequestParam("bill")int bill,
			@RequestParam("startDate")String startDate,
			@RequestParam("endDate")String endDate,
			@RequestParam("userstartDate")String userstartDate,
			@RequestParam("userendDate")String userendDate,
			@RequestParam("adress")String adress,
			@RequestParam("registerId")String registerId,
			@RequestParam("reaquestId")String reaquestId,
			@RequestParam("seqNum")int seqNum
			
			) {
		//vo 생성
		RPboardVO vo = new RPboardVO();
		//세팅
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
	public String setRPBstatus(Model model, 	
			@RequestParam("seqNum")int seqNum,
			@RequestParam("status")String status
			) {
		//vo 생성
		RPboardVO vo = new RPboardVO();
		//세팅
		vo.setSeqNum(seqNum);
		vo.setPackageStatus(status);
	
		System.out.println("sta"+status);
		
		dao.setRPBstatus(vo);
		
		
	return "redirect:menu3_5";
}
	
	
}