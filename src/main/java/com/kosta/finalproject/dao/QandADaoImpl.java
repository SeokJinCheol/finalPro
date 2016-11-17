package com.kosta.finalproject.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.finalproject.vo.QandAVO;

@Repository
public class QandADaoImpl implements QandADao {
	@Autowired
	private SqlSession sqlSession;

	// �Խñ� ���
	public void qainsertMember(QandAVO vo) {
		QandAMapper qandAMapper = sqlSession.getMapper(QandAMapper.class);
		qandAMapper.qainsertMember(vo);

	}

	// ��� ���
	public void reqainsertMember(QandAVO vo) {
		QandAMapper qandAMapper = sqlSession.getMapper(QandAMapper.class);
		qandAMapper.reqainsertMember(vo);
	}

	// ��������
	public ArrayList<QandAVO> contentgetMembers(int bgnum) {
		ArrayList<QandAVO> result = new ArrayList<QandAVO>();
		QandAMapper qandAMapper = sqlSession.getMapper(QandAMapper.class);
		result = qandAMapper.contentgetMembers(bgnum);

		return result;
	}

	// ��ȸ�� ����
	public void readcountUpdate(int bNum) {
		QandAMapper qandAMapper = sqlSession.getMapper(QandAMapper.class);
		qandAMapper.readcountUpdate(bNum);
	}

	// ��� ����
	public void qaupdate(QandAVO vo) {
		QandAMapper qandAMapper = sqlSession.getMapper(QandAMapper.class);
		qandAMapper.qaupdate(vo);
	}

	// �Խñ� �� Ȯ��
	public int getListAllCount() {
		Integer num = sqlSession.selectOne("com.kosta.finalproject.dao.QandAMapper.getListAllCount");
		return num;
	}

	// ��ü �Խñ� ��������
	public ArrayList<QandAVO> getSelectAll(QandAVO qaboard) {
		ArrayList<QandAVO> result = new ArrayList<QandAVO>();
		QandAMapper qandAMapper = sqlSession.getMapper(QandAMapper.class);
		result = qandAMapper.getSelectAll(qaboard);

		return result;
	}

	// MaxNum ���ϱ�
	public int getMaxNum() {
		Integer num = sqlSession.selectOne("com.kosta.finalproject.dao.QandAMapper.getMaxNum");
		if (num == null) {
			num = 0;
		}
		System.out.println(num);
		return num;
	}

	// �����ϱ� (���� ���� �޾ƿ���)
	public QandAVO boardUpdate(String id) {
		QandAVO result = new QandAVO();
		QandAMapper qandAMapper = sqlSession.getMapper(QandAMapper.class);
		result = qandAMapper.boardUpdate(id);

		return result;
	}

	// �Խñ� �����ϱ�
	public void boardUpdatePro(QandAVO vo) {
		QandAMapper qandAMapper = sqlSession.getMapper(QandAMapper.class);
		qandAMapper.boardUpdatePro(vo);
	}

	// ��� �����ϱ�
	public void reboardUpdatePro(QandAVO vo) {
		QandAMapper qandAMapper = sqlSession.getMapper(QandAMapper.class);
		qandAMapper.reboardUpdatePro(vo);
	}

	// �����ϱ�
	public void qadelete(String id, int bNum) {
		QandAMapper qandAMapper = sqlSession.getMapper(QandAMapper.class);
		QandAVO vo = new QandAVO();
		vo.setId(id);
		vo.setbNum(bNum);
		qandAMapper.qadelete(vo);
	}

	// Title �˻�
	public int getListTitleCount(String title) {
		QandAMapper qandAMapper = sqlSession.getMapper(QandAMapper.class);
		QandAVO vo = new QandAVO();
		vo.setTitle(title);
		int num = qandAMapper.getListTitleCount(vo);
		return num;
	}

	// Title �˻�
	public ArrayList<QandAVO> selectTitle(String title, int startRow, int endRow) {

		ArrayList<QandAVO> list = new ArrayList<QandAVO>();
		QandAMapper qandAMapper = sqlSession.getMapper(QandAMapper.class);
		QandAVO vo = new QandAVO();
		vo.setTitle(title);
		vo.setStartRow(startRow);
		vo.setEndRow(endRow);
		list = qandAMapper.selectTitle(vo);
		return list;
	}

	// ID �˻�
	public int getListIDCount(String id) {
		QandAMapper qandAMapper = sqlSession.getMapper(QandAMapper.class);
		QandAVO vo = new QandAVO();
		vo.setId(id);
		int num = qandAMapper.getListIDCount(vo);
		return num;
	}

	// ID �˻�
	public ArrayList<QandAVO> selectId(String id, int startRow, int endRow) {

		QandAMapper qandAMapper = sqlSession.getMapper(QandAMapper.class);
		QandAVO vo = new QandAVO();
		ArrayList<QandAVO> list = new ArrayList<QandAVO>();
		vo.setId(id);
		vo.setStartRow(startRow);
		vo.setEndRow(endRow);
		list = qandAMapper.selectId(vo);
		return list;
	}
}