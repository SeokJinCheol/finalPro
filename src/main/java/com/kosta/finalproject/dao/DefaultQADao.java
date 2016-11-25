package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.DefaultQAVO;

public interface DefaultQADao {
public void insert(DefaultQAVO vo);
public ArrayList<DefaultQAVO> showAll(int startrow,int endrow);
public int listAllCount();
}
