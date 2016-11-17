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

   @Override
   public void writeMain(BoardVO vo) {
      BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
      boardMapper.writeMain(vo);
   }

   @Override
   public ArrayList<BoardVO> showAll(int startrow, int endrow) {
      ArrayList<BoardVO> list = new ArrayList<BoardVO>();
      BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
      BoardVO vo = new BoardVO();
      vo.setStartRow(startrow);
      vo.setEndRow(endrow);
      list = boardMapper.showAll(vo);

      return list;
   }

   @Override
   public BoardVO showthis(int bnum) {
      BoardVO vo = new BoardVO();
      BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
      vo = boardMapper.showthis(bnum);
      return vo;
   }

   @Override
   public void updateCount(int bnum) {
      BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
      boardMapper.updateCount(bnum);
   }

   @Override
   public ArrayList<BoardVO> selectReply(int bnum) {
      ArrayList<BoardVO> list = new ArrayList<BoardVO>();
      BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
      list = boardMapper.selectReply(bnum);
      return list;
   }

   @Override
   public int getListAllCount() {
      BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
      int num = boardMapper.getListAllCount();

      return num;
   }

   @Override
   public ArrayList<BoardVO> selectTitle(String title, int startrow, int endrow) {
      ArrayList<BoardVO> list = new ArrayList<BoardVO>();
      BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
      BoardVO vo = new BoardVO();
      vo.setTitle(title);
      vo.setStartRow(startrow);
      vo.setEndRow(endrow);
      list = boardMapper.selectTitle(vo);
      return list;
   }

   @Override
   public int getListTitleCount(String title) {
      BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);

      BoardVO vo = new BoardVO();
      vo.setTitle(title);
      int num = boardMapper.getListTitleCount(vo);
      return num;
   }

   @Override
   public ArrayList<BoardVO> selectId(String id, int startrow, int endrow) {
      BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
      BoardVO vo = new BoardVO();
      ArrayList<BoardVO> list = new ArrayList<BoardVO>();
      vo.setId(id);
      vo.setStartRow(startrow);
      vo.setEndRow(endrow);
      list = boardMapper.selectId(vo);

      return list;
   }

   @Override
   public int getListIDCount(String id) {
      BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
      BoardVO vo = new BoardVO();
      vo.setId(id);
      int num = boardMapper.getListIDCount(vo);

      return num;
   }

   @Override
   public void delete(int bnum) {
      BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
      BoardVO vo = new BoardVO();
      vo.setBnum(bnum);
      boardMapper.delete(vo);
   }

   @Override
   public void updateDetail(BoardVO vo) {
      BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
      boardMapper.updateDetail(vo);
   }
}