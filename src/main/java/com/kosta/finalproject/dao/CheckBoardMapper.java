package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.CheckBoardVO;

public interface CheckBoardMapper {
	public void CheckBoardInsert(CheckBoardVO vo);
	public void Checkrentterup(CheckBoardVO vo);
	public void packageStatus(CheckBoardVO vo);
	public void checkdelect(CheckBoardVO vo);
	public ArrayList<CheckBoardVO> codeNumselect(int codeNum);
}
