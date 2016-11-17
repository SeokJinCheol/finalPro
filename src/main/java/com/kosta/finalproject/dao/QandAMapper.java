package com.kosta.finalproject.dao;

import java.util.ArrayList;

import com.kosta.finalproject.vo.QandAVO;

public interface QandAMapper {
	void qainsertMember(QandAVO vo); // �Խ��� insert

	void reqainsertMember(QandAVO vo); // �Խ��� insert (���)

	ArrayList<QandAVO> contentgetMembers(int bgnum); // �Խ��� ��������

	void readcountUpdate(int bNum); // ��ȸ�� ����

	void qaupdate(QandAVO vo); // �Խ��� ��� ����

	int getListAllCount(); // �Խñ� �� ���ϱ�

	ArrayList<QandAVO> getSelectAll(QandAVO qaboard); // �Խ��� ����Ʈ�̱�, ����¡ó��

	int getMaxNum(); // Max bNum ���ϱ�

	QandAVO boardUpdate(String id); // �Խ��� �����ϱ� (������ �θ���)

	void boardUpdatePro(QandAVO vo); // �Խ��� �����ϱ� (���� ����)

	void reboardUpdatePro(QandAVO vo); // �Խ��� ��� �����ϱ� (���� ����)

	void qadelete(QandAVO vo); // �����ϱ�

	int getListTitleCount(QandAVO vo); // Title �˻�����

	ArrayList<QandAVO> selectTitle(QandAVO vo); // =

	int getListIDCount(QandAVO vo); // ID �˻� ����

	ArrayList<QandAVO> selectId(QandAVO vo); // =

}
