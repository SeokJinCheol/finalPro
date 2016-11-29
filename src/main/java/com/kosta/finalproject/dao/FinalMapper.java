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

	// ȸ��Ż��
	void admin_deleteMember(UsersVO vo);

	// Ż�� ==> �� ����
	void admin_deleteMemberRank(String id);

	void deleteRank(String id);
}