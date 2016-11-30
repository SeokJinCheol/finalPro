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
import org.springframework.web.multipart.MultipartFile;

import com.kosta.finalproject.dao.FreeDaoImpl;
import com.kosta.finalproject.vo.FreeBoardVO;
import com.kosta.finalproject.vo.UploadVO;

@Controller
public class LeftController3 {

	@Autowired
	private FreeDaoImpl freeDaoImpl;

	// 글 수정 Form_GET
	@RequestMapping(value = "/free_update_get")
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

	// 글 수정 Form_POST
	@RequestMapping(value = "/free_update")
	public String free_update2(Model model, HttpServletRequest request, UploadVO dto) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		String fileName = null;
		MultipartFile uploadfile = dto.getFile();

		// 이미지 처리
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
						System.out.println("순서 = " + indexes);
						String extension = fileName.substring(indexes);
						System.out.println("확장자 = " + extension);
						String newFileName = fileName.substring(0, indexes) + "_" + extension;
						System.out.println("새 파일 이름 = " + newFileName);
						fileName = newFileName;
						file = new File(
								"C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/BoardImg/"
										+ newFileName);
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

		return "redirect:free4_list";
	}

	// 글쓰기 Form
	@RequestMapping("/free_write")
	public String free_write(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		String bnum = request.getParameter("bnum");

		System.out.println("타요~~");

		if (bnum != null) {
			model.addAttribute("title", "[답변] ");
			model.addAttribute("bnum", bnum);
			model.addAttribute("session_id", session_id);
		}

		model.addAttribute("session_id", session_id);
		model.addAttribute("CONTENT", "menu/menu4/free4/free_write.jsp");
		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "main";
	}

	// 글쓰기 기능 수행
	@RequestMapping("/free_write2")
	public String free_write2(Model model, HttpServletRequest request, UploadVO dto) {
		String fileName = null;

		// 이미지 처리
		System.out.println("이미지 처리 시작");

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
						System.out.println("순서 = " + indexes);
						String extension = fileName.substring(indexes);
						System.out.println("확장자 = " + extension);
						String newFileName = fileName.substring(0, indexes) + "_" + extension;
						System.out.println("새 파일 이름 = " + newFileName);
						fileName = newFileName;
						file = new File(
								"C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/BoardImg/"
										+ newFileName);
					}
				}
				uploadfile.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			} // try - catch
		} // if
			// 데이터 베이스 처리를 현재 위치에서 처리
		System.out.println("데이터 베이스 처리 시작");

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

		return "redirect:free4_list";
	}

	// 상세보기
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

	// 글삭제
	@RequestMapping("/free_delete")
	public String free_delete(Model model, HttpServletRequest request) {
		String bnum = request.getParameter("bnum");
		freeDaoImpl.deleteBoard(Integer.parseInt(bnum));

		return "redirect:free4_list";
	}

	// 리플삭제
	@RequestMapping("/free_re_delete")
	public String free_re_delete(Model model, HttpServletRequest request) {
		String reply_bnum = request.getParameter("reply_bnum");

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		freeDaoImpl.deleteBoard(Integer.parseInt(reply_bnum));

		FreeBoardVO vo = freeDaoImpl.showBoardthis(Integer.parseInt(request.getParameter("bnum")));
		ArrayList<FreeBoardVO> list = freeDaoImpl.selectBoardReply(Integer.parseInt(request.getParameter("bnum")));

		model.addAttribute("session_id", session_id);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("CONTENT", "menu/menu4/free4/free_content.jsp");
		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "main";
	}

	// 리플등록
	@RequestMapping("/free4_reply")
	public String free4_reply(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		FreeBoardVO vo = new FreeBoardVO();
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		int bgnum = bnum;
		String contents = request.getParameter("contents");
		String title = "[답변]" + request.getParameter("title");
		String img = request.getParameter("img");
		vo.setBgnum(bgnum);
		vo.setContents(contents);
		vo.setTitle(title);
		vo.setId(session_id);
		vo.setImg(img);
		freeDaoImpl.writeBoard(vo);
		model.addAttribute("bnum", bnum);
		return "redirect:free_content";
	}
}