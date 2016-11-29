package com.kosta.finalproject.controller.top;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.kosta.finalproject.dao.RRBoardDao;

@Controller
public class ScedulerController {

	@Autowired
	private RRBoardDao dao;
	
	@Scheduled(cron="0 0 12 * * *")
	public void seq_task() {
		
		dao.setRPBtask();
		dao.setRRtask();
		
}
	
}
