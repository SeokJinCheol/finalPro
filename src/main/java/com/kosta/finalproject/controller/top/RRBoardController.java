package com.kosta.finalproject.controller.top;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosta.finalproject.dao.RRBoardDao;
import com.kosta.finalproject.vo.RPboardVO;
import com.kosta.finalproject.vo.RRboardVO;
import com.kosta.finalproject.vo.SearchVO;

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
					+ result.get(i).getTitle() + "'}";

		}

		model.addAttribute("total", result.size());
		model.addAttribute("inpo", inpo);
		model.addAttribute("list", result);
		model.addAttribute("CONTENT", "menu/menu3/menu3.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	@RequestMapping("/Excelcalc")
	public String Excelcalc(Model model, HttpServletRequest request) throws Exception {

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

		model.addAttribute("storagelist", result);
		return "admin/Excelacalc";

		/*
		 * DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); // 넘겨줄 배열값 생성
		 * Date[] Date1 = new Date[count]; Date[] Date2 = new Date[count];
		 * long[] rentDate = new long[count]; long[] pay = new long[count]; //
		 * 계산식 for (int i = 0; i < count; i++) { // date 형변환 if
		 * (storagelist.get(i).getEndDate() != null) { String sDate =
		 * storagelist.get(i).getStartDate(); Date1[i] = (Date)
		 * format.parse(sDate); String eDate = storagelist.get(i).getEndDate();
		 * Date2[i] = (Date) format.parse(eDate); // 날짜 시간차 long rentTime =
		 * Date2[i].getTime() - Date1[i].getTime(); // 일수 변환 if (rentTime != 0)
		 * { rentDate[i] = rentTime / (24 * 60 * 60 * 1000); pay[i] =
		 * rentDate[i] * storagelist.get(i).getBill(); } else { rentDate[i] = 0;
		 * pay[i] = 0; } } else { rentDate[i] = 0; pay[i] = 0; }
		 * 
		 * }
		 * 
		 * model.addAttribute("rentDate", rentDate); model.addAttribute("pay",
		 * pay); model.addAttribute("storagelist", storagelist);
		 * 
		 * return "admin/Excelaccount";
		 */
	}
}