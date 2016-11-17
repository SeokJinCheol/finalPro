package com.kosta.finalproject.controller.top;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.finalproject.dao.QandADaoImpl;
import com.kosta.finalproject.vo.QandAVO;
import com.kosta.finalproject.vo.UploadVO;

@Controller
public class QandAController {
	@Autowired
	private QandADaoImpl qandADaoImpl;

	// QA 전체 글 리스트 출력 + 검색기능
	@RequestMapping("/QandA_list")
	public String getAllList(Model model, HttpServletRequest request) {
		String keyword = request.getParameter("keyword");
		int pageSize = 10;
		String word = request.getParameter("word");
		String id = request.getParameter("id");
		String pageNum = request.getParameter("pageNum");

		if (pageNum == null)
			pageNum = "1";

		int currentPage = Integer.parseInt(pageNum);

		int startRow = (currentPage * pageSize) - (pageSize - 1);
		int endRow = currentPage * pageSize;
		int count = 0, number = 0;
		List<QandAVO> list = null;
		if (keyword == null) {
			count = qandADaoImpl.getListAllCount();
		} else if (keyword.equalsIgnoreCase("title") && word != null) {
			count = qandADaoImpl.getListTitleCount(word);
		} else if (keyword.equalsIgnoreCase("id") && word != null) {
			count = qandADaoImpl.getListIDCount(word);
		}
		System.out.println("count : " + count);
		int pageCount = Math.round(count / pageSize + (count % pageSize == 0 ? 0 : 1));
		if (count > 0) {
			if (keyword == null) {
				QandAVO qaboard = new QandAVO();
				qaboard.setStartRow(startRow);
				qaboard.setEndRow(endRow);
				list = qandADaoImpl.getSelectAll(qaboard);

			} else if (keyword.equalsIgnoreCase("title") && word != null) {
				word = request.getParameter("word");

				list = qandADaoImpl.selectTitle(word, startRow, endRow);

				model.addAttribute("word", word);
				model.addAttribute("keyword", keyword);

			} else if (keyword.equalsIgnoreCase("id") && word != null) {
				word = request.getParameter("word");
				list = qandADaoImpl.selectId(word, startRow, endRow);

				model.addAttribute("word", word);
				model.addAttribute("keyword", keyword);

			}
		} else {
			list = Collections.EMPTY_LIST;
		}
		model.addAttribute("result", list);
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("count", new Integer(count));
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("CONTENT", "Q&A/QandA_list.jsp");
		model.addAttribute("LEFT", "Q&A/left.jsp");
		return "main";
	}

	// QA 게시글 작성 (폼 부르기)
	@RequestMapping(value = "/insertForm", method = RequestMethod.GET)
	public String insert(HttpServletRequest request, Model model) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		int bNum = 0, bgnum = 1, groupnum = 0, ranknum = 0;

		if (request.getParameter("bNum") != null) {
			bNum = Integer.parseInt(request.getParameter("bNum"));
			bgnum = Integer.parseInt(request.getParameter("bgnum"));
			groupnum = Integer.parseInt(request.getParameter("groupnum"));
			ranknum = Integer.parseInt(request.getParameter("ranknum"));
		}

		model.addAttribute("session_id", session_id);
		model.addAttribute("bNum", new Integer(bNum));
		model.addAttribute("bgnum", new Integer(bgnum));
		model.addAttribute("groupnum", new Integer(groupnum));
		model.addAttribute("ranknum", new Integer(ranknum));

		model.addAttribute("LEFT", "Q&A/left.jsp");
		model.addAttribute("CONTENT", "Q&A/insertForm.jsp");

