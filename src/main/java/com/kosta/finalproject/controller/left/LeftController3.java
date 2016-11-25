package com.kosta.finalproject.controller.left;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.finalproject.dao.FreeDaoImpl;
import com.kosta.finalproject.vo.FreeBoardVO;
import com.kosta.finalproject.vo.UploadVO;

@Controller
public class LeftController3 {
	
	@Autowired
	private FreeDaoImpl freeDaoImpl;

	// �� ���� Form_GET
	@RequestMapping(value = "/free_update_get", method = RequestMethod.GET)
	public String free_update(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		String bnum = request.getParameter("bnum");

		FreeBoardVO vo = freeDaoImpl.showBoardthis(Integer.parseInt(bnum));
		
		model.addAttribute("bnum", vo.getBnum());
		model.addAttribute("title", vo.getTitle());
		model.addAttribute("id", session_id);
		model.addAttribute("contents", vo.getContents());
		model.addAttribute("img", vo.getImg());

		model.addAttribute("session_id", session_id);
		model.addAttribute("CONTENT", "menu/menu4/free4/free_update.jsp");
		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "main";
	}

	// �� ���� Form_POST
	@RequestMapping(value = "/free_update", method = RequestMethod.POST)
	public String free_update2(Model model, HttpServletRequest request, UploadVO dto) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		String fileName = null;
		MultipartFile uploadfile = dto.getFile();
		
		// �̹��� ó��
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
						System.out.println("���� = " + indexes);
						String extension = fileName.substring(indexes);
						System.out.println("Ȯ���� = " + extension);
						String newFileName = fileName.substring(0, indexes) + "_" + extension;
						System.out.println("�� ���� �̸� = " + newFileName);
						fileName = newFileName;
						file = new File("C:/finalproject/team4/src/main/webapp/resources/BoardImg/" + newFileName);
					}
				}
				uploadfile.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			} // try - catch
		} // if

		FreeBoardVO vo = new FreeBoardVO();
		
		String bnum = request.getParameter("bnum");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String img = fileName;

		
		vo.setBnum(Integer.parseInt(bnum));
		vo.setContents(contents);
		vo.setId(session_id);
		vo.setImg(img);
		vo.setTitle(title);

		model.addAttribute("session_id", session_id);

		freeDaoImpl.updateBoardDetail(vo);

		return "redirect:free_list";
	}

	// �۾��� Form
	@RequestMapping("/free_write")
	public String free_write(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		String bnum = request.getParameter("bnum");

		System.out.println("Ÿ��~~");

		if (bnum != null) {
			model.addAttribute("title", "[�亯] ");
			model.addAttribute("bnum", bnum);

			model.addAttribute("session_id", session_id);
		}

		model.addAttribute("session_id", session_id);
		model.addAttribute("CONTENT", "menu/menu4/free4/free_write.jsp");
		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "main";
	}

	// �۾��� ��� ����
	@RequestMapping("/free_write2")
	public String free_write2(Model model, HttpServletRequest request, UploadVO dto) {
		String fileName = null;

		// �̹��� ó��
		System.out.println("�̹��� ó�� ����");
		
		MultipartFile uploadfile = dto.getFile();
		
		
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
						System.out.println("���� = " + indexes);
						String extension = fileName.substring(indexes);
						System.out.println("Ȯ���� = " + extension);
						String newFileName = fileName.substring(0, indexes) + "_" + extension;
						System.out.println("�� ���� �̸� = " + newFileName);
						fileName = newFileName;
						file = new File("C:/finalproject/team4/src/main/webapp/resources/BoardImg/" + newFileName);
					}
				}
				uploadfile.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			} // try - catch
		} // if
			// ������ ���̽� ó���� ���� ��ġ���� ó��
		System.out.println("������ ���̽� ó�� ����");

		FreeBoardVO vo = new FreeBoardVO();
		String bgnum = request.getParameter("bnum");
		String title = request.getParameter("title");
		String id = request.getParameter("id");
		String contents = request.getParameter("contents");
		
		String img = fileName;

		System.out.println(bgnum);

		if (bgnum.equals("")) {
			
		}

		else {
			vo.setBgnum(Integer.parseInt(bgnum));
		}

		vo.setImg(img);
		vo.setTitle(title);
		vo.setId(id);
		vo.setContents(contents);
		

		freeDaoImpl.writeBoard(vo);

		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "redirect:free_list";
	}

	// �󼼺���
	@RequestMapping("/free_content")
	public String free_content(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		int bnum = Integer.parseInt(request.getParameter("bnum"));

		freeDaoImpl.updateBoardCount(bnum);
		FreeBoardVO vo = freeDaoImpl.showBoardthis(bnum);
		ArrayList<FreeBoardVO> list = freeDaoImpl.selectBoardReply(bnum);

		model.addAttribute("session_id", session_id);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("CONTENT", "menu/menu4/free4/free_content.jsp");
		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "main";
	}

	// �ۻ���
	@RequestMapping("/free_delete")
	public String free_delete(Model model, HttpServletRequest request) {
		String bnum = request.getParameter("bnum");
		freeDaoImpl.deleteBoard(Integer.parseInt(bnum));

		return "redirect:free_list";
	}

	// ���û���
	@RequestMapping("/free_re_delete")
	public String free_re_delete(Model model, HttpServletRequest request) {
		String reply_bnum = request.getParameter("reply_bnum");

		freeDaoImpl.deleteBoard(Integer.parseInt(reply_bnum));

		FreeBoardVO vo = freeDaoImpl.showBoardthis(Integer.parseInt(request.getParameter("bnum")));
		ArrayList<FreeBoardVO> list = freeDaoImpl.selectBoardReply(Integer.parseInt(request.getParameter("bnum")));

		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("LEFT", "menu/menu4/left.jsp");
		model.addAttribute("CONTENT", "menu/menu4/free4/free_content.jsp");

		return "main";
	
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	/*@RequestMapping("/menu3_2")
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
	}*/
}
