package com.kosta.finalproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.finalproject.vo.BoardVO;
import com.kosta.finalproject.vo.FreeBoardVO;

@Repository
public class FreeDaoImpl implements FreeBoardDao {
     @Autowired
	 private SqlSession sqlSession;
	
	@Override
	public void writeBoard(FreeBoardVO vo) {
		FreeMapper freeMapper = sqlSession.getMapper(FreeMapper.class);
		freeMapper.writeBoard(vo);
	}

	@Override
	public ArrayList<FreeBoardVO> showBoard(int startrow, int endrow) {
		ArrayList<FreeBoardVO> list = new ArrayList<FreeBoardVO>();
		FreeMapper freeMapper = sqlSession.getMapper(FreeMapper.class);
		FreeBoardVO vo = new FreeBoardVO();
	      vo.setStartRow(startrow);
	      vo.setEndRow(endrow);
	      list = freeMapper.showBoard(vo);

	      return list;
	}

	@Override
	public FreeBoardVO showBoardthis(int bnum) {
		FreeBoardVO vo = new FreeBoardVO();
		FreeMapper freeMapper = sqlSession.getMapper(FreeMapper.class);
	      vo = freeMapper.showBoardthis(bnum);
	      return vo;
		
	}

	@Override
	public void updateBoardCount(int bnum) {
		FreeMapper freeMapper = sqlSession.getMapper(FreeMapper.class);
		freeMapper.updateBoardCount(bnum);
	}

	@Override
	public ArrayList<FreeBoardVO> selectBoardReply(int bnum) {
		 ArrayList<FreeBoardVO> list = new ArrayList<FreeBoardVO>();
		 FreeMapper freeMapper = sqlSession.getMapper(FreeMapper.class);
	      list = freeMapper.selectBoardReply(bnum);
	      return list;
	}

	@Override
	public ArrayList<FreeBoardVO> selectBoardTitle(String title, int startrow, int endrow) {
		ArrayList<FreeBoardVO> list = new ArrayList<FreeBoardVO>();
		FreeMapper freeMapper = sqlSession.getMapper(FreeMapper.class);
		FreeBoardVO vo = new FreeBoardVO();
	      vo.setTitle(title);
	      vo.setStartRow(startrow);
	      vo.setEndRow(endrow);
	      list = freeMapper.selectBoardTitle(vo);
	      return list;
	}

	@Override
	public int getListAllCount() {
		FreeMapper freeMapper = sqlSession.getMapper(FreeMapper.class);
	      int num = freeMapper.getListAllCount();

	      return num;
	}

	@Override
	public int getListTitleCount(String title) {
		FreeMapper freeMapper = sqlSession.getMapper(FreeMapper.class);

		FreeBoardVO vo = new FreeBoardVO();
	      vo.setTitle(title);
	      int num = freeMapper.getListTitleCount(vo);
	      return num;
	}

	@Override
	public ArrayList<FreeBoardVO> selectBoardId(String id, int startrow, int endrow) {
		FreeMapper freeMapper = sqlSession.getMapper(FreeMapper.class);
		FreeBoardVO vo = new FreeBoardVO();
	      ArrayList<FreeBoardVO> list = new ArrayList<FreeBoardVO>();
	      vo.setId(id);
	      vo.setStartRow(startrow);
	      vo.setEndRow(endrow);
	      list = freeMapper.selectBoardId(vo);

	      return list;
	}

	@Override
	public int getListIDCount(String id) {
		FreeMapper freeMapper = sqlSession.getMapper(FreeMapper.class);
		FreeBoardVO vo = new FreeBoardVO();
	      vo.setId(id);
	      int num = freeMapper.getListIDCount(vo);

	      return num;
	}

	@Override
	public void deleteBoard(int bnum) {
		FreeMapper freeMapper = sqlSession.getMapper(FreeMapper.class);
		FreeBoardVO vo = new FreeBoardVO();
	      vo.setBnum(bnum);
	      freeMapper.deleteBoard(vo);

	}

	@Override
	public void updateBoardDetail(FreeBoardVO vo) {
		FreeMapper freeMapper = sqlSession.getMapper(FreeMapper.class);
		freeMapper.updateBoardDetail(vo);

	}

}
