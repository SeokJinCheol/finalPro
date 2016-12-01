package com.kosta.finalproject.controller.top;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import com.kosta.finalproject.dao.QandADaoImpl;
import com.kosta.finalproject.vo.QandAVO;
import com.kosta.finalproject.vo.UploadVO;

@Controller
public class QandAController {
	@Autowired
	private QandADaoImpl qandADaoImpl;

	private View jsonview;

	// 자유게시판
	@RequestMapping("/QnA_list")
	public String QnA_List(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		model.addAttribute("session_id", session_id);

		String keyword = request.getParameter("keyword");
		String word = request.getParameter("word");
		String id = request.getParameter("id");
		String bnum = request.getParameter("bnum");

		int pageSize = 10;

		String pageNum = request.getParameter("pageNum");

		if (pageNum == null)
			pageNum = "1";

		int currentPage = Integer.parseInt(pageNum);

		int startrow = (currentPage * pageSize) - (pageSize - 1);
		int endrow = currentPage * pageSize;
		int count = 0, number = 0;
		List<QandAVO> list = null;
		if (keyword == null) {
			count = qandADaoImpl.ListAllCount(); ///
		} else if (keyword.equalsIgnoreCase("title") && word != null) {
			count = qandADaoImpl.getListTitleCount(word);
		} else if (keyword.equalsIgnoreCase("id") && word != null) {
			count = qandADaoImpl.getListIDCount(word);
		}

		int pageCount = Math.round(count / pageSize + (count % pageSize == 0 ? 0 : 1));
		if (count > 0) {
			if (keyword == null) {
				list = qandADaoImpl.showAll(startrow, endrow);
				model.addAttribute("list", list);
			}

			else if (keyword.equalsIgnoreCase("title") && word != null) {
				word = request.getParameter("word");

				list = qandADaoImpl.selectTitle(word, startrow, endrow);
				System.out.println("list.size():" + list.size());

				model.addAttribute("list", list);
				model.addAttribute("word", word);
				model.addAttribute("keyword", keyword);

			}

			else if (keyword.equalsIgnoreCase("id") && word != null) {
				word = request.getParameter("word");
				list = qandADaoImpl.selectId(word, startrow, endrow);
				System.out.println("여기는 id검색결과 보여주고");

				model.addAttribute("list", list);
				model.addAttribute("word", word);
				model.addAttribute("keyword", keyword);
			}
		} else {
			list = Collections.EMPTY_LIST;
			System.out.println("여기는 리스트가 비어있으면 와");
		}

		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("count", new Integer(count));
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("CONTENT", "Q&A/QnA_list.jsp");
		model.addAttribute("LEFT", "Q&A/left.jsp");

		return "main";
	}

	@RequestMapping(value = "/QnA_update_get")
	public String QnA_update(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		String bnum = request.getParameter("bnum");

		QandAVO vo = qandADaoImpl.showthis(Integer.parseInt(bnum));
		model.addAttribute("category", vo.getCategory());
		model.addAttribute("bnum", vo.getBnum());
		model.addAttribute("title", vo.getTitle());
		model.addAttribute("id", session_id);
		model.addAttribute("contents", vo.getContents());
		model.addAttribute("img", vo.getImg());

		model.addAttribute("session_id", session_id);
		model.addAttribute("CONTENT", "Q&A/QnA_update.jsp");
		model.addAttribute("LEFT", "Q&A/left.jsp");

		return "main";
	}

	// 글 수정 Form_POST
	@RequestMapping(value = "/QnA_update")
	public String QnA_update2(Model model, HttpServletRequest request, UploadVO dto) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		String oldimg = request.getParameter("img");
		//파일이 null 이 아니면 실행.
	      String fileName = null;
	      
	      System.out.println("이미지 처리 시작");
	      MultipartFile uploadfile = dto.getFile();
	      if (uploadfile != null) {
	          fileName = uploadfile.getOriginalFilename();
	          if(!fileName.equals("")){
	             dto.setOname(fileName);
	             try {
	                 File file = new File("C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/QandAImg/" + fileName);
	                    while(file.exists()) {
	                       int indexes = fileName.lastIndexOf(".");
	                       System.out.println("순서 = "+indexes);
	                       String extension = fileName.substring(indexes);
	                       System.out.println("확장자 = "+extension);
	                       String newFileName = fileName.substring(0, indexes)+"_"+extension;
	                       System.out.println("새 파일 이름 = "+newFileName);
	                       fileName = newFileName;
	                       file = new File("C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/QandAImg/" + newFileName);
	                    }
	                 uploadfile.transferTo(file);
	             } catch (IOException e) {
	                 e.printStackTrace();
	             } // try - catch
	          } else fileName = "no_img.jpg";
	      }

		QandAVO vo = new QandAVO();
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

		qandADaoImpl.updateDetail(vo);

