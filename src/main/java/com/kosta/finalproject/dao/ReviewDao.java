package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.ReviewVO;

public interface ReviewDao {
	public void reviewinsert(ReviewVO vo);
	public ArrayList<ReviewVO> reviewselect(int codeNum);
}
