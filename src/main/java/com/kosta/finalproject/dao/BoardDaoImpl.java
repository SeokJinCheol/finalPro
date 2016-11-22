package com.kosta.finalproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.kosta.finalproject.vo.BoardVO;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSession sqlSession;
	
	public void insertMember(BoardVO vo) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardMapper.insertMember(vo);

	}

	// 댓글 등록
	public void reinsertMember(BoardVO vo) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardMapper.reinsertMember(vo);
	}

	// 상세페이지
	public ArrayList<BoardVO> contentgetMembers(int bgnum) {
		ArrayList<BoardVO> result = new ArrayList<BoardVO>();
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		result = BoardMapper.contentgetMembers(bgnum);

		return result;
	}

	// 조회수 관련
	public void readcountUpdate(int bNum) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardMapper.readcountUpdate(bNum);
	}

	// 댓글 관련
	public void update(BoardVO vo) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardMapper.update(vo);
	}

	// 게시글 수 확인
	public int getListAllCount() {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		int num = BoardMapper.getListAllCount();
		return num;
	}

	// 전체 게시글 가져오기
	public ArrayList<BoardVO> getSelectAll(BoardVO board) {
		ArrayList<BoardVO> result = new ArrayList<BoardVO>();
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		result = BoardMapper.getSelectAll(board);

		return result;
	}

	// MaxNum 구하기
	public int getMaxNum() {
		Integer num = sqlSession.selectOne("com.kosta.finalproject.dao.BoardMapper.getMaxNum");
		if (num == null) {
			num = 0;
		}
		System.out.println(num);
		return num;
	}

	// 수정하기 (이전 정보 받아오기)
	public BoardVO boardUpdate(int bnum) {
		BoardVO result = new BoardVO();
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		result = BoardMapper.boardUpdate(bnum);

		return result;
	}

	// 게시글 수정하기
	public void boardUpdatePro(BoardVO vo) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardMapper.boardUpdatePro(vo);
	}

	// 댓글 수정하기
	public void reboardUpdatePro(BoardVO vo) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardMapper.reboardUpdatePro(vo);
	}

	// 삭제하기
	public void delete(String id, int bNum) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO vo = new BoardVO();
		vo.setId(id);
		vo.setbNum(bNum);
		BoardMapper.delete(vo);
	}

	// Title 검색
	public int getListTitleCount(String title) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		int num = BoardMapper.getListTitleCount(vo);
		return num;
	}

	// Title 검색
	public ArrayList<BoardVO> selectTitle(String title, int startRow, int endRow) {

		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setStartRow(startRow);
		vo.setEndRow(endRow);
		list = BoardMapper.selectTitle(vo);
		return list;
	}

	// ID 검색
	public int getListIDCount(String id) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO vo = new BoardVO();
		vo.setId(id);
		int num = BoardMapper.getListIDCount(vo);
		return num;
	}

	// ID 검색
	public ArrayList<BoardVO> selectId(String id, int startRow, int endRow) {

		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO vo = new BoardVO();
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		vo.setId(id);
		vo.setStartRow(startRow);
		vo.setEndRow(endRow);
		list = BoardMapper.selectId(vo);
		return list;
	}
	///////////////
   
}