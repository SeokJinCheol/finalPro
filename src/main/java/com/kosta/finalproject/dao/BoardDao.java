package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.BoardVO;


public interface BoardDao {
	public void insertMember(BoardVO vo); // �Խ��� insert
	public void reinsertMember(BoardVO vo); // �Խ��� insert (���)
	public ArrayList<BoardVO> contentgetMembers(int bgnum); // �Խ��� ��������
	public void readcountUpdate(int bNum); // ��ȸ�� ����
	public void update(BoardVO vo); // �Խ��� ��� ����
	public int getListAllCount(); // �Խñ� �� ���ϱ�
	public ArrayList<BoardVO> getSelectAll(BoardVO board); // �Խ��� ����Ʈ�̱�����¡ó��
	public int getMaxNum(); // Max bNum ���ϱ�
	public BoardVO boardUpdate(int bnum); // �Խ��� �����ϱ� (������ �θ���)
	public void boardUpdatePro(BoardVO vo); // �Խ��� �����ϱ� (���� ����)
	public void reboardUpdatePro(BoardVO vo); // �Խ��� ��� �����ϱ� (���� ����)
	public void delete(String id, int bNum); // �����ϱ�
	public int getListTitleCount(String title); // Title �˻�����
	public ArrayList<BoardVO> selectTitle(String title, int startRow, int endRow); // =
	public int getListIDCount(String id); // ID �˻� ����
	public ArrayList<BoardVO> selectId(String id, int startRow, int endRow);
}