package com.kosta.finalproject.controller.top;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.finalproject.dao.MailImpl;
import com.kosta.finalproject.vo.MailVO;

@Controller
public class MailController {

	@Autowired
	MailImpl mailImpl;

	@RequestMapping("mail")
	public String mail(Model model, HttpServletRequest request) {

		// 로그인 정보 확인
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String session_id = auth.getName();
		model.addAttribute("session_id", session_id);

		String rid = request.getParameter("rid");
		model.addAttribute("rid", rid);
		model.addAttribute("sid", session_id);

		return "mail/mail";
	}

	@RequestMapping("sendmail")
	public String sendmail(Model model, HttpServletRequest request) {
		// 현재시간 가져오기
		long time = System.currentTimeMillis();
		SimpleDateFormat ctime = new SimpleDateFormat("yyyy-MM-dd");
		String CurrentTime = ctime.format(new Date(time));

		MailVO mailvo = new MailVO();
		mailvo.setRid(request.getParameter("rid"));
		mailvo.setSid(request.getParameter("sid"));
		mailvo.setText(request.getParameter("text"));
		mailvo.setSenddate(CurrentTime);

		mailImpl.sendmail(mailvo);

		return "mail/sendmailOK";
	}

}
