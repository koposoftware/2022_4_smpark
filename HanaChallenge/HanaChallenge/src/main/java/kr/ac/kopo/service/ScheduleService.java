package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ChallengeDAO;
import kr.ac.kopo.vo.ScheduleVO;

//import net.nurigo.java_sdk.api.Message;
//import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class ScheduleService {
	
	@Autowired
	private ChallengeDAO challengeDAO;
	
	public void sendPenalty(String lastDate) {
		String toDate = lastDate;
		String fromDate = lastDate.substring(0,8) + "01";
		
		//지난달의 실패한 도전 과제 리스트
		List<ScheduleVO> scheduleList = challengeDAO.getPanaltyList(fromDate, toDate);
		
		
		//각 도전 들에서 패널티 금액 이체 & SMS 전송
		for(ScheduleVO sList : scheduleList) {
			sendSMS(sList.getTel(), sList.getName());
		}
		
	}
	
	private void sendSMS(String to, String name) {
		
		String api_key = "NCSF0PI7PMRDAGLC";
	    String api_secret = "5CPFBJQQP21GTSVWYSIFVRD51JKZPUKA";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", to);
	    params.put("from", "01047534861");
	    params.put("type", "SMS");
	    params.put("text", name + "님 10월 쇼핑/뷰티줄이기 도전에 실패하셨습니다.");
	    params.put("app_version", "test app 1.2"); // application name and version

	    JSONObject obj = (JSONObject) coolsms.send(params);
	}
	
}

class Message {
	String api_key;
	String api_secret;
	Message(String api_key, String api_secret) {
		this.api_key = api_key;
		this.api_secret = api_secret;
	}
	
	JSONObject send(HashMap<String, String> param) {
		JSONObject jsonObject = null;
		return jsonObject;
	}
}
