package com.kosta.finalproject.controller.top;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.finalproject.dao.CheckBoardDaoImpl;
import com.kosta.finalproject.dao.RegisterBoardDaoImpl;
import com.kosta.finalproject.dao.RequestBoardDaoImpl;
import com.kosta.finalproject.dao.StorageBoardDaoImpl;
import com.kosta.finalproject.vo.CheckBoardVO;
import com.kosta.finalproject.vo.RegisterBoardVO;
import com.kosta.finalproject.vo.RequestBoardVO;
import com.kosta.finalproject.vo.StorageBoardVO;

@Controller
public class RegisterBoardController {

   @Autowired
   private RequestBoardDaoImpl requestBoardDaoImpl;

   @Autowired
   private RegisterBoardDaoImpl registerBoardDaoImpl;

   @Autowired
   private CheckBoardDaoImpl checkBoardDaoImpl;

   @Autowired
   private StorageBoardDaoImpl storageBoardDaoImpl;

   @RequestMapping("/menu2")
   public String menu2(Model model, HttpServletRequest request) {

      // �α��� ���� Ȯ��
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      String session_id = auth.getName();
      model.addAttribute("session_id", session_id);

    //�˻� Ȯ��
    String keyword = request.getParameter("keyword");
    String word = request.getParameter("word");
    String id = request.getParameter("id");
      
   // ��ü ��ϱ�
   		List<RegisterBoardVO> Registerselect = null;
   		
   		if (keyword == null) {
   			Registerselect = registerBoardDaoImpl.Registerselect();

   		}else if(keyword.equalsIgnoreCase("title") && word != null){
   			Registerselect = registerBoardDaoImpl.selectTitle(word);
   			model.addAttribute("word", word);
   			model.addAttribute("keyword", keyword);
   			
   		}else if(keyword.equalsIgnoreCase("category") && word != null){
   			Registerselect = registerBoardDaoImpl.selectCategory(word);
   			model.addAttribute("word", word);
   			model.addAttribute("keyword", keyword);
   			
   		} else {
   			Registerselect = Collections.EMPTY_LIST;
   		}

   		model.addAttribute("LEFT", "menu/menu2/left.jsp");
   		model.addAttribute("CONTENT", "menu/menu2/menu2.jsp");
   		model.addAttribute("Registerselect", Registerselect);

   		return "main";
  }

   // �뿩���� �� admin�� ����
   @RequestMapping("/RegisterBoardwrite")
   public String RegisterBoardwrite(Model model, HttpServletRequest request) {

      // id �޾ƿ���
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      String session_id = auth.getName();
      model.addAttribute("session_id", session_id);

      int codeNum = Integer.parseInt(request.getParameter("codeNum"));
      List<RequestBoardVO> RegisterBoardform = requestBoardDaoImpl.RegisterBoardWriteForm(codeNum);

      model.addAttribute("RegisterBoardform", RegisterBoardform);
      model.addAttribute("CONTENT", "menu/menu2/write/writeform.jsp");
      model.addAttribute("LEFT", "menu/menu2/left.jsp");
      return "main";
   }

