package com.kosta.finalproject.controller.top;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
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

import com.kosta.finalproject.dao.BoardDaoImpl;
import com.kosta.finalproject.vo.BoardVO;
import com.kosta.finalproject.vo.UploadVO;

@Controller
@SessionAttributes({ "id" })
public class BoardController {
   @Autowired
   private BoardDaoImpl boardDaoImpl;

   private View jsonview;

   //////
   // 전체 글 리스트 출력 + 검색기능
   @RequestMapping("/free_list")
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
      List<BoardVO> list = null;
      if (keyword == null) {
         count = boardDaoImpl.getListAllCount();
      } else if (keyword.equalsIgnoreCase("title") && word != null) {
         count = boardDaoImpl.getListTitleCount(word);
      } else if (keyword.equalsIgnoreCase("id") && word != null) {
         count = boardDaoImpl.getListIDCount(word);
      }
      System.out.println("count : " + count);
      int pageCount = Math.round(count / pageSize + (count % pageSize == 0 ? 0 : 1));
      if (count > 0) {
         if (keyword == null) {
            BoardVO board = new BoardVO();
            board.setStartRow(startRow);
            board.setEndRow(endRow);
            list = boardDaoImpl.getSelectAll(board);

         } else if (keyword.equalsIgnoreCase("title") && word != null) {
            word = request.getParameter("word");

            list = boardDaoImpl.selectTitle(word, startRow, endRow);

            model.addAttribute("word", word);
            model.addAttribute("keyword", keyword);

         } else if (keyword.equalsIgnoreCase("id") && word != null) {
            word = request.getParameter("word");
            list = boardDaoImpl.selectId(word, startRow, endRow);

            model.addAttribute("word", word);
            model.addAttribute("keyword", keyword);

         }
      } 
      model.addAttribute("result", list);
      model.addAttribute("currentPage", new Integer(currentPage));
      model.addAttribute("count", new Integer(count));
      model.addAttribute("pageCount", pageCount);
      model.addAttribute("pageSize", new Integer(pageSize));
      model.addAttribute("CONTENT", "menu/menu4/free_list.jsp");
      model.addAttribute("LEFT", "menu/menu4/left.jsp");
      return "main";
   }

   // 게시글 작성 (폼 부르기)
   @RequestMapping(value = "/insertForm")
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

      model.addAttribute("LEFT", "menu/menu4/left.jsp");
      model.addAttribute("CONTENT", "menu/menu4/insertForm.jsp");

      return "main";
   }

   // 게시글 작성 (입력)
   @RequestMapping(value = "/insertForm2")
   public String insert2(HttpServletRequest request, Model model, UploadVO dto) throws Exception {
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      String session_id = auth.getName();

      String result = null;

      request.setCharacterEncoding("utf-8");

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

      BoardVO vo = new BoardVO();

      int groupnum = Integer.parseInt(request.getParameter("groupnum"));
      int ranknum = Integer.parseInt(request.getParameter("ranknum"));
      int bNum = Integer.parseInt(request.getParameter("bNum"));
      int bgnum = Integer.parseInt(request.getParameter("bgnum"));

      // 게시글인 경우

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

      number = boardDaoImpl.getMaxNum();

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

      boardDaoImpl.insertMember(vo);

      result = "redirect:free_list";

      model.addAttribute("session_id", session_id);
      model.addAttribute("groupnum", vo.getGroupnum());

      // model.addAttribute("CONTENT", "menu/menu4/insertPro.jsp");

      return result;
   }

   @RequestMapping(value = "/writeReply", method = RequestMethod.POST)
   public View writeReply(Model model, HttpServletRequest request, HttpServletResponse response) {
      BoardVO vo = new BoardVO();
      int groupnum = Integer.parseInt(request.getParameter("groupnum"));
      int ranknum = Integer.parseInt(request.getParameter("ranknum"));
      int bNum = Integer.parseInt(request.getParameter("bNum"));
      int bgnum = Integer.parseInt(request.getParameter("bgnum"));
      vo.setbNum(bNum);
      vo.setId(request.getParameter("id"));
      vo.setContents(request.getParameter("contents"));
      vo.setBgnum(bgnum);
      vo.setbDate(new Timestamp(System.currentTimeMillis()));
      int number = 0;

      String sid = request.getParameter("id");
      System.out.println(sid);

      number = boardDaoImpl.getMaxNum();

      boardDaoImpl.update(vo);
      groupnum += 1;
      ranknum += 1;
      vo.setGroupnum(groupnum);
      vo.setRanknum(ranknum);

      boardDaoImpl.reinsertMember(vo);

      model.addAttribute("bNum", vo.getbNum());
      model.addAttribute("bgnum", vo.getBgnum());
      return jsonview;
   }

   // 상세페이지
   @RequestMapping("/content")
   public String content(HttpServletRequest request, Model model) throws Exception {
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      String session_id = auth.getName();

      int bNum = Integer.parseInt(request.getParameter("bNum"));
      // String pageNum= request.getParameter("pageNum");
      int bgnum = Integer.parseInt(request.getParameter("bgnum"));

      boardDaoImpl.readcountUpdate(bNum);
      BoardVO content = boardDaoImpl.contentgetMembers(bgnum);
      

      model.addAttribute("session_id", session_id);
      model.addAttribute("result", content);
      // model.addAttribute("pageNum", pageNum);
      model.addAttribute("CONTENT", "menu/menu4/content.jsp");
      model.addAttribute("LEFT", "menu/menu4/left.jsp");
      return "main";
   }
   @RequestMapping(value = "/replylist/{bgnum}")
   public ResponseEntity<ArrayList<BoardVO>> QnA_replylist(@PathVariable("bgnum") Integer bgnum) {
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
      ResponseEntity<ArrayList<BoardVO>> entity = null;
      // if (count > 0) {
      try {
         // entity = new
         // ResponseEntity<>(qandADaoImpl.selectReply(bnum,startrow,endrow),HttpStatus.OK);
         entity = new ResponseEntity<>(boardDaoImpl.recontentget(bgnum), HttpStatus.OK);
      } catch (Exception e) {
         e.printStackTrace();
         entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);

      }
      // 나짜변환 - > 스트링
      //
      // }
      return entity;

   }
   // 댓글에 댓글
   /*@RequestMapping("/insert_reply")
   public String insert_reply(HttpServletRequest request, Model model) throws Exception {
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      String session_id = auth.getName();

      String contents = request.getParameter("contents");

      BoardVO vo = new BoardVO();

      int groupnum = Integer.parseInt(request.getParameter("groupnum"));
      int ranknum = Integer.parseInt(request.getParameter("ranknum"));
      int bNum = Integer.parseInt(request.getParameter("bNum"));
      int bgnum = Integer.parseInt(request.getParameter("bgnum"));

      boardDaoImpl.readcountUpdate(bNum);
      BoardVO content = boardDaoImpl.contentgetMembers(bgnum);

      model.addAttribute("contents", contents);
      model.addAttribute("session_id", session_id);
      model.addAttribute("result", content);
      // model.addAttribute("pageNum", pageNum);
      model.addAttribute("CONTENT", "menu/menu4/insert_reply.jsp");
      model.addAttribute("LEFT", "menu/menu4/left.jsp");

      return "main";
   }*/

   // 게시글, 답글 수정
   @RequestMapping(value = "/updateForm")
   public String update(HttpServletRequest request, Model model) {

      int bNum = Integer.parseInt(request.getParameter("bNum"));
      int bgnum = Integer.parseInt(request.getParameter("bgnum"));
      String id = request.getParameter("id");

      BoardVO userlist = boardDaoImpl.boardUpdate(bNum);

      model.addAttribute("bNum", bNum);
      model.addAttribute("bgnum", bgnum);
      model.addAttribute("result", userlist);
      model.addAttribute("CONTENT", "menu/menu4/updateForm.jsp");
      model.addAttribute("LEFT", "menu/menu4/left.jsp");
      return "main";
   }

   // 게시글, 답글 수정
   @RequestMapping(value = "/update")
   public String update2(HttpServletRequest request, Model model, UploadVO dto) throws UnsupportedEncodingException {
      String oldimg = request.getParameter("img");
      String result = null;
      
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

      int bNum = Integer.parseInt(request.getParameter("bNum"));
      int bgnum = Integer.parseInt(request.getParameter("bgnum"));

      if (bNum == bgnum) {
         request.setCharacterEncoding("utf-8");
         BoardVO vo = new BoardVO();
         vo.setbNum(bNum);
         vo.setCategory(request.getParameter("category"));
         vo.setContents(request.getParameter("contents"));
         vo.setImg(fileName);
         vo.setTitle(request.getParameter("title"));

         boardDaoImpl.boardUpdatePro(vo);

         result = "redirect:free_list";
      }

      // 답글 수정
      if (bNum != bgnum) {
         request.setCharacterEncoding("utf-8");
         BoardVO vo = new BoardVO();
         vo.setbNum(bNum);
         vo.setContents(request.getParameter("contents"));

         boardDaoImpl.reboardUpdatePro(vo);

         model.addAttribute("bNum", bNum);
         model.addAttribute("bgnum", bgnum);

         result = "redirect:content";
      }

      // model.addAttribute("LEFT", "menu/menu4/left.jsp");

      return result;
   }

   // 게시글 삭제
   @RequestMapping(value = "/delete")
   public String delete(HttpServletRequest request, Model model) {
      String result = null;
      int bNum = Integer.parseInt(request.getParameter("bNum"));
      int bgnum = Integer.parseInt(request.getParameter("bgnum"));
      String id = request.getParameter("id");
      if (bNum == bgnum) {
         boardDaoImpl.delete(id, bNum);
         result = "redirect:free_list";
      }
      return result;
   }
   @RequestMapping(value="/deleteReply",method=RequestMethod.POST)
   public View deleteReply(Model model, HttpServletRequest request, HttpServletResponse response){
      String id = request.getParameter("id");
      int bNum = Integer.parseInt(request.getParameter("bNum"));
      System.out.println("id="+id+",bNum="+bNum);
      boardDaoImpl.delete(id, bNum);
      return jsonview;
   }
}