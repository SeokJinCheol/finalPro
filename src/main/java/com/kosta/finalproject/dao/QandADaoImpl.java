package com.kosta.finalproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.kosta.finalproject.vo.QandAVO;

@Repository
public class QandADaoImpl implements QandADao {
	
	@Autowired
	private SqlSession sqlSession;

	// 게시글 등록
	   @Override
	   public void writeMain(QandAVO vo) {
	      QandAMapper QandAMapper = sqlSession.getMapper(QandAMapper.class);
	      QandAMapper.writeMain(vo);
	   }

	   @Override
	   public ArrayList<QandAVO> showAll(int startrow, int endrow) {
	      ArrayList<QandAVO> list = new ArrayList<QandAVO>();
	      QandAMapper QandAMapper = sqlSession.getMapper(QandAMapper.class);
	      QandAVO vo = new QandAVO();
	      vo.setStartRow(startrow);
	      vo.setEndRow(endrow);
	      list = QandAMapper.showAll(vo);

	      return list;
	   }

	   @Override
	   public QandAVO showthis(int bnum) {
	      QandAVO vo = new QandAVO();
	      QandAMapper QandAMapper = sqlSession.getMapper(QandAMapper.class);
	      vo = QandAMapper.showthis(bnum);
	      return vo;
	   }

	   @Override
	   public void updateCount(int bnum) {
	      QandAMapper QandAMapper = sqlSession.getMapper(QandAMapper.class);
	      QandAMapper.updateCount(bnum);
	   }

	   @Override
	   public ArrayList<QandAVO> selectReply(int bnum) {
	      ArrayList<QandAVO> list = new ArrayList<QandAVO>();
	      QandAMapper QandAMapper = sqlSession.getMapper(QandAMapper.class);
	      list = QandAMapper.selectReply(bnum);
	      return list;
	   }

	   @Override
	   public int ListAllCount() {
		   System.out.println("ListAllCount  call1 ");
	      QandAMapper QandAMapper = sqlSession.getMapper(QandAMapper.class);
	      System.out.println("ListAllCount  call2 ");
	      int num = QandAMapper.ListAllCount();   ///
	      
	      System.out.println("ListAllCount  call3 ");

	      return num;
	   }

	   @Override
	   public ArrayList<QandAVO> selectTitle(String title, int startrow, int endrow) {
	      ArrayList<QandAVO> list = new ArrayList<QandAVO>();
	      QandAMapper QandAMapper = sqlSession.getMapper(QandAMapper.class);
	      QandAVO vo = new QandAVO();
	      vo.setTitle(title);
	      vo.setStartRow(startrow);
	      vo.setEndRow(endrow);
	      list = QandAMapper.selectTitle(vo);
	      return list;
	   }

	   @Override
	   public int getListTitleCount(String title) {
	      QandAMapper QandAMapper = sqlSession.getMapper(QandAMapper.class);

	      QandAVO vo = new QandAVO();
	      vo.setTitle(title);
	      int num = QandAMapper.getListTitleCount(vo);
	      return num;
	   }

	   @Override
	   public ArrayList<QandAVO> selectId(String id, int startrow, int endrow) {
	      QandAMapper QandAMapper = sqlSession.getMapper(QandAMapper.class);
	      QandAVO vo = new QandAVO();
	      ArrayList<QandAVO> list = new ArrayList<QandAVO>();
	      vo.setId(id);
	      vo.setStartRow(startrow);
	      vo.setEndRow(endrow);
	      list = QandAMapper.selectId(vo);

	      return list;
	   }

	   @Override
	   public int getListIDCount(String id) {
	      QandAMapper QandAMapper = sqlSession.getMapper(QandAMapper.class);
	      QandAVO vo = new QandAVO();
	      vo.setId(id);
	      int num = QandAMapper.getListIDCount(vo);

	      return num;
	   }

	   @Override
	   public void delete(int bnum) {
	      QandAMapper QandAMapper = sqlSession.getMapper(QandAMapper.class);
	      QandAVO vo = new QandAVO();
	      vo.setBnum(bnum);
	      QandAMapper.delete(vo);
	   }

	   @Override
	   public void updateDetail(QandAVO vo) {
	      QandAMapper QandAMapper = sqlSession.getMapper(QandAMapper.class);
	      QandAMapper.updateDetail(vo);
	   }
}