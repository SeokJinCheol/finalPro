package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.RankVO;
import com.kosta.finalproject.vo.UsersVO;

public interface FinalMapper {
	ArrayList<UsersVO> getMembers();

	void insertMember(UsersVO vo);

	int deleteMember(UsersVO vo);

	UsersVO updateMember(String id);

	void updateMemberPro(UsersVO vo);

	UsersVO confirmIdMember(String id);

	void insertRank(RankVO vo);

	// »∏ø¯≈ª≈
	void admin_deleteMember(UsersVO vo);

	// ≈ª≈ ==> ∑— ªË¡¶
	void admin_deleteMemberRank(String id);

	void deleteRank(String id);
	
    int getAdAllCount();
	
	int getAdminNameCount(UsersVO vo);
	
	int getAdminIDCount(UsersVO vo);
	
	int getAdminRankCount(UsersVO vo);
	
	ArrayList<UsersVO> adGetMembers(UsersVO users);
	
	ArrayList<UsersVO> adSelectName(UsersVO vo);
	
	ArrayList<UsersVO> adSelectId(UsersVO vo);
	
	ArrayList<UsersVO> adSelectRank(UsersVO vo);
	
}