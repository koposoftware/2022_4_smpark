package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.MypageDAO;

@Service
public class MypageService {
	@Autowired
	private MypageDAO mypageDAO;
	
	public List<Map<String, Object>> selectAccount(String id){
		List<Map<String,Object>> selectAccount = mypageDAO.selectAccount(id);
		return selectAccount;
	}
	
	public List<Map<String, Object>> transList(String accountNum){
		List<Map<String,Object>> transList = mypageDAO.transList(accountNum);
		
		return transList;
	}
	
	public List<Map<String, Object>> joinsavingList(String id){
		List<Map<String,Object>> joinsavingList = mypageDAO.joinsavingList(id);
		return joinsavingList;
	}
	
	public List<Map<String, Object>> savingDetail(String savingCode, String id){
		List<Map<String, Object>> savingDetail = mypageDAO.savingDetail(savingCode, id);
		return savingDetail;
	}
	
	public List<Map<String, Object>> rateChange(String savingCode, String id){
		List<Map<String, Object>> rateChange = mypageDAO.rateChange(savingCode, id);
		return rateChange;
	}
	
	public List<Map<String, Object>> challengeList(String id){
		List<Map<String,Object>> challengeList = mypageDAO.challengeList(id);
		return challengeList;
	}
}