   // �뿩���� ���� admin�� ����
   @RequestMapping("/RegisterBoardWrite")
   public String RegisterBoardWrite(Model model, HttpServletRequest request) throws Exception {

      // ��¥ ��ȯ
      SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");
      Date parsedDate1 = simpledate.parse(request.getParameter("startDate"));
      Date parsedDate2 = simpledate.parse(request.getParameter("endDate"));
      Timestamp startDate = new Timestamp(parsedDate1.getTime());
      Timestamp endDate = new Timestamp(parsedDate2.getTime());

      // �뿩���� �Խ��� �߰�
      RegisterBoardVO vo = new RegisterBoardVO();
      vo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
      vo.setTitle(request.getParameter("title"));
      vo.setCategory(request.getParameter("category"));
      vo.setCompany(request.getParameter("company"));
      vo.setStartDate(simpledate.format(startDate));
      vo.setEndDate(simpledate.format(endDate));
      vo.setBill(Integer.parseInt(request.getParameter("bill")));
      vo.setDeposit(Integer.parseInt(request.getParameter("deposit")));
      vo.setContents(request.getParameter("contents"));
      vo.setReaquestId(request.getParameter("reaquestId"));
      vo.setImg(request.getParameter("img"));
      registerBoardDaoImpl.Registerinsert(vo);

      // ��ϰԽ��� ���¹ٲٱ�
      RequestBoardVO requestBoardVO = new RequestBoardVO();

      String Status = "�뿩��";
      requestBoardVO.setPackageStatus(Status);
      requestBoardVO.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
      requestBoardDaoImpl.packageStatusupdate(requestBoardVO);

      // üũ ����Ʈ �߰�
      CheckBoardVO Checkvo = new CheckBoardVO();
      Checkvo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
      Checkvo.setStartDate(simpledate.format(startDate));
      Checkvo.setEndDate(simpledate.format(endDate));
      Checkvo.setBill(Integer.parseInt(request.getParameter("bill")));
      Checkvo.setDeposit(Integer.parseInt(request.getParameter("deposit")));
      Checkvo.setResister(request.getParameter("reaquestId"));
      checkBoardDaoImpl.CheckBoardInsert(Checkvo);

      // �α��� ���� Ȯ��
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      String session_id = auth.getName();
      model.addAttribute("session_id", session_id);

      // �ɻ簡�� page �̵�
      String status = "�ɻ���";
      List<RequestBoardVO> requestboardstatus = requestBoardDaoImpl.requeststatus(status);
      model.addAttribute("requestboardstatus", requestboardstatus);
      model.addAttribute("CONTENT", "menu/menu1/left_menu/requeststatus.jsp");
      model.addAttribute("LEFT", "menu/menu1/left.jsp");

      return "main";
   }

   // �뿩��û�ϱ�
   @RequestMapping("/RegisterUpForm")
   public String RegisterUpForm(Model model, HttpServletRequest request) {

      // ����ð� ��������
      long time = System.currentTimeMillis();
      SimpleDateFormat ctime = new SimpleDateFormat("yyyy-MM-dd");
      String CurrentTime = ctime.format(new Date(time));
      model.addAttribute("CurrentTime", CurrentTime);

      // �α��� ���� Ȯ��
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      String session_id = auth.getName();
      model.addAttribute("session_id", session_id);

      // �뿩���� �Խ��� ��� Form �Ѹ���
      String codeNum = request.getParameter("codeNum");

      List<RegisterBoardVO> registerform = registerBoardDaoImpl.RegisterUpForm(codeNum);
      model.addAttribute("registerform", registerform);

      model.addAttribute("LEFT", "menu/menu2/left.jsp");
      model.addAttribute("CONTENT", "menu/menu2/write/registerboardupForm.jsp");

      return "main";
   }

