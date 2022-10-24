package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.ChallengeVO;
import kr.ac.kopo.vo.ScheduleVO;

@Repository
public class ChallengeDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ChallengeVO> getChallengeList(String id) {
		Map<String, Object> param = new HashMap<>();
        param.put("id", id);
		
		List<ChallengeVO> list = sqlSessionTemplate.selectList("kr.ac.kopo.dao.ChallengeDAO.getChallengeList", param);
		
		return list;
	}
	
	public List<ChallengeVO> getFriendChallengeList(String id) {
		Map<String, Object> param = new HashMap<>();
        param.put("id", id);
		
		List<ChallengeVO> list = sqlSessionTemplate.selectList("kr.ac.kopo.dao.ChallengeDAO.getFriendChallengeList", param);
		System.out.println("list : " + list);
		return list;
	}
	
	public int insertChallenge(ChallengeVO challengeVO) {
		System.out.println("challengevo : " + challengeVO);
		int result = sqlSessionTemplate.insert("kr.ac.kopo.dao.ChallengeDAO.insertChallenge", challengeVO);
		
		return result;
	}
	
	public int updateChallenge(ChallengeVO challengeVO) {
		int result = sqlSessionTemplate.update("kr.ac.kopo.dao.ChallengeDAO.updateChallenge", challengeVO);
		
		return result;
	}
	
	public List<Map<String, Object>> sum(String year, String month, String id) {
		Map<String, Object> param = new HashMap<>();
        param.put("year", year);
        param.put("month", month);
        param.put("id", id);
        
		List<Map<String,Object>> sum = sqlSessionTemplate.selectList("kr.ac.kopo.dao.ChallengeDAO.sumChallenge", param);
		
		return sum;
	}
	
	public List<Map<String, Object>> selectAccount(String id){
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		
		List<Map<String, Object>> selectAccount = sqlSessionTemplate.selectList("kr.ac.kopo.dao.ChallengeDAO.selectAccount", param);
	
		return selectAccount;
	}
	
	public List<ScheduleVO> getPanaltyList(String fromDate, String toDate) {
		Map<String, Object> param = new HashMap<>();
        param.put("fromDate", fromDate);
        param.put("toDate", toDate);
		
		List<ScheduleVO> list = sqlSessionTemplate.selectList("kr.ac.kopo.dao.ChallengeDAO.getPanaltyList", param);
		System.out.println("list : " + list);
		return list;
	}
}
