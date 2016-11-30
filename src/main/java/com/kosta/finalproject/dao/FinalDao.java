package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.UsersVO;

public interface FinalDao {
	ArrayList<UsersVO> getMembers();

	void insertMember(UsersVO vo);

	int deleteMember(UsersVO vo);

	UsersVO updateMember(String id);

	void updateMemberPro(UsersVO vo);

	UsersVO confirmIdMember(String id);

	void insertRank(String id, String rightrank);

	void admin_deleteMember(UsersVO vo);

	void admin_deleteMemberRank(String id);
	
	void deleteRank(String id);
	
	public int getAdAllCount();
	
	public int getAdminNameCount(String word);
	
	public int getAdminIDCount(String word);
	
	public int getAdminRankCount(String word);
	
	public ArrayList<UsersVO> adGetMembers(UsersVO users);
	
	public ArrayList<UsersVO> adSelectName(String word, int startRow, int endRow);
	
	public ArrayList<UsersVO> adSelectId(String word, int startRow, int endRow);
	
	public ArrayList<UsersVO> adSelectRank(String word, int startRow, int endRow);
}