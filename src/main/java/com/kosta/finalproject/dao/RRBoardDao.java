package com.kosta.finalproject.dao;

import java.util.List;

import com.kosta.finalproject.vo.RPboardVO;
import com.kosta.finalproject.vo.RRboardVO;

public interface RRBoardDao {
	
	List<RRboardVO> SelectALL(RRboardVO vo);
	
	public void RRboardinsert(RRboardVO vo);
	
	public RRboardVO getcontents(int codeNum);

	
	
	
	
	//rp 보드 관련
	
	public List<RPboardVO> showALL();

	public void RPboardinsert(RPboardVO vo);

	public RPboardVO selectModyRPB(int seqNum);

	public void updateRPB(RPboardVO vo);
	
	public void setRPBstatus(RPboardVO vo);
}