package com.kosta.finalproject.controller.top;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
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
import com.kosta.finalproject.vo.BoardVO;
import com.kosta.finalproject.vo.QandAVO;
import com.kosta.finalproject.vo.UploadVO;

@Controller
public class QandAController {
	@Autowired
	private QandADaoImpl qandADaoImpl;

	 // 자유게시판
	   @RequestMapping("/QnA_list")
	   public String QnA_List(Model model, HttpServletRequest request) {
	      String keyword = request.getParameter("keyword");
	      String word = request.getParameter("word");
	      String id = request.getParameter("id");

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
	         count = qandADaoImpl.ListAllCount();  ///
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
	   @RequestMapping(value = "/QnA_update_get", method = RequestMethod.GET)
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
			model.addAttribute("CONTENT", "QnA/freeboard_update.jsp");
			model.addAttribute("LEFT", "QnA/left.jsp");

			return "main";
		}

		// 글 수정 Form_POST
		@RequestMapping(value = "/QnA_update", method = RequestMethod.POST)
		public String QnA_update2(Model model, HttpServletRequest request, UploadVO dto) {
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
					File file = new File("C:/finalproject/team4/src/main/webapp/resources/BoardImg/" + fileName);

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
							file = new File("C:/finalproject/team4/src/main/webapp/resources/BoardImg/" + newFileName);
						}
					}
					uploadfile.transferTo(file);
				} catch (IOException e) {
					e.printStackTrace();
				} // try - catch
			} // if

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

			return "redirect:freeboard_list";
		}

		// 글쓰기 Form
		@RequestMapping("/QnA_write")
		public String QnA_write(Model model, HttpServletRequest request) {
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
			model.addAttribute("CONTENT", "Q&A/QnA_write.jsp");
			model.addAttribute("LEFT", "Q&A/left.jsp");

			return "main";
		}

		// 글쓰기 기능 수행
		@RequestMapping("/QnA_write2")
		public String QnA_write2(Model model, HttpServletRequest request, UploadVO dto) {
			String fileName = null;

			// 이미지 처리
			System.out.println("이미지 처리 시작");
			
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
							System.out.println("순서 = " + indexes);
							String extension = fileName.substring(indexes);
							System.out.println("확장자 = " + extension);
							String newFileName = fileName.substring(0, indexes) + "_" + extension;
							System.out.println("새 파일 이름 = " + newFileName);
							fileName = newFileName;
							file = new File("C:/finalproject/team4/src/main/webapp/resources/BoardImg/" + newFileName);
						}
					}
					uploadfile.transferTo(file);
				} catch (IOException e) {
					e.printStackTrace();
				} // try - catch
			} // if
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

			qandADaoImpl.writeMain(vo);

			model.addAttribute("LEFT", "menu/menu4/left.jsp");

			return "redirect:QnA_list";
		}

		// 상세보기
		@RequestMapping("/QnA_content")
		public String QnA_content(Model model, HttpServletRequest request) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String session_id = auth.getName();

			int bnum = Integer.parseInt(request.getParameter("bnum"));

			qandADaoImpl.updateCount(bnum);
			QandAVO vo = qandADaoImpl.showthis(bnum);
			ArrayList<QandAVO> list = qandADaoImpl.selectReply(bnum);

			model.addAttribute("session_id", session_id);
			model.addAttribute("list", list);
			model.addAttribute("vo", vo);
			model.addAttribute("CONTENT", "Q&A/QnA_content.jsp");
			model.addAttribute("LEFT", "Q&A/left.jsp");

			return "main";
		}

		// 글삭제
		@RequestMapping("/QnA_delete")
		public String QnA_delete(Model model, HttpServletRequest request) {
			String bnum = request.getParameter("bnum");
			qandADaoImpl.delete(Integer.parseInt(bnum));

			return "redirect:freeboard_list";
		}

		// 리플삭제
		@RequestMapping("/QnA_re_delete")
		public String QnA_re_delete(Model model, HttpServletRequest request) {
			String reply_bnum = request.getParameter("reply_bnum");

			qandADaoImpl.delete(Integer.parseInt(reply_bnum));

			QandAVO vo = qandADaoImpl.showthis(Integer.parseInt(request.getParameter("bnum")));
			ArrayList<QandAVO> list = qandADaoImpl.selectReply(Integer.parseInt(request.getParameter("bnum")));

			model.addAttribute("list", list);
			model.addAttribute("vo", vo);
			model.addAttribute("LEFT", "Q&A/left.jsp");
			model.addAttribute("CONTENT", "Q&A/QnA_content.jsp");

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