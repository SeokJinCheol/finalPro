package com.kosta.finalproject.dao;

import java.util.List;

import com.kosta.finalproject.vo.RPboardVO;
import com.kosta.finalproject.vo.RRboardVO;
import com.kosta.finalproject.vo.SearchVO;

public interface RRBoardDao {

	List<RRboardVO> SelectALL(RRboardVO vo);

	public void RRboardinsert(RRboardVO vo);

	public RRboardVO getcontents(int codeNum);

	public void setRRStatus(RRboardVO vo);

	// rp ���� ����

	public List<RPboardVO> showALL(SearchVO vo);

	public void RPboardinsert(RPboardVO vo);

	public RPboardVO selectModyRPB(int seqNum);

	public void updateRPB(RPboardVO vo);

	public void setRPBstatus(RPboardVO vo);

	public List<RPboardVO> SelectCalc(SearchVO vo);
}