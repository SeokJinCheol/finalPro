package com.kosta.finalproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.finalproject.vo.CheckBoardVO;

@Repository
public class CheckBoardDaoImpl implements CheckBoardDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void CheckBoardInsert(CheckBoardVO vo) {
		CheckBoardMapper mapper = sqlSession.getMapper(CheckBoardMapper.class);
		mapper.CheckBoardInsert(vo);
	}

	@Override
	public void Checkrentterup(CheckBoardVO vo) {
		CheckBoardMapper mapper = sqlSession.getMapper(CheckBoardMapper.class);
		mapper.Checkrentterup(vo);
	}

	@Override
	public void packageStatus(CheckBoardVO vo) {
		CheckBoardMapper mapper = sqlSession.getMapper(CheckBoardMapper.class);
		mapper.packageStatus(vo);
	}

	@Override
	public void checkdelect(CheckBoardVO vo) {
		CheckBoardMapper mapper = sqlSession.getMapper(CheckBoardMapper.class);
		mapper.checkdelect(vo);
	}

	@Override
	public ArrayList<CheckBoardVO> codeNumselect(int codeNum) {
		
		ArrayList<CheckBoardVO> result = new ArrayList<CheckBoardVO>();
		CheckBoardMapper mapper = sqlSession.getMapper(CheckBoardMapper.class);
		result = mapper.codeNumselect(codeNum);
		
		return result;
	}
}
