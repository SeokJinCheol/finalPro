package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.QandAVO;

public interface QandADao {
	public void writeMain(QandAVO vo);

	public ArrayList<QandAVO> showAll(int startrow, int endrow);

	public QandAVO showthis(int bnum);

	public void updateCount(int bnum);

	public ArrayList<QandAVO> selectReply(int bnum);

	public ArrayList<QandAVO> selectTitle(String title, int startrow, int endrow);

	public int ListAllCount();

	public int getListTitleCount(String title);

	public ArrayList<QandAVO> selectId(String id, int startrow, int endrow);

	public int getListIDCount(String id);

	public void delete(int bnum);

	public void updateDetail(QandAVO vo);
}