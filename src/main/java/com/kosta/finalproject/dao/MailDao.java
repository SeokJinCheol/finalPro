package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.MailVO;

public interface MailDao {
	public void sendmail(MailVO vo);
	public ArrayList<MailVO> mymaillist(String session_id);
}