		return "main";
	}

	// QA 게시글 작성 (입력)
	@RequestMapping(value = "/insertForm", method = RequestMethod.POST)
	public String insert2(HttpServletRequest request, Model model, UploadVO dto) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		request.setCharacterEncoding("utf-8");

		String fileName = null;

		// 이미지 처리
		System.out.println("이미지 처리 시작");
		MultipartFile uploadfile = dto.getFile();
		if (uploadfile != null) {
			fileName = uploadfile.getOriginalFilename();
			dto.setOname(fileName);
			try {
				File file = new File("C:/finalproject/team4/src/main/webapp/resources/QandAImg/" + fileName);
				while (file.exists()) {
					int indexes = fileName.lastIndexOf(".");
					System.out.println("순서 = " + indexes);
					String extension = fileName.substring(indexes);
					System.out.println("확장자 = " + extension);
					String newFileName = fileName.substring(0, indexes) + "_" + extension;
					System.out.println("새 파일 이름 = " + newFileName);
					fileName = newFileName;
					file = new File("C:/finalproject/team4/src/main/webapp/resources/QandAImg/" + newFileName);
				}
				uploadfile.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			} // try - catch
		} // if

		QandAVO vo = new QandAVO();

		int groupnum = Integer.parseInt(request.getParameter("groupnum"));
		int ranknum = Integer.parseInt(request.getParameter("ranknum"));
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		int bgnum = Integer.parseInt(request.getParameter("bgnum"));

		// 게시글인 경우
		if (bNum == 0) {
			vo.setbNum(bNum);
			vo.setId(request.getParameter("id"));
			vo.setCategory(request.getParameter("category"));
			vo.setTitle(request.getParameter("title"));
			vo.setContents(request.getParameter("contents"));
			vo.setImg(fileName);
			vo.setBgnum(bgnum);
			vo.setGroupnum(groupnum);
			vo.setRanknum(ranknum);
			vo.setbDate(new Timestamp(System.currentTimeMillis()));
			int number = 0;

			number = qandADaoImpl.getMaxNum();

			if (number != 0) {
				number += 1;
			} else {
				number = 1;
			}

			bgnum = number;
			groupnum = 0;
			ranknum = 0;
			vo.setBgnum(bgnum);
			vo.setGroupnum(groupnum);
			vo.setRanknum(ranknum);

			qandADaoImpl.qainsertMember(vo);
		}

		// 댓글인 경우
		if (bNum != 0) {
			vo.setbNum(bNum);
			vo.setId(request.getParameter("id"));
			vo.setContents(request.getParameter("contents"));
			vo.setBgnum(bgnum);
			vo.setGroupnum(groupnum);
			vo.setRanknum(ranknum);
			vo.setbDate(new Timestamp(System.currentTimeMillis()));
			int number = 0;

			String sid = request.getParameter("id");
			System.out.println(sid);

			number = qandADaoImpl.getMaxNum();

			qandADaoImpl.qaupdate(vo);
			groupnum += 1;
			ranknum += 1;
			vo.setGroupnum(groupnum);
			vo.setRanknum(ranknum);

			qandADaoImpl.reqainsertMember(vo);
		}

		model.addAttribute("session_id", session_id);
		model.addAttribute("groupnum", vo.getGroupnum());
		model.addAttribute("bNum", vo.getbNum());
		model.addAttribute("bgnum", vo.getBgnum());

		model.addAttribute("CONTENT", "Q&A/insertPro.jsp");

		return "main";
	}

	// QA 상세페이지
	@RequestMapping("/content")
	public String content(HttpServletRequest request, Model model) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		int bNum = Integer.parseInt(request.getParameter("bNum"));
		// String pageNum= request.getParameter("pageNum");
		int bgnum = Integer.parseInt(request.getParameter("bgnum"));

		qandADaoImpl.readcountUpdate(bNum);
		List<QandAVO> content = qandADaoImpl.contentgetMembers(bgnum);

		model.addAttribute("session_id", session_id);
		model.addAttribute("result", content);
		// model.addAttribute("pageNum", pageNum);
		model.addAttribute("CONTENT", "Q&A/content.jsp");
		model.addAttribute("LEFT", "Q&A/left.jsp");
		return "main";
	}

	// QA 게시글, 답글 수정
	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String QAupdate(HttpServletRequest request, Model model) {

		int bNum = Integer.parseInt(request.getParameter("bNum"));
		int bgnum = Integer.parseInt(request.getParameter("bgnum"));
		String id = request.getParameter("id");

		QandAVO userlist = qandADaoImpl.boardUpdate(id);

		model.addAttribute("bNum", bNum);
		model.addAttribute("bgnum", bgnum);
		model.addAttribute("result", userlist);
		model.addAttribute("CONTENT", "Q&A/updateForm.jsp");
		model.addAttribute("LEFT", "Q&A/left.jsp");
		return "main";
	}

	// QA 게시글, 답글 수정
	@RequestMapping(value = "/updateForm", method = RequestMethod.POST)
	public String QAupdate2(HttpServletRequest request, Model model) throws UnsupportedEncodingException {

		int bNum = Integer.parseInt(request.getParameter("bNum"));
		int bgnum = Integer.parseInt(request.getParameter("bgnum"));

		if (bNum == bgnum) {

			request.setCharacterEncoding("utf-8");
			QandAVO vo = new QandAVO();
			vo.setId(request.getParameter("id"));
			vo.setCategory(request.getParameter("category"));
			vo.setContents(request.getParameter("contents"));
			vo.setImg(request.getParameter("img"));
			vo.setTitle(request.getParameter("title"));

			qandADaoImpl.boardUpdatePro(vo);

		}
		if (bNum != bgnum) {

			request.setCharacterEncoding("utf-8");
			QandAVO vo = new QandAVO();
			vo.setId(request.getParameter("id"));
			vo.setContents(request.getParameter("contents"));

			qandADaoImpl.reboardUpdatePro(vo);

		}
		model.addAttribute("bNum", bNum);
		model.addAttribute("bgnum", bgnum);
		model.addAttribute("LEFT", "Q&A/left.jsp");
		model.addAttribute("CONTENT", "Q&A/updatePro.jsp");
		return "main";
	}

	// QA 게시글 삭제
	@RequestMapping(value = "/deleteForm", method = RequestMethod.GET)
	public String delete(HttpServletRequest request, Model model) {

		int bNum = Integer.parseInt(request.getParameter("bNum"));
		int bgnum = Integer.parseInt(request.getParameter("bgnum"));
		String id = request.getParameter("id");

		qandADaoImpl.qadelete(id, bNum);

		model.addAttribute("bNum", bNum);
		model.addAttribute("bgnum", bgnum);
		model.addAttribute("LEFT", "Q&A/left.jsp");
		model.addAttribute("CONTENT", "Q&A/deleteForm.jsp");

		return "main";
	}
}