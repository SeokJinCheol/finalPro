package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.FreeBoardVO;

public interface FreeBoardDao {

	public void writeBoard(FreeBoardVO vo);    //  writeMain

	public ArrayList<FreeBoardVO> showBoard(int startrow, int endrow);   //  showAll

	public FreeBoardVO showBoardthis(int bnum);   //   showthis

	public void updateBoardCount(int bnum);   //  updateCount

	public ArrayList<FreeBoardVO> selectBoardReply(int bnum);   //  selectReply

	public ArrayList<FreeBoardVO> selectBoardTitle(String title, int startrow, int endrow);   //   selectTitle

	public int getListAllCount();   //  getListAllCount

	public int getListTitleCount(String title);    // getListTitleCount

	public ArrayList<FreeBoardVO> selectBoardId(String id, int startrow, int endrow);    //  selectId

	public int getListIDCount(String id);    //  getListIDCount

	public void deleteBoard(int bnum);   //  delete

	public void updateBoardDetail(FreeBoardVO vo);   //   updateDetail
}
