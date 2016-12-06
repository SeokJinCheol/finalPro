package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.DefaultQAVO;

public interface DefaultQAMapper {
	void insert(DefaultQAVO vo);

	ArrayList<DefaultQAVO> showAll(DefaultQAVO vo);

	int listAllCount();
}