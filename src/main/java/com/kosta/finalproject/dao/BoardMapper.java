package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.BoardVO;


public interface BoardMapper {
	void insertMember(BoardVO vo); // 게시판 insert
	void reinsertMember(BoardVO vo); // 게시판 insert (댓글)
	BoardVO contentgetMembers(int bgnum); // 게시판 상세페이지
	ArrayList<BoardVO> recontentget(int bgnum); // 게시판 상세페이지 리플
	void readcountUpdate(int bNum); // 조회수 관련
	void update(BoardVO vo); // 게시판 댓글 관련
	int getListAllCount(); // 게시글 수 구하기
	ArrayList<BoardVO> getSelectAll(BoardVO board); // 게시판 리스트뽑기, 페이징처리
	int getMaxNum(); // Max bNum 구하기
	BoardVO boardUpdate(int bnum); // 게시판 수정하기 (이전글 부르기)
	void boardUpdatePro(BoardVO vo); // 게시판 수정하기 (수정 삽입)
	void reboardUpdatePro(BoardVO vo); // 게시판 답글 수정하기 (수정 삽입)
	void delete(BoardVO vo); // 삭제하기
	int getListTitleCount(BoardVO vo); // Title 검색관련
	ArrayList<BoardVO> selectTitle(BoardVO vo); // =
	int getListIDCount(BoardVO vo); // ID 검색 관련
	ArrayList<BoardVO> selectId(BoardVO vo); // =
}