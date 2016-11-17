package com.kosta.finalproject.controller.top;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosta.finalproject.dao.BoardDaoImpl;
import com.kosta.finalproject.vo.BoardVO;

@Controller
@SessionAttributes({ "id" })
public class BoardController {
   @Autowired
   private BoardDaoImpl boardDaoImpl;

   // 자유게시판
   @RequestMapping("/freeboard_list")
   public String menu3(Model model, HttpServletRequest request) {
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
      List<BoardVO> list = null;
      if (keyword == null) {
         count = boardDaoImpl.getListAllCount();
      } else if (keyword.equalsIgnoreCase("title") && word != null) {
         count = boardDaoImpl.getListTitleCount(word);
      } else if (keyword.equalsIgnoreCase("id") && word != null) {
         count = boardDaoImpl.getListIDCount(word);
      }

      int pageCount = Math.round(count / pageSize + (count % pageSize == 0 ? 0 : 1));
      if (count > 0) {
         if (keyword == null) {
            list = boardDaoImpl.showAll(startrow, endrow);
            model.addAttribute("list", list);
         }

         else if (keyword.equalsIgnoreCase("title") && word != null) {
            word = request.getParameter("word");

            list = boardDaoImpl.selectTitle(word, startrow, endrow);
            System.out.println("list.size():" + list.size());

            model.addAttribute("list", list);
            model.addAttribute("word", word);
            model.addAttribute("keyword", keyword);

         }

         else if (keyword.equalsIgnoreCase("id") && word != null) {
            word = request.getParameter("word");
            list = boardDaoImpl.selectId(word, startrow, endrow);
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
      model.addAttribute("CONTENT", "menu/menu4/freeboard_list.jsp");
      model.addAttribute("LEFT", "menu/menu4/left.jsp");

      return "main";
   }
}