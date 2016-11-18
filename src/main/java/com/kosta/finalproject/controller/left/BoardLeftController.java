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

import com.kosta.finalproject.dao.BoardDaoImpl;
import com.kosta.finalproject.vo.BoardVO;
import com.kosta.finalproject.vo.UploadVO;

@Controller
public class BoardLeftController {
	@Autowired
	private BoardDaoImpl boardDaoImpl;

	// �� ���� Form_GET
	@RequestMapping(value = "/freeboard_update_get", method = RequestMethod.GET)
	public String board_update(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		String bnum = request.getParameter("bnum");

		BoardVO vo = boardDaoImpl.showthis(Integer.parseInt(bnum));
		model.addAttribute("category", vo.getCategory());
		model.addAttribute("bnum", vo.getBnum());
		model.addAttribute("title", vo.getTitle());
		model.addAttribute("id", session_id);
		model.addAttribute("contents", vo.getContents());
		model.addAttribute("img", vo.getImg());

		model.addAttribute("session_id", session_id);
		model.addAttribute("CONTENT", "menu/menu4/freeboard_update.jsp");
		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "main";
	}

	// �� ���� Form_POST
	@RequestMapping(value = "/freeboard_update", method = RequestMethod.POST)
	public String board_update2(Model model, HttpServletRequest request, UploadVO dto) {
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

		BoardVO vo = new BoardVO();
		String category = request.getParameter("category");
		String bnum = request.getParameter("bnum");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String img = fileName;

		vo.setCategory(category);
		vo.setBnum(Integer.parseInt(bnum));
		vo.setContents(contents);
		vo.setId(session_id);
		vo.setImg(img);
		vo.setTitle(title);

		model.addAttribute("session_id", session_id);

		boardDaoImpl.updateDetail(vo);

		return "redirect:freeboard_list";
	}

	// �۾��� Form
	@RequestMapping("/freeboard_write")
	public String board_write(Model model, HttpServletRequest request) {
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
		model.addAttribute("CONTENT", "menu/menu4/freeboard_write.jsp");
		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "main";
	}

	// �۾��� ��� ����
	@RequestMapping("/freeboard_write2")
	public String board_write2(Model model, HttpServletRequest request, UploadVO dto) {
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

		BoardVO vo = new BoardVO();
		String bgnum = request.getParameter("bnum");
		String title = request.getParameter("title");
		String id = request.getParameter("id");
		String contents = request.getParameter("contents");
		String category = request.getParameter("category");
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
		vo.setCategory(category);

		boardDaoImpl.writeMain(vo);

		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "redirect:freeboard_list";
	}

	// �󼼺���
	@RequestMapping("/freeboard_content")
	public String board_content(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		int bnum = Integer.parseInt(request.getParameter("bnum"));

		boardDaoImpl.updateCount(bnum);
		BoardVO vo = boardDaoImpl.showthis(bnum);
		ArrayList<BoardVO> list = boardDaoImpl.selectReply(bnum);

		model.addAttribute("session_id", session_id);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("CONTENT", "menu/menu4/freeboard_content.jsp");
		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "main";
	}

	// �ۻ���
	@RequestMapping("/freeboard_delete")
	public String board_delete(Model model, HttpServletRequest request) {
		String bnum = request.getParameter("bnum");
		boardDaoImpl.delete(Integer.parseInt(bnum));

		return "redirect:freeboard_list";
	}

	// ���û���
	@RequestMapping("/freeboard_re_delete")
	public String board_re_delete(Model model, HttpServletRequest request) {
		String reply_bnum = request.getParameter("reply_bnum");

		boardDaoImpl.delete(Integer.parseInt(reply_bnum));

		BoardVO vo = boardDaoImpl.showthis(Integer.parseInt(request.getParameter("bnum")));
		ArrayList<BoardVO> list = boardDaoImpl.selectReply(Integer.parseInt(request.getParameter("bnum")));

		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("LEFT", "menu/menu4/left.jsp");
		model.addAttribute("CONTENT", "menu/menu4/freeboard_content.jsp");

		return "main";
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("/menu4_2")
	public String menu4_2(Model model) {
		model.addAttribute("CONTENT", "menu/menu4/left_menu/menu4_2.jsp");
		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "main";
	}

	@RequestMapping("/menu4_3")
	public String menu4_3(Model model) {
		model.addAttribute("CONTENT", "menu/menu4/left_menu/menu4_3.jsp");
		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "main";
	}

	@RequestMapping("/menu4_4")
	public String menu4_4(Model model) {
		model.addAttribute("CONTENT", "menu/menu4/left_menu/menu4_4.jsp");
		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "main";
	}

	@RequestMapping("/menu4_5")
	public String menu4_5(Model model) {
		model.addAttribute("CONTENT", "menu/menu4/left_menu/menu4_5.jsp");
		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "main";
	}
}