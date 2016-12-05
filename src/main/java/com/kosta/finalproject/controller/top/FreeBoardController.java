package com.kosta.finalproject.controller.top;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import com.kosta.finalproject.dao.FreeDaoImpl;
import com.kosta.finalproject.vo.FreeBoardVO;
import com.kosta.finalproject.vo.UploadVO;

@Controller
@SessionAttributes({ "id" })
public class FreeBoardController {

	@Autowired
	private FreeDaoImpl freeDaoImpl;

	private View jsonview;

	// 자유게시판
	@RequestMapping("/free4_list")
	public String FreeList(Model model, HttpServletRequest request) {
		String keyword = request.getParameter("keyword");
		String word = request.getParameter("word");
		String id = request.getParameter("id");

		int pageSize = 10;

		String pageNum = request.getParameter("pageNum");

		if (pageNum == null)
			pageNum = "1";

		int currentPage = Integer.parseInt(pageNum);

		int count = 0, number = 0;
		List<FreeBoardVO> list = null;
		if (keyword == null) {
			count = freeDaoImpl.getListAllCount();
		} else if (keyword.equalsIgnoreCase("title") && word != null) {
			count = freeDaoImpl.getListTitleCount(word);
		} else if (keyword.equalsIgnoreCase("id") && word != null) {
			count = freeDaoImpl.getListIDCount(word);
		}
		
		int endrow = count - ((currentPage-1)*pageSize);
		int startrow = endrow - pageSize + 1;

		int pageCount = Math.round(count / pageSize + (count % pageSize == 0 ? 0 : 1));
		if (count > 0) {
			if (keyword == null) {
				list = freeDaoImpl.showBoard(startrow, endrow);
				model.addAttribute("list", list);
			}

			else if (keyword.equalsIgnoreCase("title") && word != null) {
				word = request.getParameter("word");

				list = freeDaoImpl.selectBoardTitle(word, startrow, endrow);
				System.out.println("list.size():" + list.size());

				model.addAttribute("list", list);
				model.addAttribute("word", word);
				model.addAttribute("keyword", keyword);

			}

			else if (keyword.equalsIgnoreCase("id") && word != null) {
				word = request.getParameter("word");
				list = freeDaoImpl.selectBoardId(word, startrow, endrow);
				System.out.println("여기는 id검색결과 보여주고");

				model.addAttribute("list", list);
				model.addAttribute("word", word);
				model.addAttribute("keyword", keyword);
			}
		} 

		model.addAttribute("result", list);
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("count", new Integer(count));
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("pageSize", new Integer(pageSize));
		model.addAttribute("CONTENT", "menu/menu4/free4/free_list.jsp");
		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "main";
	}
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

		//파일이 null 이 아니면 실행.
	      String fileName = null;
	      
	      System.out.println("이미지 처리 시작");
	      MultipartFile uploadfile = dto.getFile();
	      if (uploadfile != null) {
	          fileName = uploadfile.getOriginalFilename();
	          if(!fileName.equals("")){
	             dto.setOname(fileName);
	             try {
	                 File file = new File("C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/FreeBoardImg/" + fileName);
	                    while(file.exists()) {
	                       int indexes = fileName.lastIndexOf(".");
	                       System.out.println("순서 = "+indexes);
	                       String extension = fileName.substring(indexes);
	                       System.out.println("확장자 = "+extension);
	                       String newFileName = fileName.substring(0, indexes)+"_"+extension;
	                       System.out.println("새 파일 이름 = "+newFileName);
	                       fileName = newFileName;
	                       file = new File("C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/FreeBoardImg/" + newFileName);
	                    }
	                 uploadfile.transferTo(file);
	             } catch (IOException e) {
	                 e.printStackTrace();
	             } // try - catch
	          } else fileName = "no_img.jpg";
	      }

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
		//파일이 null 이 아니면 실행.
	      String fileName = null;
	      
	      System.out.println("이미지 처리 시작");
	      MultipartFile uploadfile = dto.getFile();
	      if (uploadfile != null) {
	          fileName = uploadfile.getOriginalFilename();
	          if(!fileName.equals("")){
	             dto.setOname(fileName);
	             try {
	                 File file = new File("C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/FreeBoardImg/" + fileName);
	                    while(file.exists()) {
	                       int indexes = fileName.lastIndexOf(".");
	                       System.out.println("순서 = "+indexes);
	                       String extension = fileName.substring(indexes);
	                       System.out.println("확장자 = "+extension);
	                       String newFileName = fileName.substring(0, indexes)+"_"+extension;
	                       System.out.println("새 파일 이름 = "+newFileName);
	                       fileName = newFileName;
	                       file = new File("C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/FreeBoardImg/" + newFileName);
	                    }
	                 uploadfile.transferTo(file);
	             } catch (IOException e) {
	                 e.printStackTrace();
	             } // try - catch
	          } else fileName = "no_img.jpg";
	      }
			// 데이터 베이스 처리를 현재 위치에서 처리
		System.out.println("데이터 베이스 처리 시작");

		FreeBoardVO vo = new FreeBoardVO();
		String bgnum = request.getParameter("bnum");
		String title = request.getParameter("title");
		String id = request.getParameter("id");
		String contents = request.getParameter("contents");

		String img = fileName;
		vo.setImg(img);
		vo.setTitle(title);
		vo.setId(id);
		vo.setContents(contents);

		freeDaoImpl.writeBoard(vo);


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
		//ArrayList<FreeBoardVO> list = freeDaoImpl.selectBoardReply(bnum);

		model.addAttribute("session_id", session_id);
		//model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("CONTENT", "menu/menu4/free4/free_content.jsp");
		model.addAttribute("LEFT", "menu/menu4/left.jsp");

		return "main";
	}
	// 리플달기
		@RequestMapping(value = "/free_reply", method = RequestMethod.POST)
		public View free_replywrite(Model model, HttpServletRequest request, HttpServletResponse response) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String session_id = auth.getName();
			FreeBoardVO vo = new FreeBoardVO();

			String contents = request.getParameter("contents");
			String title = "[답변]" + request.getParameter("title");
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			int bgnum = bnum;

			String img = "reply";
			
			vo.setBgnum(bgnum);
			vo.setContents(contents);
			vo.setTitle(title);
			vo.setId(session_id);
			vo.setImg(img);
			freeDaoImpl.writeBoard(vo);
			model.addAttribute("vo", vo);
			System.out.println("bnum1=" + bnum);
			return jsonview;

		}
	//리플리스트
	@RequestMapping("/free_replylist/{bnum}")
	public ResponseEntity<ArrayList<FreeBoardVO>> free_replylist(@PathVariable("bnum") Integer bnum) {
		
		ResponseEntity<ArrayList<FreeBoardVO>> entity = null;
		
		try {
			
			entity = new ResponseEntity<>(freeDaoImpl.selectBoardReply(bnum), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		}
		// 날짜변환 - > 스트링
		//
		// }
		return entity;

	}
	// 글삭제
	@RequestMapping("/free_delete")
	public String free_delete(Model model, HttpServletRequest request) {
		String bnum = request.getParameter("bnum");
		freeDaoImpl.deleteBoard(Integer.parseInt(bnum));

		return "redirect:free4_list";
	}

	// 리플삭제
	@RequestMapping(value="/free_re_delete",method=RequestMethod.POST)
	public View free_re_delete(Model model, HttpServletRequest request, HttpServletResponse response) {
		String reply_bnum = request.getParameter("reply_bnum");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		freeDaoImpl.deleteBoard(Integer.parseInt(reply_bnum));

		return jsonview;
	}

	
}