package com.kosta.finalproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.finalproject.vo.StorageBoardVO;

@Repository
public class StorageBoardDaoImpl implements StorageBoardDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<StorageBoardVO> storageAll() {

		ArrayList<StorageBoardVO> result = new ArrayList<StorageBoardVO>();
		StorageBoardMapper mapper = sqlSession.getMapper(StorageBoardMapper.class);
		result = mapper.storageAll();

		return result;
	}

	@Override
	public ArrayList<StorageBoardVO> codeNumCount(int codeNum) {

		StorageBoardMapper mapper = sqlSession.getMapper(StorageBoardMapper.class);
		ArrayList<StorageBoardVO> codecount = mapper.codeNumCount(codeNum);

		return codecount;
	}

	@Override
	public ArrayList<StorageBoardVO> codeNumCount1(int codeNum) {

		StorageBoardMapper mapper = sqlSession.getMapper(StorageBoardMapper.class);
		ArrayList<StorageBoardVO> codecount = mapper.codeNumCount1(codeNum);

		return codecount;
	}

	@Override
	public void storageinsert(StorageBoardVO vo) {
		StorageBoardMapper mapper = sqlSession.getMapper(StorageBoardMapper.class);
		mapper.storageinsert(vo);
	}

	@Override
	public void storageend(StorageBoardVO vo) {
		StorageBoardMapper mapper = sqlSession.getMapper(StorageBoardMapper.class);
		mapper.storageend(vo);
	}

	@Override
	public ArrayList<StorageBoardVO> storageCount() {

		ArrayList<StorageBoardVO> result = new ArrayList<StorageBoardVO>();
		StorageBoardMapper mapper = sqlSession.getMapper(StorageBoardMapper.class);
		result = mapper.storageCount();

		return result;
	}
}