package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.StorageBoardVO;

public interface StorageBoardMapper {
	public ArrayList<StorageBoardVO> storageAll();

	public ArrayList<StorageBoardVO> codeNumCount(int codeNum);

	public ArrayList<StorageBoardVO> codeNumCount1(int codeNum);

	public void storageinsert(StorageBoardVO vo);

	public void storageend(StorageBoardVO vo);

	public ArrayList<StorageBoardVO> storageCount();
}
