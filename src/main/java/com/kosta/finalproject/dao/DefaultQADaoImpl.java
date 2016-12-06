package com.kosta.finalproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.finalproject.vo.DefaultQAVO;

@Repository
public class DefaultQADaoImpl implements DefaultQADao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(DefaultQAVO vo) {
		DefaultQAMapper qaMapper = sqlSession.getMapper(DefaultQAMapper.class);
		qaMapper.insert(vo);
	}

	@Override
	public ArrayList<DefaultQAVO> showAll(int startrow, int endrow) {
		DefaultQAVO vo = new DefaultQAVO();
		vo.setEndrow(endrow);
		vo.setStartrow(startrow);
		DefaultQAMapper qaMapper = sqlSession.getMapper(DefaultQAMapper.class);
		ArrayList<DefaultQAVO> list = qaMapper.showAll(vo);
		return list;
	}

	@Override
	public int listAllCount() {
		DefaultQAMapper qaMapper = sqlSession.getMapper(DefaultQAMapper.class);
		int num = qaMapper.listAllCount();
		return num;
	}
}