package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> sumList(String year, String month, String id) {
		Map<String, Object> param = new HashMap<>();
        param.put("year", year);
        param.put("month", month);
        param.put("id", id);
        
		List<Map<String,Object>> sumList = sqlSessionTemplate.selectList("kr.ac.kopo.dao.ProductDAO.sumList", param);
		
		return sumList;
	}
	
	public List<Map<String, Object>> selectSaving(){
		
		List<Map<String, Object>> selectSaving = sqlSessionTemplate.selectList("kr.ac.kopo.dao.ProductDAO.selectSaving");
		return selectSaving;
	}

}
