package com.kosta.finalproject.controller.top;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.kosta.finalproject.dao.CheckBoardDaoImpl;
import com.kosta.finalproject.dao.RegisterBoardDaoImpl;
import com.kosta.finalproject.dao.RequestBoardDaoImpl;
import com.kosta.finalproject.vo.CheckBoardVO;
import com.kosta.finalproject.vo.RegisterBoardVO;
import com.kosta.finalproject.vo.RequestBoardVO;
import com.kosta.finalproject.vo.UploadVO;

@Controller
public class RequestBoardController {

   @Autowired
   private RequestBoardDaoImpl requestBoardDaoImpl;

   @Autowired
   private RegisterBoardDaoImpl registerBoardDaoImpl;

   @Autowired
   private CheckBoardDaoImpl checkBoardDaoImpl;

   @RequestMapping("/menu1")
	public String menu1(Model model, HttpSession session, HttpServletRequest request) {

		// id 받아오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		//검색 확인
		String keyword = request.getParameter("keyword");
		String word = request.getParameter("word");
		String id = request.getParameter("id");
				
		// 전체 등록글
		List<RequestBoardVO> requestlist = null;
		
		if (keyword == null) {
			requestlist = requestBoardDaoImpl.RequestBoardSelectAll();

		}else if(keyword.equalsIgnoreCase("title") && word != null){
			requestlist = requestBoardDaoImpl.selectTitle(word);
			model.addAttribute("word", word);
			model.addAttribute("keyword", keyword);
			
		}else if(keyword.equalsIgnoreCase("category") && word != null){
			requestlist = requestBoardDaoImpl.selectCategory(word);
			model.addAttribute("word", word);
			model.addAttribute("keyword", keyword);
			
		} else {
			requestlist = Collections.EMPTY_LIST;
		}

		model.addAttribute("LEFT", "menu/menu1/left.jsp");
		model.addAttribute("CONTENT", "menu/menu1/menu1.jsp");
		model.addAttribute("requestlist", requestlist);

		return "main";
	}

   @RequestMapping("/requestwriteform")
   public String requestwriteform(Model model, HttpServletRequest request) {

      // 현재시간 가져오기
      long time = System.currentTimeMillis();
      SimpleDateFormat ctime = new SimpleDateFormat("yyyy-MM-dd");
      String CurrentTime = ctime.format(new Date(time));
      model.addAttribute("CurrentTime", CurrentTime);

      // id 받아오기
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      String session_id = auth.getName();
      model.addAttribute("session_id", session_id);

      model.addAttribute("LEFT", "menu/menu1/left.jsp");
      model.addAttribute("CONTENT", "menu/menu1/write/writeform.jsp");
      return "main";
   }

   @RequestMapping("/requestboardwrite")
   public String write(Model model, HttpServletRequest request, UploadVO dto) throws Exception {
      
      SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");
      Date parsedDate1 = simpledate.parse(request.getParameter("startDate"));
      Date parsedDate2 = simpledate.parse(request.getParameter("endDate"));
      Timestamp startDate = new Timestamp(parsedDate1.getTime());
      Timestamp endDate = new Timestamp(parsedDate2.getTime());

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
          } else fileName = "no_img.jpg";
      }

      // id 받아오기
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      String session_id = auth.getName();
      model.addAttribute("session_id", session_id);

      // 등록 글쓰기
      RequestBoardVO vo = new RequestBoardVO();

      vo.setReaquestId(session_id);
      vo.setTitle(request.getParameter("title"));
      vo.setCategory(request.getParameter("category"));
      vo.setCompany(request.getParameter("company"));
      vo.setStartDate(simpledate.format(startDate));
      vo.setEndDate(simpledate.format(endDate));
      vo.setBill(Integer.parseInt(request.getParameter("bill")));
      vo.setDeposit(Integer.parseInt(request.getParameter("deposit")));
      vo.setContents(request.getParameter("contents"));
      vo.setImg(fileName);

      requestBoardDaoImpl.requestinsert(vo);

      List<RequestBoardVO> requestlist = requestBoardDaoImpl.RequestBoardSelectAll();
      model.addAttribute("requestlist", requestlist);

      model.addAttribute("LEFT", "menu/menu1/left.jsp");
      model.addAttribute("CONTENT", "menu/menu1/menu1.jsp");

      return "main";
   }

   @RequestMapping("/Requestboardend")
   public String Requestboardend(Model model, HttpServletRequest request) {
	   
	  String pagecheck = request.getParameter("pagecheck");

      // id 받아오기
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      String session_id = auth.getName();
      model.addAttribute("session_id", session_id);

      // 대여종료 다 삭제
      RequestBoardVO requestvo = new RequestBoardVO();
      RegisterBoardVO registervo = new RegisterBoardVO();
      CheckBoardVO checkvo = new CheckBoardVO();

      requestvo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
      registervo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
      checkvo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));

      requestBoardDaoImpl.requestdelete(requestvo);
      registerBoardDaoImpl.registerdelete(registervo);
      checkBoardDaoImpl.checkdelect(checkvo);

      // 대여종료신청 page 이동
      String status = "대여종료신청";
      List<RequestBoardVO> requestboardstatus = requestBoardDaoImpl.requeststatus(status);
      model.addAttribute("requestboardstatus", requestboardstatus);
      model.addAttribute("CONTENT", "menu/menu1/left_menu/requeststatus.jsp");
      model.addAttribute("LEFT", "menu/menu1/left.jsp");

      return "main";
   }
}