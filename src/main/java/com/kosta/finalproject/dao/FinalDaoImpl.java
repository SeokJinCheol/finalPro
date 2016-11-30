package com.kosta.finalproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.finalproject.vo.RankVO;
import com.kosta.finalproject.vo.UsersVO;

@Repository
public class FinalDaoImpl implements FinalDao {
	@Autowired
	private SqlSession sqlSession;

	// ȸ����ȸ
	@Override
	public ArrayList<UsersVO> getMembers() {
		ArrayList<UsersVO> result = new ArrayList<UsersVO>();
		FinalMapper finalMapper = sqlSession.getMapper(FinalMapper.class);
		result = finalMapper.getMembers();

		return result;
	}

	// ȸ������
	@Override
	public void insertMember(UsersVO vo) {
		FinalMapper finalMapper = sqlSession.getMapper(FinalMapper.class);
		finalMapper.insertMember(vo);

	}

	// ȸ����������
	@Override
	public UsersVO updateMember(String id) {
		UsersVO result = new UsersVO();
		FinalMapper finalMapper = sqlSession.getMapper(FinalMapper.class);
		result = finalMapper.updateMember(id);

		return result;
	}

	// ȸ����������2
	@Override
	public void updateMemberPro(UsersVO vo) {
		FinalMapper finalMapper = sqlSession.getMapper(FinalMapper.class);
		finalMapper.updateMemberPro(vo);
	}

	// ID �ߺ�Ȯ��
	@Override
	public UsersVO confirmIdMember(String id) {
		FinalMapper finalMapper = sqlSession.getMapper(FinalMapper.class);
		UsersVO result = null;
		result = finalMapper.confirmIdMember(id);

		return result;
	}

	// ȸ�����Խ�_�ڵ� ȸ�� ���� �ο�
	@Override
	public void insertRank(String id, String rightrank) {
		RankVO vo = new RankVO();
		vo.setId(id);
		vo.setRightrank(rightrank);

		sqlSession.insert("com.kosta.finalproject.dao.FinalMapper.insertRank", vo);
	}

	// ������ ����_ȸ������
	@Override
	public void admin_deleteMember(UsersVO vo) {
		sqlSession.delete("com.kosta.finalproject.dao.FinalMapper.admin_deleteMember", vo);
	}

	// ������ ����_ȸ������ �� , Roll ����
	@Override
	public void admin_deleteMemberRank(String id) {
		RankVO vo = new RankVO();
		vo.setId(id);

		sqlSession.delete("com.kosta.finalproject.dao.FinalMapper.admin_deleteMemberRank", vo);
	}

	// ȸ������
	@Override
	public int deleteMember(UsersVO vo) {
		return sqlSession.delete("com.kosta.finalproject.dao.FinalMapper.deleteMember", vo);
	}

	// ȸ������ ��, Roll ����
	@Override
	public void deleteRank(String id) {
		RankVO vo = new RankVO();
		vo.setId(id);

		sqlSession.delete("com.kosta.finalproject.dao.FinalMapper.deleteRank", vo);
	}
	
	// ȸ�� ��ü �� Ȯ��
	@Override
	public int getAdAllCount() {
		FinalMapper finalMapper = sqlSession.getMapper(FinalMapper.class);
		int num = finalMapper.getAdAllCount();
		return num;
	}

	// �̸� �˻�
	@Override
	public int getAdminNameCount(String word) {
		FinalMapper finalMapper = sqlSession.getMapper(FinalMapper.class);
		UsersVO vo = new UsersVO();
		vo.setName(word);
		int num = finalMapper.getAdminNameCount(vo);
		return num;
	}

	// ID �˻�
	@Override
	public int getAdminIDCount(String word) {
		FinalMapper finalMapper = sqlSession.getMapper(FinalMapper.class);
		UsersVO vo = new UsersVO();
		vo.setId(word);
		int num = finalMapper.getAdminIDCount(vo);
		return num;
	}

	// Rank �˻�
	@Override
	public int getAdminRankCount(String word) {
		FinalMapper finalMapper = sqlSession.getMapper(FinalMapper.class);
		UsersVO vo = new UsersVO();
		vo.setMemberRank(word);
		int num = finalMapper.getAdminRankCount(vo);
		return num;
	}

	// �������� ��ü ȸ�� ��� �̱�
	@Override
	public ArrayList<UsersVO> adGetMembers(UsersVO users) {
		ArrayList<UsersVO> result = new ArrayList<UsersVO>();
		FinalMapper finalMapper = sqlSession.getMapper(FinalMapper.class);
		result = finalMapper.adGetMembers(users);

		return result;
	}

	// �������� �̸����� ȸ�� �˻�
	@Override
	public ArrayList<UsersVO> adSelectName(String word, int startRow, int endRow) {
		ArrayList<UsersVO> result = new ArrayList<UsersVO>();
		FinalMapper finalMapper = sqlSession.getMapper(FinalMapper.class);
		UsersVO vo = new UsersVO();
		vo.setName(word);
		vo.setStartRow(startRow);
		vo.setEndRow(endRow);
		result = finalMapper.adSelectName(vo);
		return result;
	}

	// �������� ID�� ȸ�� �˻�
	@Override
	public ArrayList<UsersVO> adSelectId(String word, int startRow, int endRow) {
		ArrayList<UsersVO> result = new ArrayList<UsersVO>();
		FinalMapper finalMapper = sqlSession.getMapper(FinalMapper.class);
		UsersVO vo = new UsersVO();
		vo.setId(word);
		vo.setStartRow(startRow);
		vo.setEndRow(endRow);
		result = finalMapper.adSelectId(vo);
		return result;
	}

	// �������� Rank�� ȸ�� �˻�
	@Override
	public ArrayList<UsersVO> adSelectRank(String word, int startRow, int endRow) {
		ArrayList<UsersVO> result = new ArrayList<UsersVO>();
		FinalMapper finalMapper = sqlSession.getMapper(FinalMapper.class);
		UsersVO vo = new UsersVO();
		vo.setMemberRank(word);
		vo.setStartRow(startRow);
		vo.setEndRow(endRow);
		result = finalMapper.adSelectRank(vo);
		return result;
	}
}