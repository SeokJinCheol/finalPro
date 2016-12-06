package com.kosta.finalproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.finalproject.vo.ReviewVO;

@Repository
public class ReviewImpl implements ReviewDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void reviewinsert(ReviewVO vo) {
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		mapper.reviewinsert(vo);
	}

	@Override
	public ArrayList<ReviewVO> reviewselect(int codeNum) {
		ArrayList<ReviewVO> result = new ArrayList<ReviewVO>();
		ReviewMapper mapper = sqlSession.getMapper(ReviewMapper.class);
		result = mapper.reviewselect(codeNum);

		return result;
	}
}
