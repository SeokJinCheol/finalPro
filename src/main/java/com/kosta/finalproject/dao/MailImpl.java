package com.kosta.finalproject.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.finalproject.vo.MailVO;

@Repository
public class MailImpl implements MailDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void sendmail(MailVO vo) {
		MailMapper mapper = sqlSession.getMapper(MailMapper.class);
		mapper.sendmail(vo);
	}
}
