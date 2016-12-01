package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.BoardVO;


public interface BoardMapper {
	void insertMember(BoardVO vo); // �Խ��� insert
	void reinsertMember(BoardVO vo); // �Խ��� insert (���)
	BoardVO contentgetMembers(int bgnum); // �Խ��� ��������
	ArrayList<BoardVO> recontentget(int bgnum); // �Խ��� �������� ����
	void readcountUpdate(int bNum); // ��ȸ�� ����
	void update(BoardVO vo); // �Խ��� ��� ����
	int getListAllCount(); // �Խñ� �� ���ϱ�
	ArrayList<BoardVO> getSelectAll(BoardVO board); // �Խ��� ����Ʈ�̱�, ����¡ó��
	int getMaxNum(); // Max bNum ���ϱ�
	BoardVO boardUpdate(int bnum); // �Խ��� �����ϱ� (������ �θ���)
	void boardUpdatePro(BoardVO vo); // �Խ��� �����ϱ� (���� ����)
	void reboardUpdatePro(BoardVO vo); // �Խ��� ��� �����ϱ� (���� ����)
	void delete(BoardVO vo); // �����ϱ�
	int getListTitleCount(BoardVO vo); // Title �˻�����
	ArrayList<BoardVO> selectTitle(BoardVO vo); // =
	int getListIDCount(BoardVO vo); // ID �˻� ����
	ArrayList<BoardVO> selectId(BoardVO vo); // =
}