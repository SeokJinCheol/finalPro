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

		// �̹��� ó��
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
						System.out.println("���� = " + indexes);
						String extension = fileName.substring(indexes);
						System.out.println("Ȯ���� = " + extension);
						String newFileName = fileName.substring(0, indexes) + "_" + extension;
						System.out.println("�� ���� �̸� = " + newFileName);
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
		 * //��¥ Ÿ������ ��ȯ SimpleDateFormat sdf = new
		 * SimpleDateFormat("yyyy-MM-dd"); Date startDate=null, endDate=null;
		 * try { startDate = sdf.parse(request.getParameter("startDate"));
		 * endDate = sdf.parse(request.getParameter("endDate"));
		 * 
		 * } catch (ParseException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
		// vo ����
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
			vo.setImg("�̹�������.jpg");
		} else {
			vo.setImg(fileName);
		}

		System.out.println(vo.toString());

		dao.RRboardinsert(vo);
		// �� ����
		model.addAttribute("id", session_id);

		return "redirect:menu3";
	}

	@RequestMapping("/showContentsForm")
	public String showContentsForm(Model model, @RequestParam("codeNum") int codeNum) {

		// id üũ
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("id", session_id);

		// üũ
		RRboardVO vo = dao.getcontents(codeNum);
		// vo ����
		model.addAttribute("vo", dao.getcontents(codeNum));
		model.addAttribute("CONTENT", "menu/menu3/showContentsForm.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	@RequestMapping("/insertSubmit")
	public String insertSubmit(Model model, @RequestParam("codeNum") int codeNum,
			@RequestParam("contents") String contents, @RequestParam("bill") int bill,
			@RequestParam("userstartDate") String userstartDate, @RequestParam("userendDate") String userendDate) {
		
		// ���� ���̵� ���� ����
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		// vo ����
		RPboardVO vo = new RPboardVO();

		// ����1
		vo.setCodeNum(codeNum);
		vo.setReaquestId(session_id);
		vo.setContents(contents);
		vo.setUserendDate(userendDate);
		vo.setUserstartDate(userstartDate);
		vo.setBill(bill);

		RRboardVO rrvo = dao.getcontents(codeNum);

		// ����2
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
		// ����Ʈ ������ �����̷�Ʈ
		return "redirect:menu3";
	}

	// ����Ʈ�� ��� Ȯ��
	@RequestMapping("/menu3_3")
	public String menu3_3(Model model) {

		RRboardVO vo = new RRboardVO();

		vo.setPackageStatus("�뿩����");

		List<RRboardVO> result = dao.SelectALL(vo);

		System.out.println("size=" + result.size());

		model.addAttribute("total", result.size());
		model.addAttribute("list", result);
		model.addAttribute("CONTENT", "menu/menu3/left_menu/menu3_3.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	// ������ ��� Ȯ�� ����
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

	// ������ ��� Ȯ�� ���� + �˻�
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
	
	//������ rrb����������
	@RequestMapping("/modyADRRB")
	public String modyADRRB(Model model, @RequestParam("codeNum") int codeNum) {

		// id üũ
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("id", session_id);

		// üũ
		RRboardVO vo = dao.getcontents(codeNum);
		// vo ����
		model.addAttribute("vo", dao.getcontents(codeNum));
		model.addAttribute("CONTENT", "menu/menu3/admin/modyRRB.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}
	// ������ RRBupdate
	@RequestMapping("/RRBADupdate")
	public String RRBADupdate(Model model, UploadVO dto, @RequestParam("contents") String contents,
			@RequestParam("bill") int bill, @RequestParam("title") String title, @RequestParam("adress") String adress,
			@RequestParam("company") String company, @RequestParam("spotNum") String spotNum,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			@RequestParam("category") String category, @RequestParam("codeNum") int codeNum) {
		// ����ó��
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
						System.out.println("���� = " + indexes);
						String extension = fileName.substring(indexes);
						System.out.println("Ȯ���� = " + extension);
						String newFileName = fileName.substring(0, indexes) + "_" + extension;
						System.out.println("�� ���� �̸� = " + newFileName);
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

		// vo ����
		RRboardVO vo = new RRboardVO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		// ����
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
			vo.setImg("�̹�������.jpg");
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
		
		// ����ð� ��������
		long time = System.currentTimeMillis();
		SimpleDateFormat ctime = new SimpleDateFormat("yyyy-MM-dd");
		String CurrentTime = ctime.format(new Date(time));

		MailVO mailvo = new MailVO();
		
		mailvo.setRid(rid);
		mailvo.setSid(session_id);
		mailvo.setText(codeNum+"�� ���� ���°� "+status+"�� ���� �ƽ��ϴ�.");
		mailvo.setSenddate(CurrentTime);

		mailImpl.sendmail(mailvo);

		
		return "redirect:RRlist?status='�㰡���'";
	}

	// �����
	@RequestMapping("/menu3_4")
	public String menu3_4(Model model, HttpServletRequest request) {

		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		String date = request.getParameter("month1");
		String key = "";
		SearchVO vo = new SearchVO();

		vo.setStatus("����Ϸ�");

		if (keyWord != null && keyField != null && date != null) {
			// codeNum �˻�
			if (keyField.equals("codeNum") && keyWord.length() > 1) {

				key = "and " + request.getParameter("keyField") + " = " + request.getParameter("keyWord").trim();

			} else if (keyField.equals("adress") || keyField.equals("reaquestId")) {// �ٸ�
																					// ������
																					// �˻�

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

	// �����ڿ� ������ rp���� ����
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

	//// �����ڿ� ����
	// ���������� ������
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

	// �����ϱ�
	@RequestMapping("/updateRPB2")
	public String updateRPB2(Model model, @RequestParam("codeNum") int codeNum,
			@RequestParam("contents") String contents, @RequestParam("bill") int bill,
			@RequestParam("userstartDate") String userstartDate, @RequestParam("userendDate") String userendDate,
			@RequestParam("reaquestId") String reaquestId, @RequestParam("seqNum") int seqNum

	) {
		// vo ����
		RPboardVO vo = new RPboardVO();
		// ����
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

	//// �Ϲ�ȸ����
	// ���������� ������
	@RequestMapping("/modifyRPB")
	public String modifyRPB(Model model, @RequestParam("seqNum") int seqNum) {

		RPboardVO vo = dao.selectModyRPB(seqNum);
		System.out.println(vo.toString());
		model.addAttribute("vo", vo);
		model.addAttribute("CONTENT", "menu/menu3/admin/modyRPB.jsp");
		model.addAttribute("LEFT", "menu/menu3/left.jsp");
		return "main";
	}

	// �����ϱ�
	@RequestMapping("/updateRPB")
	public String updateRPB(Model model, @RequestParam("codeNum") int codeNum,
			@RequestParam("contents") String contents, @RequestParam("bill") int bill,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			@RequestParam("userstartDate") String userstartDate, @RequestParam("userendDate") String userendDate,
			@RequestParam("adress") String adress, @RequestParam("registerId") String registerId,
			@RequestParam("reaquestId") String reaquestId, @RequestParam("seqNum") int seqNum

	) {
		// vo ����
		RPboardVO vo = new RPboardVO();
		// ����
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
		// vo ����
		RPboardVO vo = new RPboardVO();
		// ����
		vo.setSeqNum(seqNum);
		vo.setPackageStatus(status);

		System.out.println("sta" + status);

		dao.setRPBstatus(vo);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		
		// ����ð� ��������
		long time = System.currentTimeMillis();
		SimpleDateFormat ctime = new SimpleDateFormat("yyyy-MM-dd");
		String CurrentTime = ctime.format(new Date(time));

		MailVO mailvo = new MailVO();
		
		mailvo.setRid(rid);
		mailvo.setSid(session_id);
		mailvo.setText(codeNum+"�� �ۿ� ���� ��� ��û ���°� "+status+"�� ���� �ƽ��ϴ�.");
		mailvo.setSenddate(CurrentTime);

		mailImpl.sendmail(mailvo);

		return "redirect:menu3_5";
	}

	// ���� ������

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

	//�ڱ� ���� ����
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
		// ����ó��
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
						System.out.println("���� = " + indexes);
						String extension = fileName.substring(indexes);
						System.out.println("Ȯ���� = " + extension);
						String newFileName = fileName.substring(0, indexes) + "_" + extension;
						System.out.println("�� ���� �̸� = " + newFileName);
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

		// vo ����
		RRboardVO vo = new RRboardVO();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		// ����
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
			vo.setImg("�̹�������.jpg");
		} else {
			vo.setImg(fileName);
		}

		System.out.println(vo.toString());

		dao.RRBupdate(vo);

		return "redirect:myRRBlist";
	}

	// RPBupdate
	// �����ϱ�
	@RequestMapping("/RPBupdate")
	public String RPBupdate(Model model, @RequestParam("contents") String contents, @RequestParam("bill") int bill,
			@RequestParam("userstartDate") String userstartDate, @RequestParam("userendDate") String userendDate,
			@RequestParam("reaquestId") String reaquestId, @RequestParam("seqNum") int seqNum

	) {
		// vo ����
		RPboardVO vo = new RPboardVO();
		// ����
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