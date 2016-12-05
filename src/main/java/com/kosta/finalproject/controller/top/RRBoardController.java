package com.kosta.finalproject.controller.top;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosta.finalproject.dao.RRBoardDao;
import com.kosta.finalproject.vo.RRboardVO;

@Controller
@SessionAttributes({ "id" })
public class RRBoardController {
	@Autowired
	private RRBoardDao dao;

	// Menu_3
	@RequestMapping("/menu3")
	public String menu3(Model model) {

		RRboardVO vo = new RRboardVO();
		String inpo = "";

		vo.setPackageStatus("대여가능");

		List<RRboardVO> result = dao.SelectALL(vo);

		System.out.println("size=" + result.size());

		for (int i = 0; i < result.size(); i++) {
			if (i != 0) {
				inpo += ",";
			}

			inpo += "{ codeNum : '" + result.get(i).getCodeNum() + "', spotNum : new daum.maps.LatLng"
					+ result.get(i).getSpotNum() + ", adress : '" + result.get(i).getAdress() + "', startDate : '"
					+ result.get(i).getStartDate() + "', endDate : '" + result.get(i).getEndDate() + "', title : '"
					+ result.get(i).getTitle() +"'}";

		}

		System.out.println(inpo);
		model.addAttribute("total", result.size());
		model.addAttribute("inpo", inpo);
		model.addAttribute("list", result);
		model.addAttribute("CONTENT", "menu/menu3/menu3.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}	
	
}