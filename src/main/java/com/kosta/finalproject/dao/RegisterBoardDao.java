package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.RegisterBoardVO;

public interface RegisterBoardDao {
	public void Registerinsert(RegisterBoardVO vo);
	public ArrayList<RegisterBoardVO> Registerselect();
	public ArrayList<RegisterBoardVO> RegisterUpForm(String codeNum);
	public void PackageStatusUP(RegisterBoardVO vo);
	public void packageStatus(RegisterBoardVO vo);
	public ArrayList<RegisterBoardVO> MyRegisterselect(String session_id);
	public ArrayList<RegisterBoardVO> Registerpossibility(String possibility);
	public void registerdelete(RegisterBoardVO vo);
	public ArrayList<RegisterBoardVO> selectTitle(String word);
	public ArrayList<RegisterBoardVO> selectCategory(String word);
	public ArrayList<RegisterBoardVO> pselectTitle(String packageStatus, String word);
	public ArrayList<RegisterBoardVO> pselectCategory(String packageStatus, String word);
	public ArrayList<RegisterBoardVO> registercontent(int codeNum);
	public ArrayList<RegisterBoardVO> registercount();
	public void imgupdate(RegisterBoardVO vo);
}
