package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MypageDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> selectAccount(String id){
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		
		List<Map<String, Object>> selectAccount = sqlSessionTemplate.selectList("kr.ac.kopo.dao.MypageDAO.selectAccount", param);
	
		return selectAccount;
	}
	
	public List<Map<String, Object>> transList(String accountNum) {
		Map<String, Object> param = new HashMap<>();
		param.put("accountNum", accountNum);
		
		List<Map<String,Object>> transList = sqlSessionTemplate.selectList("kr.ac.kopo.dao.MypageDAO.transList",param);
		
		return transList;
	}
	
	public List<Map<String, Object>> joinsavingList(String id){
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		
		List<Map<String, Object>> joinsavingList = sqlSessionTemplate.selectList("kr.ac.kopo.dao.MypageDAO.joinsavingList", param);
		
		return joinsavingList;
	}
	
	public List<Map<String, Object>> savingDetail(String savingCode, String id){
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("savingCode", savingCode);
		
		List<Map<String, Object>> savingDetail = sqlSessionTemplate.selectList("kr.ac.kopo.dao.MypageDAO.savingDetail",param);
		
		
		return savingDetail;
	}
	
	public List<Map<String, Object>> rateChange(String savingCode, String id){
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("savingCode", savingCode);
		
		List<Map<String, Object>> rateChange = sqlSessionTemplate.selectList("kr.ac.kopo.dao.MypageDAO.rateChange",param);
		
		return rateChange;
	}
	
	public List<Map<String, Object>> challengeList(String id){
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		
		List<Map<String, Object>> challengeList = sqlSessionTemplate.selectList("kr.ac.kopo.dao.MypageDAO.challengeList", param);
		
		return challengeList;
	}
}
