package com.kosta.finalproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.finalproject.vo.RegisterBoardVO;

@Repository
public class RegisterBoardDaoImpl implements RegisterBoardDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void Registerinsert(RegisterBoardVO vo) {
		RegisterBoardMapper mapper = sqlSession.getMapper(RegisterBoardMapper.class);
		mapper.Registerinsert(vo);
	}

	@Override
	public ArrayList<RegisterBoardVO> Registerselect() {
		ArrayList<RegisterBoardVO> result = new ArrayList<RegisterBoardVO>();
		RegisterBoardMapper mapper = sqlSession.getMapper(RegisterBoardMapper.class);
		result = mapper.Registerselect();
		
		return result;
	}

	@Override
	public ArrayList<RegisterBoardVO> RegisterUpForm(String codeNum) {
		
		ArrayList<RegisterBoardVO> result = new ArrayList<RegisterBoardVO>();
		RegisterBoardMapper mapper = sqlSession.getMapper(RegisterBoardMapper.class);
		result = mapper.RegisterUpForm(codeNum);
		
		return result;
	}

	@Override
	public void PackageStatusUP(RegisterBoardVO vo) {
		RegisterBoardMapper mapper = sqlSession.getMapper(RegisterBoardMapper.class);
		mapper.PackageStatusUP(vo);
	}

	@Override
	public void packageStatus(RegisterBoardVO vo) {
		RegisterBoardMapper mapper = sqlSession.getMapper(RegisterBoardMapper.class);
		mapper.packageStatus(vo);
	}

	@Override
	public ArrayList<RegisterBoardVO> MyRegisterselect(String session_id) {
		
		ArrayList<RegisterBoardVO> result = new ArrayList<RegisterBoardVO>();
		RegisterBoardMapper mapper = sqlSession.getMapper(RegisterBoardMapper.class);
		result = mapper.MyRegisterselect(session_id);
		
		return result;
	}

	@Override
	public ArrayList<RegisterBoardVO> Registerpossibility(String possibility) {
		
		ArrayList<RegisterBoardVO> result = new ArrayList<RegisterBoardVO>();
		RegisterBoardMapper mapper = sqlSession.getMapper(RegisterBoardMapper.class);
		result = mapper.Registerpossibility(possibility);
		
		return result;
	}

	@Override
	public void registerdelete(RegisterBoardVO vo) {
		RegisterBoardMapper mapper = sqlSession.getMapper(RegisterBoardMapper.class);
		mapper.registerdelete(vo);
	}
}