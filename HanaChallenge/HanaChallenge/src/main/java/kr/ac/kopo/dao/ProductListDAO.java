package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductListDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> savinglist(){
		List<Map<String, Object>> savinglist = sqlSessionTemplate.selectList("kr.ac.kopo.dao.ProductListDAO.savinglist");
		return savinglist;
	}
	
	public List<Map<String, Object>> savinglist(String keyword){
		Map<String, Object> param = new HashMap<>();
		param.put("keyword", keyword);
		
		List<Map<String, Object>> savinglist = sqlSessionTemplate.selectList("kr.ac.kopo.dao.ProductListDAO.savinglist", param);
		return savinglist;
	}
	
	public List<Map<String, Object>> categorysavinglist(String consumeCode){
		List<Map<String, Object>> categorysavinglist = sqlSessionTemplate.selectList("kr.ac.kopo.dao.ProductListDAO.categorysavinglist");
		return categorysavinglist;
	}
	
	
}
