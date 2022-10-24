package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ChallengeDAO;
import kr.ac.kopo.vo.ChallengeVO;

@Service
public class ChallengeService {
	
	@Autowired
	private ChallengeDAO challengeDAO;
	
	public List<ChallengeVO> getChallengeList(String id) {
		return challengeDAO.getChallengeList(id);
	}
	
	public List<ChallengeVO> getFriendChallengeList(String id) {
		return challengeDAO.getFriendChallengeList(id);
	}
	
	public int insertChallenge(ChallengeVO challengeVO) {
		return challengeDAO.insertChallenge(challengeVO);
	}
	
	public int updateChallenge(ChallengeVO challengeVO) {
		return challengeDAO.updateChallenge(challengeVO);
	}
	
	public List<Map<String, Object>> sum(String year, String month,  String id){
		List<Map<String, Object>> sum = challengeDAO.sum(year, month, id);
		return sum;
	}
	
	public List<Map<String, Object>> selectAccount(String id){
		List<Map<String,Object>> selectAccount = challengeDAO.selectAccount(id);
		return selectAccount;
	}
}
