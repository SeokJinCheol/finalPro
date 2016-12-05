package com.kosta.finalproject.controller.left;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.finalproject.dao.DefaultQADaoImpl;
import com.kosta.finalproject.vo.DefaultQAVO;
import com.kosta.finalproject.vo.QandAVO;



@Controller
public class QALeftController {
	
	@Autowired
	private DefaultQADaoImpl defaultQADaoImpl;
	
	@RequestMapping("/defaultQA")
	public String defaultQA(Model model,HttpServletRequest request){

	      int pageSize = 10;

	      String pageNum = request.getParameter("pageNum");

	      if (pageNum == null)
	         pageNum = "1";

	      int currentPage = Integer.parseInt(pageNum);

	      int startrow = (currentPage * pageSize) - (pageSize - 1);
	      int endrow = currentPage * pageSize;
	      int count = 0, number = 0;
	      List<DefaultQAVO> list = null;
	    
	         count = defaultQADaoImpl.listAllCount();  ///
	     

	      int pageCount = Math.round(count / pageSize + (count % pageSize == 0 ? 0 : 1));
	      if (count > 0) {
	        
	            list = defaultQADaoImpl.showAll(startrow, endrow);
	            model.addAttribute("list", list);
	         }
	      model.addAttribute("currentPage", new Integer(currentPage));
	      model.addAttribute("count", new Integer(count));
	      model.addAttribute("pageCount", pageCount);
	      model.addAttribute("pageSize", new Integer(pageSize));
	      model.addAttribute("CONTENT", "Q&A/DefaultQnA.jsp");
	      model.addAttribute("LEFT", "menu/menu4/left.jsp");
		return "main";
	}
	
}
