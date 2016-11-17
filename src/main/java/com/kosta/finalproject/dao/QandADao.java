package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.QandAVO;

public interface QandADao {
	public void qainsertMember(QandAVO vo); // �Խ��� insert

	public void reqainsertMember(QandAVO vo); // �Խ��� insert (���)

	public ArrayList<QandAVO> contentgetMembers(int bgnum); // �Խ��� ��������

	public void readcountUpdate(int bNum); // ��ȸ�� ����

	public void qaupdate(QandAVO vo); // �Խ��� ��� ����

	public int getListAllCount(); // �Խñ� �� ���ϱ�

	public ArrayList<QandAVO> getSelectAll(QandAVO qaboard); // �Խ��� ����Ʈ�̱�,
																// ����¡ó��

	public int getMaxNum(); // Max bNum ���ϱ�

	public QandAVO boardUpdate(String id); // �Խ��� �����ϱ� (������ �θ���)

	public void boardUpdatePro(QandAVO vo); // �Խ��� �����ϱ� (���� ����)

	public void reboardUpdatePro(QandAVO vo); // �Խ��� ��� �����ϱ� (���� ����)

	public void qadelete(String id, int bNum); // �����ϱ�

	public int getListTitleCount(String title); // Title �˻�����

	public ArrayList<QandAVO> selectTitle(String title, int startRow, int endRow); // =

	public int getListIDCount(String id); // ID �˻� ����

	public ArrayList<QandAVO> selectId(String id, int startRow, int endRow); // =
}