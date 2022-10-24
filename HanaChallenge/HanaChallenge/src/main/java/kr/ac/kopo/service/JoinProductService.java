package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.JoinProductDAO;
import kr.ac.kopo.vo.JoinProductVO;

@Service
public class JoinProductService {
	@Autowired
	private JoinProductDAO joinproductDAO;
	
	public int insertJoinProduct(JoinProductVO joinproductVO) {
		return joinproductDAO.insertJoinProduct(joinproductVO);
	}
	
	public List<Map<String, Object>> selectAccount(String id){
		List<Map<String,Object>> selectAccount = joinproductDAO.selectAccount(id);
		return selectAccount;
	}
	
}
