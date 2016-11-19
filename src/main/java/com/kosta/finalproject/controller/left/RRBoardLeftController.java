package com.kosta.finalproject.controller.left;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.finalproject.dao.RRBoardDao;
import com.kosta.finalproject.dao.RRBoardDaoImpl;
import com.kosta.finalproject.vo.RRboardVO;
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
		
		
		//날짜 타입으로 변환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate=null, endDate=null;
		try {
			startDate = sdf.parse(request.getParameter("startDate"));
			endDate = sdf.parse(request.getParameter("endDate"));

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		vo.setStartDate(startDate);
		vo.setEndDate(endDate);
		vo.setReaquestId(session_id);
		vo.setTitle(request.getParameter("title"));
		vo.setCategory(request.getParameter("category"));
		vo.setCompany(request.getParameter("company"));
		vo.setBill(Integer.parseInt(request.getParameter("bill")));
		vo.setAdress(request.getParameter("adress"));
		vo.setSpotNum(request.getParameter("spotNum"));
		vo.setContents(request.getParameter("contents"));
		vo.setImg(fileName);
		
		
		System.out.println(vo.toString());

		dao.RRboardinsert(vo);
		
		model.addAttribute("id", session_id);
		model.addAttribute("CONTENT", "menu/menu3/left_menu/menu3.jsp");
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