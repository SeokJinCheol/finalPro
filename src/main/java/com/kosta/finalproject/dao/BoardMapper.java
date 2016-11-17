package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.BoardVO;

public interface BoardMapper {
	public void writeMain(BoardVO vo);

	ArrayList<BoardVO> showAll(BoardVO vo);

	public BoardVO showthis(int bnum);

	public void updateCount(int bnum);

	public ArrayList<BoardVO> selectReply(int bnum);

	public ArrayList<BoardVO> selectTitle(BoardVO vo);

	public int getListAllCount();

	public int getListTitleCount(BoardVO vo);
	
	public ArrayList<BoardVO> selectId(BoardVO vo);
	
	public int getListIDCount(BoardVO vo);
	
	public void delete(BoardVO vo);
	
	public void updateDetail(BoardVO vo);
}