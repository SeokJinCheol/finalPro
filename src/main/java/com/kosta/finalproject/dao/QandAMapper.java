package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.QandAVO;

public interface QandAMapper {
	void qainsertMember(QandAVO vo); // 게시판 insert

	void reqainsertMember(QandAVO vo); // 게시판 insert (댓글)

	ArrayList<QandAVO> contentgetMembers(int bgnum); // 게시판 상세페이지

	void readcountUpdate(int bNum); // 조회수 관련

	void qaupdate(QandAVO vo); // 게시판 댓글 관련

	int getListAllCount(); // 게시글 수 구하기

	ArrayList<QandAVO> getSelectAll(QandAVO qaboard); // 게시판 리스트뽑기, 페이징처리

	int getMaxNum(); // Max bNum 구하기

	QandAVO boardUpdate(String id); // 게시판 수정하기 (이전글 부르기)

	void boardUpdatePro(QandAVO vo); // 게시판 수정하기 (수정 삽입)

	void reboardUpdatePro(QandAVO vo); // 게시판 답글 수정하기 (수정 삽입)

	void qadelete(QandAVO vo); // 삭제하기

	int getListTitleCount(QandAVO vo); // Title 검색관련

	ArrayList<QandAVO> selectTitle(QandAVO vo); // =

	int getListIDCount(QandAVO vo); // ID 검색 관련

	ArrayList<QandAVO> selectId(QandAVO vo); // =

}
