package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.QandAVO;

public interface QandADao {
	public void qainsertMember(QandAVO vo); // 게시판 insert

	public void reqainsertMember(QandAVO vo); // 게시판 insert (댓글)

	public ArrayList<QandAVO> contentgetMembers(int bgnum); // 게시판 상세페이지

	public void readcountUpdate(int bNum); // 조회수 관련

	public void qaupdate(QandAVO vo); // 게시판 댓글 관련

	public int getListAllCount(); // 게시글 수 구하기

	public ArrayList<QandAVO> getSelectAll(QandAVO qaboard); // 게시판 리스트뽑기,
																// 페이징처리

	public int getMaxNum(); // Max bNum 구하기

	public QandAVO boardUpdate(String id); // 게시판 수정하기 (이전글 부르기)

	public void boardUpdatePro(QandAVO vo); // 게시판 수정하기 (수정 삽입)

	public void reboardUpdatePro(QandAVO vo); // 게시판 답글 수정하기 (수정 삽입)

	public void qadelete(String id, int bNum); // 삭제하기

	public int getListTitleCount(String title); // Title 검색관련

	public ArrayList<QandAVO> selectTitle(String title, int startRow, int endRow); // =

	public int getListIDCount(String id); // ID 검색 관련

	public ArrayList<QandAVO> selectId(String id, int startRow, int endRow); // =
}