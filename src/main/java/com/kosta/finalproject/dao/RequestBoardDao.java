package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.RequestBoardVO;

public interface RequestBoardDao {
	public ArrayList<RequestBoardVO> RequestBoardSelectAll();
	public void requestinsert(RequestBoardVO vo);
	public ArrayList<RequestBoardVO> RequestBoardUserSelectAll(String session_id);
	public ArrayList<RequestBoardVO> RequestBoardUpdateForm(int codeNum);
	public void requestBoardUpdate(RequestBoardVO vo);
	public void requestBoardDelete(RequestBoardVO vo);
	public ArrayList<RequestBoardVO> RegisterBoardWriteForm(int codeNum);
	public void packageStatusupdate(RequestBoardVO vo);
	public ArrayList<RequestBoardVO> requeststatus(String status);
	public ArrayList<RequestBoardVO> companyselect(String company);
	public void requestdelete(RequestBoardVO vo);
}
