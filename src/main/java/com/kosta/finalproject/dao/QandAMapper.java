package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.QandAVO;


public interface QandAMapper {
	public void writeMain(QandAVO vo);

	ArrayList<QandAVO> showAll(QandAVO vo);

	public QandAVO showthis(int bnum);

	public void updateCount(int bnum);

	public ArrayList<QandAVO> selectReply(int bnum);

	public ArrayList<QandAVO> selectTitle(QandAVO vo);

	public int ListAllCount();

	public int getListTitleCount(QandAVO vo);

	public ArrayList<QandAVO> selectId(QandAVO vo);

	public int getListIDCount(QandAVO vo);

	public void delete(QandAVO vo);

	public void updateDetail(QandAVO vo);
	
	

}