		return "redirect:QnA_list";
	}

	// 글쓰기 Form
	@RequestMapping("/QnA_write")
	public String QnA_write(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		String bnum = request.getParameter("bnum");

		System.out.println("타요~~");

		/*
		 * if (bnum != null) { model.addAttribute("title", "[답변] ");
		 * model.addAttribute("bnum", bnum);
		 * 
		 * model.addAttribute("session_id", session_id); }
		 */
		model.addAttribute("session_id", session_id);
		model.addAttribute("CONTENT", "Q&A/QnA_write.jsp");
		model.addAttribute("LEFT", "Q&A/left.jsp");

		return "main";
	}

	// 글쓰기 기능 수행
	@RequestMapping("/QnA_write2")
	public String QnA_write2(Model model, HttpServletRequest request, UploadVO dto) {
		//파일이 null 이 아니면 실행.
	      String fileName = null;
	      
	      System.out.println("이미지 처리 시작");
	      MultipartFile uploadfile = dto.getFile();
	      if (uploadfile != null) {
	          fileName = uploadfile.getOriginalFilename();
	          if(!fileName.equals("")){
	             dto.setOname(fileName);
	             try {
	                 File file = new File("C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/QandAImg/" + fileName);
	                    while(file.exists()) {
	                       int indexes = fileName.lastIndexOf(".");
	                       System.out.println("순서 = "+indexes);
	                       String extension = fileName.substring(indexes);
	                       System.out.println("확장자 = "+extension);
	                       String newFileName = fileName.substring(0, indexes)+"_"+extension;
	                       System.out.println("새 파일 이름 = "+newFileName);
	                       fileName = newFileName;
	                       file = new File("C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/QandAImg/" + newFileName);
	                    }
	                 uploadfile.transferTo(file);
	             } catch (IOException e) {
	                 e.printStackTrace();
	             } // try - catch
	          } else fileName = "no_img.jpg";
	      }
			// 데이터 베이스 처리를 현재 위치에서 처리
		System.out.println("데이터 베이스 처리 시작");

		QandAVO vo = new QandAVO();
		String bgnum = request.getParameter("bnum");
		String title = request.getParameter("title");
		String id = request.getParameter("id");
		String contents = request.getParameter("contents");
		String category = request.getParameter("category");
		String img = fileName;

		System.out.println(bgnum);

		/*
		 * if (bgnum.equals("")) {
		 * 
		 * }
		 * 
		 * else { vo.setBgnum(Integer.parseInt(bgnum)); }
		 */

		vo.setImg(img);
		vo.setTitle(title);
		vo.setId(id);
		vo.setContents(contents);
		vo.setCategory(category);

		qandADaoImpl.writeMain(vo);

		return "redirect:QnA_list";
	}

	// 리플달기
	@RequestMapping(value = "/QnA_reply", method = RequestMethod.POST)
	public View QnA_replywrite(Model model, HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		QandAVO vo = new QandAVO();

		String contents = request.getParameter("contents");
		String title = "[답변]" + request.getParameter("title");
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		int bgnum = bnum;

		String img = "reply";
		String category = "답변";
		vo.setBgnum(bgnum);
		vo.setCategory(category);
		vo.setContents(contents);
		vo.setTitle(title);
		vo.setId(session_id);
		vo.setImg(img);
		qandADaoImpl.writeMain(vo);
		model.addAttribute("vo", vo);
		System.out.println("bnum1=" + bnum);
		return jsonview;

	}

	// 상세보기
	@RequestMapping("/QnA_content")
	public String QnA_content(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();

		int bnum = Integer.parseInt(request.getParameter("bnum"));

		qandADaoImpl.updateCount(bnum);
		QandAVO vo = qandADaoImpl.showthis(bnum);
		// ArrayList<QandAVO> list = qandADaoImpl.selectReply(bnum);

		model.addAttribute("session_id", session_id);
		// model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("CONTENT", "Q&A/QnA_content.jsp");
		model.addAttribute("LEFT", "Q&A/left.jsp");

		return "main";
	}

	// 리플 리스트(AJax)
	@RequestMapping(value = "/QnA_replylist/{bnum}", method = RequestMethod.GET)
	public ResponseEntity<ArrayList<QandAVO>> QnA_replylist(@PathVariable("bnum") Integer bnum) {
		/*
		 * int pageSize = 10;
		 * 
		 * if (pageNum == null) pageNum = "1";
		 * 
		 * int currentPage = Integer.parseInt(pageNum);
		 * 
		 * int startrow = (currentPage * pageSize) - (pageSize - 1); int endrow
		 * = currentPage * pageSize; int count = 0, number = 0; count =
		 * qandADaoImpl.replyCount(bnum); int pageCount = Math.round(count /
		 * pageSize + (count % pageSize == 0 ? 0 : 1));
		 */
		ResponseEntity<ArrayList<QandAVO>> entity = null;
		// if (count > 0) {
		try {
			// entity = new
			// ResponseEntity<>(qandADaoImpl.selectReply(bnum,startrow,endrow),HttpStatus.OK);
			entity = new ResponseEntity<>(qandADaoImpl.selectReply(bnum), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		}
		// 나짜변환 - > 스트링
		//
		// }
		return entity;

	}

	// 글삭제
	@RequestMapping("/QnA_delete")
	public String QnA_delete(Model model, HttpServletRequest request) {
		String bnum = request.getParameter("bnum");
		qandADaoImpl.delete(Integer.parseInt(bnum));

		return "redirect:QnA_list";
	}

	// 리플삭제
	@RequestMapping("/QnA_re_delete")
	public View QnA_re_delete(Model model, HttpServletRequest request, HttpServletResponse response) {
		String reply_bnum = request.getParameter("reply_bnum");
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		qandADaoImpl.delete(Integer.parseInt(reply_bnum));

		return jsonview;
	}
}