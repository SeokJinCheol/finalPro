package com.kosta.finalproject.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.finalproject.vo.RPboardVO;
import com.kosta.finalproject.vo.RRboardVO;
import com.kosta.finalproject.vo.SearchVO;

@Repository
public class RRBoardDaoImpl implements RRBoardDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<RRboardVO> SelectALL(RRboardVO vo) {

		return sqlSession.selectList("com.kosta.finalproject.dao.RRBoardMapper.SelectALL", vo);
	}

	public List<RRboardVO> SelectALL2(RRboardVO vo) {

		return sqlSession.selectList("com.kosta.finalproject.dao.RRBoardMapper.SelectALL2", vo);
	}

	public List<RRboardVO> SelectALLAD(RRboardVO vo) {

		return sqlSession.selectList("com.kosta.finalproject.dao.RRBoardMapper.SelectALLAD", vo);
	}

	@Override
	public void RRboardinsert(RRboardVO vo) {

		sqlSession.insert("com.kosta.finalproject.dao.RRBoardMapper.RRboardinsert", vo);

	}

	public RRboardVO getcontents(int codeNum) {
		System.out.println("codeNum =" + codeNum);
		return sqlSession.selectOne("com.kosta.finalproject.dao.RRBoardMapper.getcontents", codeNum);
	}

	public void RPboardinsert(RPboardVO vo) {

		System.out.println(vo.toString());

		sqlSession.insert("com.kosta.finalproject.dao.RRBoardMapper.RPboardinsert", vo);

	}

	public List<RPboardVO> showALL(SearchVO vo) {

		return sqlSession.selectList("com.kosta.finalproject.dao.RRBoardMapper.showALL", vo);
	}

	public RPboardVO selectModyRPB(int seqNum) {

		return sqlSession.selectOne("com.kosta.finalproject.dao.RRBoardMapper.selectModyRPB", seqNum);
	}

	@Override
	public void updateRPB(RPboardVO vo) {

		sqlSession.update("com.kosta.finalproject.dao.RRBoardMapper.updateRPB", vo);
	}

	public void setRPBstatus(RPboardVO vo) {

		sqlSession.update("com.kosta.finalproject.dao.RRBoardMapper.setRPBstatus", vo);

	}

	public List<RPboardVO> SelectCalc(SearchVO vo) {

		return sqlSession.selectList("com.kosta.finalproject.dao.RRBoardMapper.SelectCalc", vo);
	}

	public void setRRStatus(RRboardVO vo) {

		sqlSession.update("com.kosta.finalproject.dao.RRBoardMapper.setRRStatus", vo);
	}

	@Override
	public void setRPBtask() {

		sqlSession.update("com.kosta.finalproject.dao.RRBoardMapper.setRPBtask");
	}

	@Override
	public void setRRtask() {

		sqlSession.update("com.kosta.finalproject.dao.RRBoardMapper.setRRtask");
	}

	public List<RPboardVO> myRentlist(String session_id) {

		return sqlSession.selectList("com.kosta.finalproject.dao.RRBoardMapper.myRentlist", session_id);

	}

	public List<RRboardVO> myRoomlist(String session_id) {

		return sqlSession.selectList("com.kosta.finalproject.dao.RRBoardMapper.myRoomlist", session_id);

	}

	public void RRBupdate(RRboardVO vo) {
		sqlSession.update("com.kosta.finalproject.dao.RRBoardMapper.RRBupdate", vo);
	}

	public RRboardVO getMain(String string) {
		return sqlSession.selectOne("com.kosta.finalproject.dao.RRBoardMapper.getMain", string);
	}

	// �˻�
	@Override
	public ArrayList<RRboardVO> pselectPlace(String packageStatus, String word) {
		ArrayList<RRboardVO> result = new ArrayList<RRboardVO>();
		RRBoardMapper mapper = sqlSession.getMapper(RRBoardMapper.class);
		RRboardVO vo = new RRboardVO();
		vo.setWord(word);
		vo.setPackageStatus(packageStatus);
		result = mapper.pselectPlace(vo);
		return result;
	}

}