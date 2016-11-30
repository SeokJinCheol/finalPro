package com.kosta.finalproject.controller.left;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collections;
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
import com.kosta.finalproject.dao.MailImpl;
import com.kosta.finalproject.dao.RegisterBoardDaoImpl;
import com.kosta.finalproject.dao.ReviewImpl;
import com.kosta.finalproject.dao.StorageBoardDaoImpl;
import com.kosta.finalproject.vo.CheckBoardVO;
import com.kosta.finalproject.vo.MailVO;
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

	@Autowired
	private MailImpl mailImpl;

	@RequestMapping("/menu2_1")
	public String menu2_1(Model model, HttpServletRequest request) throws Exception {

		// id �޾ƿ���
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		String packageStatus = "�뿩����";

		// �˻� Ȯ��
		String keyword = request.getParameter("keyword");
		String word = request.getParameter("word");
		String id = request.getParameter("id");

		// �뿩���
		List<RegisterBoardVO> Registerpossibility = null;

		// �Ⱓ ����
		// ����ð� ��������
		long time = System.currentTimeMillis();
		SimpleDateFormat ctime = new SimpleDateFormat("yyyy-MM-dd");
		String CurrentTime = ctime.format(new Date(time));

		// ���� ����
		List<RegisterBoardVO> count = registerBoardDaoImpl.registercount();
		int registercount = count.get(0).getCodeNum();
		System.out.println(registercount);

		SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");
		Date nowDate = simpledate.parse(CurrentTime);
		Registerpossibility = registerBoardDaoImpl.Registerselect();

		int i = 0;
		while (true) {
			if (Registerpossibility.get(i).getPackageStatus().equals("�뿩����")) {
				int codeNum = Registerpossibility.get(i).getCodeNum();
				String endDate = Registerpossibility.get(i).getEndDate();
				Date endDate1 = simpledate.parse(endDate);
				// ���� �Ǻ�
				if ((nowDate.getTime() - endDate1.getTime()) >= 0) {
					String Status = "�Ⱓ����";
					// �뿩�Խ��� ��Ȳ ����
					RegisterBoardVO registervo = new RegisterBoardVO();
					registervo.setPackageStatus(Status);
					registervo.setCodeNum(codeNum);
					registerBoardDaoImpl.packageStatus(registervo);

					// üũ ����Ʈ ��Ȳ ����
					CheckBoardVO checkvo = new CheckBoardVO();
					checkvo.setCodeNum(codeNum);
					checkvo.setPackageStatus(Status);
					checkBoardDaoImpl.packageStatus(checkvo);
				}
			}
			if ((registercount - 1) == i) {
				break;
			} else
				i++;
		}
		// �Ⱓ���� ��

		if (keyword == null) {
			Registerpossibility = registerBoardDaoImpl.Registerpossibility(packageStatus);

		} else if (keyword.equalsIgnoreCase("title") && word != null) {
			Registerpossibility = registerBoardDaoImpl.pselectTitle(packageStatus, word);
			model.addAttribute("word", word);
			model.addAttribute("keyword", keyword);

		} else if (keyword.equalsIgnoreCase("category") && word != null) {
			Registerpossibility = registerBoardDaoImpl.pselectCategory(packageStatus, word);
			model.addAttribute("word", word);
			model.addAttribute("keyword", keyword);

		} else {
			Registerpossibility = Collections.EMPTY_LIST;
		}

		model.addAttribute("Registerpossibility", Registerpossibility);
		model.addAttribute("CONTENT", "menu/menu2/left_menu/menu2_1.jsp");
		model.addAttribute("LEFT", "menu/menu2/left.jsp");
		return "main";
	}

	// ���� �뿩 ���
	@RequestMapping("/menu2_2")
	public String menu2_2(Model model) {

		// �α��� ���� Ȯ��
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		// ���� �뿩���
		List<RegisterBoardVO> MyRegisterselect = registerBoardDaoImpl.MyRegisterselect(session_id);

		model.addAttribute("MyRegisterselect", MyRegisterselect);

		model.addAttribute("CONTENT", "menu/menu2/left_menu/menu2_2.jsp");
		model.addAttribute("LEFT", "menu/menu2/left.jsp");
		return "main";
	}

	// �����ۼ� �뿩����
	@RequestMapping("/reviewendrent")
	public String reviewendrent(Model model, HttpServletRequest request) {

		int codeNum = Integer.parseInt(request.getParameter("codeNum"));
		model.addAttribute("codeNum", codeNum);
		model.addAttribute("LEFT", "menu/menu2/left.jsp");
		model.addAttribute("CONTENT", "menu/menu2/Review.jsp");
		return "main";
	}

	// �ݳ� ��û
	@RequestMapping("/endrent")
	public String endrent(Model model, HttpServletRequest request) {

		// �α��� ���� Ȯ��
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		// �����ۼ�
		String reviewtext = request.getParameter("reviewtext");
		if (reviewtext != "") {
			ReviewVO reviewvo = new ReviewVO();
			reviewvo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
			reviewvo.setReviewpoint(Integer.parseInt(request.getParameter("reviewpoint")));
			reviewvo.setReviewtext(request.getParameter("reviewtext"));
			reviewvo.setReviewid(session_id);
			reviewImpl.reviewinsert(reviewvo);
		}

		// �뿩���� �Խ��� �ݳ���û
		RegisterBoardVO registervo = new RegisterBoardVO();
		String packageStatus = "�ݳ���û";
		registervo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		registervo.setPackageStatus(packageStatus);
		registerBoardDaoImpl.packageStatus(registervo);

		// ���� üũ ��Ȳ �ݳ���û
		CheckBoardVO checkvo = new CheckBoardVO();
		checkvo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		checkvo.setPackageStatus(packageStatus);
		checkBoardDaoImpl.packageStatus(checkvo);

		// ���� �뿩���
		List<RegisterBoardVO> MyRegisterselect = registerBoardDaoImpl.MyRegisterselect(session_id);

		model.addAttribute("MyRegisterselect", MyRegisterselect);

		model.addAttribute("CONTENT", "menu/menu2/left_menu/menu2_2.jsp");
		model.addAttribute("LEFT", "menu/menu2/left.jsp");

		return "main";
	}

	// �뿩 ���
	@RequestMapping("/rentcancel")
	public String rentcancel(Model model, HttpServletRequest request) {

		// ����ð� ��������
		long time = System.currentTimeMillis();
		SimpleDateFormat ctime = new SimpleDateFormat("yyyy-MM-dd");
		String CurrentTime = ctime.format(new Date(time));

		// ���� �߼�
		String pagecheck = request.getParameter("pagecheck");
		String rentter = request.getParameter("rentter");
		String codeNum = request.getParameter("codeNum");
		String text = codeNum + "���� �뿩 ��û�� ��ҵǾ����ϴ�.";

		MailVO mailvo = new MailVO();
		mailvo.setRid(rentter);
		mailvo.setSid("admin");
		mailvo.setText(text);
		mailvo.setSenddate(CurrentTime);

		mailImpl.sendmail(mailvo);

		// �α��� ���� Ȯ��
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		// �뿩���� �Խ��� ��ҽ�û
		RegisterBoardVO registervo = new RegisterBoardVO();
		String packageStatus = "�뿩����";
		registervo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		registervo.setPackageStatus(packageStatus);
		registervo.setRegisterId("");
		registervo.setUserstartDate("");
		registervo.setUserendDate("");
		registerBoardDaoImpl.PackageStatusUP(registervo);

		// ���� üũ ��Ȳ �ݳ���û
		CheckBoardVO checkvo = new CheckBoardVO();
		checkvo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		checkvo.setPackageStatus(packageStatus);
		checkvo.setUserstartDate("");
		checkvo.setUserendDate("");
		checkvo.setRentter("");
		checkBoardDaoImpl.Checkrentterup(checkvo);

		if (pagecheck == "admin") {

			String possibility = "�뿩��û";
			List<RegisterBoardVO> rentreadylist = registerBoardDaoImpl.Registerpossibility(possibility);
			model.addAttribute("rentreadylist", rentreadylist);
			model.addAttribute("CONTENT", "menu/menu2/left_menu/registeradminpage.jsp");

		} else {
			// ���� �뿩���
			List<RegisterBoardVO> MyRegisterselect = registerBoardDaoImpl.MyRegisterselect(session_id);
			model.addAttribute("MyRegisterselect", MyRegisterselect);
			model.addAttribute("CONTENT", "menu/menu2/left_menu/menu2_2.jsp");
		}

		model.addAttribute("LEFT", "menu/menu2/left.jsp");

		return "main";
	}

	@RequestMapping("/rentreadylist")
	public String rentreadylist(Model model) {

		// �α��� ���� Ȯ��
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		String possibility = "�뿩��û";
		List<RegisterBoardVO> rentreadylist = registerBoardDaoImpl.Registerpossibility(possibility);

		model.addAttribute("rentreadylist", rentreadylist);
		model.addAttribute("CONTENT", "menu/menu2/left_menu/registeradminpage.jsp");
		model.addAttribute("LEFT", "menu/menu2/left.jsp");

		return "main";
	}

	// �뿩 ��� admin�� ����
	@RequestMapping("/rentcancelend")
	public String rentcancelend(Model model, HttpServletRequest request) throws Exception {

		// �α��� ���� Ȯ��
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		// �뿩���� �Խ��� �ݳ���û
		RegisterBoardVO registervo = new RegisterBoardVO();
		String packageStatus = "�뿩����";
		registervo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		registervo.setPackageStatus(packageStatus);
		registervo.setRegisterId("");
		registervo.setUserstartDate("");
		registervo.setUserendDate("");
		registerBoardDaoImpl.PackageStatusUP(registervo);

		// ���� üũ ��Ȳ �ݳ���û
		CheckBoardVO checkvo = new CheckBoardVO();
		checkvo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		checkvo.setPackageStatus(packageStatus);
		checkvo.setRentter("");
		checkvo.setUserstartDate("");
		checkvo.setUserendDate("");
		checkBoardDaoImpl.Checkrentterup(checkvo);

		// StorageBoard �ݳ���
		StorageBoardVO storagevo = new StorageBoardVO();

		// ����ð� ��������
		long time = System.currentTimeMillis();
		SimpleDateFormat ctime = new SimpleDateFormat("yyyy-MM-dd");
		String CurrentTime = ctime.format(new Date(time));

		storagevo.setEndDate(CurrentTime);
		storagevo.setsNum(Integer.parseInt(request.getParameter("sNum")));
		storagevo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
		storageBoardDaoImpl.storageend(storagevo);

		// �뿩 ��� ī��Ʈ
		int codeNum = Integer.parseInt(request.getParameter("codeNum"));
		List<StorageBoardVO> storagecount = storageBoardDaoImpl.codeNumCount(codeNum);
		model.addAttribute("storagecount", storagecount);

		String possibility = "�뿩��û";
		List<RegisterBoardVO> rentreadylist = registerBoardDaoImpl.Registerpossibility(possibility);
		model.addAttribute("rentreadylist", rentreadylist);
		model.addAttribute("CONTENT", "menu/menu2/left_menu/registeradminpage.jsp");
		model.addAttribute("LEFT", "menu/menu2/left.jsp");

		return "main";
	}

	@RequestMapping("/storageendrent")
	public String storageendrent(Model model, HttpServletRequest request) {

		// �뿩 ��� ī��Ʈ
		int codeNum = Integer.parseInt(request.getParameter("codeNum"));
		List<StorageBoardVO> storagecount1 = storageBoardDaoImpl.codeNumCount1(codeNum);
		model.addAttribute("storagecount1", storagecount1);

		// ���� ����
		List<CheckBoardVO> rentstartlist = checkBoardDaoImpl.codeNumselect(codeNum);
		model.addAttribute("rentstartlist", rentstartlist);

		model.addAttribute("CONTENT", "menu/menu2/write/rantendForm.jsp");
		model.addAttribute("LEFT", "menu/menu2/left.jsp");
		return "main";
	}

	@RequestMapping("/rentoutlist")
	public String rentoutlist(Model model) {

		// �α��� ���� Ȯ��
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		String possibility = "�ݳ���û";
		List<RegisterBoardVO> rentreadylist = registerBoardDaoImpl.Registerpossibility(possibility);
		model.addAttribute("rentreadylist", rentreadylist);
		model.addAttribute("CONTENT", "menu/menu2/left_menu/registeradminpage.jsp");
		model.addAttribute("LEFT", "menu/menu2/left.jsp");

		return "main";
	}

	// ����
	@RequestMapping("/account")
	public String account(Model model) throws Exception {

		// stroageBoard ���� �ޱ�
		List<StorageBoardVO> storagecount = storageBoardDaoImpl.storageCount();
		int count = storagecount.get(0).getsNum();

		// storageBoard ���� �Ѹ���
		List<StorageBoardVO> storagelist = storageBoardDaoImpl.storageAll();

		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		// �Ѱ��� �迭�� ����
		Date[] Date1 = new Date[count];
		Date[] Date2 = new Date[count];
		long[] rentDate = new long[count];
		long[] pay = new long[count];
		// ����
		for (int i = 0; i < count; i++) {
			// date ����ȯ
			if (storagelist.get(i).getEndDate() != null) {
				String sDate = storagelist.get(i).getStartDate();
				Date1[i] = (Date) format.parse(sDate);
				String eDate = storagelist.get(i).getEndDate();
				Date2[i] = (Date) format.parse(eDate);
				// ��¥ �ð���
				long rentTime = Date2[i].getTime() - Date1[i].getTime();
				// �ϼ� ��ȯ
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

	@RequestMapping("/registercontent")
	public String registercontent(HttpServletRequest request, Model model) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		int codeNum = Integer.parseInt(request.getParameter("codeNum"));

		List<RegisterBoardVO> registercontent = registerBoardDaoImpl.registercontent(codeNum);

		model.addAttribute("session_id", session_id);
		model.addAttribute("result", registercontent);
		model.addAttribute("LEFT", "menu/menu2/left.jsp");
		model.addAttribute("CONTENT", "menu/menu2/write/registercontent.jsp");
		return "main";
	}
}