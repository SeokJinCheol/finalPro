package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.BoardVO;


public interface BoardDao {
	public void insertMember(BoardVO vo); // 게시판 insert
	public void reinsertMember(BoardVO vo); // 게시판 insert (댓글)
	public ArrayList<BoardVO> contentgetMembers(int bgnum); // 게시판 상세페이지
	public void readcountUpdate(int bNum); // 조회수 관련
	public void update(BoardVO vo); // 게시판 댓글 관련
	public int getListAllCount(); // 게시글 수 구하기
	public ArrayList<BoardVO> getSelectAll(BoardVO board); // 게시판 리스트뽑기페이징처리
	public int getMaxNum(); // Max bNum 구하기
	public BoardVO boardUpdate(int bnum); // 게시판 수정하기 (이전글 부르기)
	public void boardUpdatePro(BoardVO vo); // 게시판 수정하기 (수정 삽입)
	public void reboardUpdatePro(BoardVO vo); // 게시판 답글 수정하기 (수정 삽입)
	public void delete(String id, int bNum); // 삭제하기
	public int getListTitleCount(String title); // Title 검색관련
	public ArrayList<BoardVO> selectTitle(String title, int startRow, int endRow); // =
	public int getListIDCount(String id); // ID 검색 관련
	public ArrayList<BoardVO> selectId(String id, int startRow, int endRow);
}