package com.kosta.finalproject.dao;

import java.util.List;

import com.kosta.finalproject.vo.RRboardVO;

public interface RRBoardDao {
	
	List<RRboardVO> SelectALL(RRboardVO vo);
	
	public void RRboardinsert(RRboardVO vo);
}