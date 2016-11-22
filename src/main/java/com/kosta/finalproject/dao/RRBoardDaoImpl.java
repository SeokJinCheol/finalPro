package com.kosta.finalproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.finalproject.vo.RPboardVO;
import com.kosta.finalproject.vo.RRboardVO;

@Repository
public class RRBoardDaoImpl implements RRBoardDao {
	
 @Autowired   
 private SqlSession sqlSession;

@Override
public List<RRboardVO> SelectALL(RRboardVO vo) {

	List result = new ArrayList<RRboardVO>();
	
	return sqlSession.selectList("com.kosta.finalproject.dao.RRBoardMapper.SelectALL");
}

@Override
public void RRboardinsert(RRboardVO vo) {

	System.out.println(sqlSession.toString());
	
	sqlSession.insert("com.kosta.finalproject.dao.RRBoardMapper.RRboardinsert",vo);
	
}

public RRboardVO getcontents(int codeNum) {
	System.out.println("codeNum ="+ codeNum);
	RRboardVO vo =sqlSession.selectOne("com.kosta.finalproject.dao.RRfBoardMapper.getcontents", codeNum);
	
	
	return vo;
}

public void RPboardinsert(RPboardVO vo) {

	System.out.println(vo.toString());
	
	sqlSession.insert("com.kosta.finalproject.dao.RRBoardMapper.RPboardinsert",vo);
	
}

}