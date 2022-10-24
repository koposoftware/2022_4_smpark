package kr.ac.kopo.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.ChallengeVO;
import kr.ac.kopo.vo.MemberVO;

@Repository
public class MemberDaoImp implements MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	
	@Override
	public MemberVO selectUser(MemberVO memberVO) {
		return null;
	}
	
	@Override
	public List<MemberVO> getUserList() {
		List<MemberVO> list = sqlSessionTemplate.selectList("kr.ac.kopo.dao.MemberDAO.selectUserList");
		return list;
	}

	
	@Override
	public List<Map<String, Object>> test() {
		List<Map<String,Object>> list = sqlSessionTemplate.selectList("kr.ac.kopo.dao.MemberDAO.test");
		
		return list;
	}

	

}
