package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.JoinProductVO;

@Repository
public class JoinProductDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int insertJoinProduct(JoinProductVO joinproductVO) {
		System.out.println("joinproductvo : " + joinproductVO);
		int result = sqlSessionTemplate.insert("kr.ac.kopo.dao.JoinProductDAO.insertJoinProduct", joinproductVO);
		
		return result;
	}
	
	public List<Map<String, Object>> selectAccount(String id){
		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		
		List<Map<String, Object>> selectAccount = sqlSessionTemplate.selectList("kr.ac.kopo.dao.JoinProductDAO.selectAccount", param);
	
		return selectAccount;
	}
	
}
