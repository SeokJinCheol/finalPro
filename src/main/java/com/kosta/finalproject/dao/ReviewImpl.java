package com.kosta.finalproject.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.finalproject.vo.ReviewVO;

@Repository
public class ReviewImpl implements ReviewDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void reviewinsert(ReviewVO vo) {
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		mapper.reviewinsert(vo);
	}
}