   // �뿩�� ��û
   @RequestMapping("/registerboardup")
   public String registerboardup(Model model, HttpServletRequest request) throws Exception {

      // ��¥ ��ȯ
      SimpleDateFormat simpledate = new SimpleDateFormat("yyyy-MM-dd");
      Date parsedDate1 = simpledate.parse(request.getParameter("userstartDate"));
      Date parsedDate2 = simpledate.parse(request.getParameter("userendDate"));
      Timestamp userstartDate = new Timestamp(parsedDate1.getTime());
      Timestamp userendDate = new Timestamp(parsedDate2.getTime());

      // �α��� ���� Ȯ��
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      String session_id = auth.getName();
      model.addAttribute("session_id", session_id);

      // �뿩�� �߰�
      String packageStatus = "�뿩��û";
      CheckBoardVO checkvo = new CheckBoardVO();
      checkvo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
      checkvo.setUserstartDate(simpledate.format(userstartDate));
      checkvo.setUserendDate(simpledate.format(userendDate));
      checkvo.setPackageStatus(packageStatus);
      checkvo.setRentter(session_id);
      checkBoardDaoImpl.Checkrentterup(checkvo);

      // ���¹ٲٱ�
      RegisterBoardVO registervo = new RegisterBoardVO();
      registervo.setPackageStatus(packageStatus);
      registervo.setRegisterId(session_id);
      registervo.setUserstartDate(simpledate.format(userstartDate));
      registervo.setUserendDate(simpledate.format(userendDate));
      registervo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
      registerBoardDaoImpl.PackageStatusUP(registervo);

      // �뿩���
      List<RegisterBoardVO> Registerselect = registerBoardDaoImpl.Registerselect();
      model.addAttribute("Registerselect", Registerselect);

      model.addAttribute("CONTENT", "menu/menu2/menu2.jsp");
      model.addAttribute("LEFT", "menu/menu2/left.jsp");
      return "main";
   }

   // �뿩 �����ϱ� admin�� ����
   @RequestMapping("/startrent")
   public String startrent(Model model, HttpServletRequest request) throws Exception {

      // id �޾ƿ���
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      String session_id = auth.getName();
      model.addAttribute("session_id", session_id);

      String packageStatus = "�뿩��";

      // �뿩�Խ��� ��Ȳ ����
      RegisterBoardVO registervo = new RegisterBoardVO();
      registervo.setPackageStatus(packageStatus);
      registervo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
      registerBoardDaoImpl.packageStatus(registervo);

      // üũ ����Ʈ ��Ȳ ����
      CheckBoardVO checkvo = new CheckBoardVO();
      checkvo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
      checkvo.setPackageStatus(packageStatus);
      checkBoardDaoImpl.packageStatus(checkvo);

      // StorageBoard �߰�
      StorageBoardVO storagevo = new StorageBoardVO();

      // ����ð� ��������
      long time = System.currentTimeMillis();
      SimpleDateFormat ctime = new SimpleDateFormat("yyyy-MM-dd");
      String CurrentTime = ctime.format(new Date(time));

      storagevo.setsNum(Integer.parseInt(request.getParameter("sNum")));
      storagevo.setCodeNum(Integer.parseInt(request.getParameter("codeNum")));
      storagevo.setRentter(request.getParameter("rentter"));
      storagevo.setBill(Integer.parseInt(request.getParameter("bill")));
      storagevo.setDeposit(Integer.parseInt(request.getParameter("deposit")));
      storagevo.setPackageStatus(packageStatus);
      storagevo.setStartDate(CurrentTime);

      storageBoardDaoImpl.storageinsert(storagevo);

      // �뿩���
      List<RegisterBoardVO> Registerselect = registerBoardDaoImpl.Registerselect();
      model.addAttribute("Registerselect", Registerselect);

      model.addAttribute("CONTENT", "menu/menu2/menu2.jsp");
      model.addAttribute("LEFT", "menu/menu2/left.jsp");
      return "main";
   }

   // �뿩���� ��
   @RequestMapping("/startrentForm")
   public String startrentForm(Model model, HttpServletRequest request) {

      // id �޾ƿ���
      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      String session_id = auth.getName();
      model.addAttribute("session_id", session_id);

      // �뿩 ��� ī��Ʈ
      int codeNum = Integer.parseInt(request.getParameter("codeNum"));
      List<StorageBoardVO> storagecount = storageBoardDaoImpl.codeNumCount(codeNum);
      model.addAttribute("storagecount", storagecount);

      List<CheckBoardVO> rentstartlist = checkBoardDaoImpl.codeNumselect(codeNum);

      model.addAttribute("rentstartlist", rentstartlist);
      model.addAttribute("CONTENT", "menu/menu2/write/startrentForm.jsp");
      model.addAttribute("LEFT", "menu/menu2/left.jsp");

      return "main";
   }
}