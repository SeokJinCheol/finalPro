package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.BoardVO;

public interface BoardDao {
	public void writeMain(BoardVO vo);

	public ArrayList<BoardVO> showAll(int startrow, int endrow);

	public BoardVO showthis(int bnum);

	public void updateCount(int bnum);

	public ArrayList<BoardVO> selectReply(int bnum);

	public ArrayList<BoardVO> selectTitle(String title, int startrow, int endrow);

	public int getListAllCount();

	public int getListTitleCount(String title);

	public ArrayList<BoardVO> selectId(String id, int startrow, int endrow);

	public int getListIDCount(String id);

	public void delete(int bnum);

	public void updateDetail(BoardVO vo);
}