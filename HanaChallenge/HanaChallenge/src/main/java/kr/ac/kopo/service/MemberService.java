package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberVO login(MemberVO member) {
		return memberDAO.selectUser(member);
	}
	
	public List<MemberVO> getUserList() {
		return memberDAO.getUserList();
	}
	
	public List<Map<String, Object>> test(){
		List<Map<String,Object>> list = memberDAO.test();
		
		return list;
		
	}
}
