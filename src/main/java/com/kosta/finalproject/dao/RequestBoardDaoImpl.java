package com.kosta.finalproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.finalproject.vo.RequestBoardVO;

@Repository
public class RequestBoardDaoImpl implements RequestBoardDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<RequestBoardVO> RequestBoardSelectAll() {
		ArrayList<RequestBoardVO> result = new ArrayList<RequestBoardVO>();
		RequestBoardMapper mapper = sqlSession.getMapper(RequestBoardMapper.class);
		result = mapper.RequestBoardSelectAll();
		
		return result;
	}

	@Override
	public void requestinsert(RequestBoardVO vo) {
		RequestBoardMapper mapper = sqlSession.getMapper(RequestBoardMapper.class);
		mapper.requestinsert(vo);
	}

	@Override
	public ArrayList<RequestBoardVO> RequestBoardUserSelectAll(String session_id) {
		
		ArrayList<RequestBoardVO> result = new ArrayList<RequestBoardVO>();
		RequestBoardMapper mapper = sqlSession.getMapper(RequestBoardMapper.class);
		result = mapper.RequestBoardUserSelectAll(session_id);
		
		return result;
	}

	@Override
	public ArrayList<RequestBoardVO> RequestBoardUpdateForm(int codeNum) {
		
		ArrayList<RequestBoardVO> result = new ArrayList<RequestBoardVO>();
		RequestBoardMapper mapper = sqlSession.getMapper(RequestBoardMapper.class);
		result = mapper.RequestBoardUpdateForm(codeNum);
		
		return result;
	}

	@Override
	public void requestBoardUpdate(RequestBoardVO vo) {
		RequestBoardMapper mapper = sqlSession.getMapper(RequestBoardMapper.class);
		mapper.requestBoardUpdate(vo);
	}

	@Override
	public void requestBoardDelete(RequestBoardVO vo) {
		RequestBoardMapper mapper = sqlSession.getMapper(RequestBoardMapper.class);
		mapper.requestBoardDelete(vo);
	}

	@Override
	public ArrayList<RequestBoardVO> RegisterBoardWriteForm(int codeNum) {
		
		ArrayList<RequestBoardVO> result = new ArrayList<RequestBoardVO>();
		RequestBoardMapper mapper = sqlSession.getMapper(RequestBoardMapper.class);
		result = mapper.RegisterBoardWriteForm(codeNum);
		
		return result;
	}

	@Override
	public void packageStatusupdate(RequestBoardVO vo) {
		RequestBoardMapper mapper = sqlSession.getMapper(RequestBoardMapper.class);
		mapper.packageStatusupdate(vo);
	}

	@Override
	public ArrayList<RequestBoardVO> requeststatus(String status) {
		
		ArrayList<RequestBoardVO> result = new ArrayList<RequestBoardVO>();
		RequestBoardMapper mapper = sqlSession.getMapper(RequestBoardMapper.class);
		result = mapper.requeststatus(status);
		
		return result;
	}

	@Override
	public ArrayList<RequestBoardVO> companyselect(String company) {
		
		ArrayList<RequestBoardVO> result = new ArrayList<RequestBoardVO>();
		RequestBoardMapper mapper = sqlSession.getMapper(RequestBoardMapper.class);
		result = mapper.companyselect(company);
		
		return result;
	}

	@Override
	public void requestdelete(RequestBoardVO vo) {
		RequestBoardMapper mapper = sqlSession.getMapper(RequestBoardMapper.class);
		mapper.requestBoardDelete(vo);
	}
	public ArrayList<RequestBoardVO> requestcontent(int codeNum) {
	      ArrayList<RequestBoardVO> result = new ArrayList<RequestBoardVO>();
	      RequestBoardMapper requestMapper = sqlSession.getMapper(RequestBoardMapper.class);
	      result = requestMapper.requestcontent(codeNum);

	      return result;
	   }
}