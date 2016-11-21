package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.RRboardVO;

public interface RRBoardMapper {

	ArrayList<RRboardVO> SelectALL(RRboardVO vo);
	
	public void RRboardinsert(RRboardVO vo);
	
	public RRboardVO getcontents(int codeNum);


}