package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.FreeBoardVO;

public interface FreeMapper {

	public void writeBoard(FreeBoardVO vo);    

    ArrayList<FreeBoardVO> showBoard(FreeBoardVO vo);   

	public FreeBoardVO showBoardthis(int bnum);  

	public void updateBoardCount(int bnum);  

	public ArrayList<FreeBoardVO> selectBoardReply(int bnum);  

	public ArrayList<FreeBoardVO> selectBoardTitle(FreeBoardVO vo);   

	public int getListAllCount();   

	public int getListTitleCount(FreeBoardVO vo);   

	public ArrayList<FreeBoardVO> selectBoardId(FreeBoardVO vo);   

	public int getListIDCount(FreeBoardVO vo);    

	public void deleteBoard(FreeBoardVO vo);  

	public void updateBoardDetail(FreeBoardVO vo); 
}
