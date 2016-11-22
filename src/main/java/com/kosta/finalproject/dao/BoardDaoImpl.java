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

	// ��� ���
	public void reinsertMember(BoardVO vo) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardMapper.reinsertMember(vo);
	}

	// ��������
	public ArrayList<BoardVO> contentgetMembers(int bgnum) {
		ArrayList<BoardVO> result = new ArrayList<BoardVO>();
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		result = BoardMapper.contentgetMembers(bgnum);

		return result;
	}

	// ��ȸ�� ����
	public void readcountUpdate(int bNum) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardMapper.readcountUpdate(bNum);
	}

	// ��� ����
	public void update(BoardVO vo) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardMapper.update(vo);
	}

	// �Խñ� �� Ȯ��
	public int getListAllCount() {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		int num = BoardMapper.getListAllCount();
		return num;
	}

	// ��ü �Խñ� ��������
	public ArrayList<BoardVO> getSelectAll(BoardVO board) {
		ArrayList<BoardVO> result = new ArrayList<BoardVO>();
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		result = BoardMapper.getSelectAll(board);

		return result;
	}

	// MaxNum ���ϱ�
	public int getMaxNum() {
		Integer num = sqlSession.selectOne("com.kosta.finalproject.dao.BoardMapper.getMaxNum");
		if (num == null) {
			num = 0;
		}
		System.out.println(num);
		return num;
	}

	// �����ϱ� (���� ���� �޾ƿ���)
	public BoardVO boardUpdate(int bnum) {
		BoardVO result = new BoardVO();
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		result = BoardMapper.boardUpdate(bnum);

		return result;
	}

	// �Խñ� �����ϱ�
	public void boardUpdatePro(BoardVO vo) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardMapper.boardUpdatePro(vo);
	}

	// ��� �����ϱ�
	public void reboardUpdatePro(BoardVO vo) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardMapper.reboardUpdatePro(vo);
	}

	// �����ϱ�
	public void delete(String id, int bNum) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO vo = new BoardVO();
		vo.setId(id);
		vo.setbNum(bNum);
		BoardMapper.delete(vo);
	}

	// Title �˻�
	public int getListTitleCount(String title) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		int num = BoardMapper.getListTitleCount(vo);
		return num;
	}

	// Title �˻�
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

	// ID �˻�
	public int getListIDCount(String id) {
		BoardMapper BoardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO vo = new BoardVO();
		vo.setId(id);
		int num = BoardMapper.getListIDCount(vo);
		return num;
	}

	// ID �˻�
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