package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDaoImp implements ReportDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Map<String, Object>> sum(String year, String month, String id) {
		Map<String, Object> param = new HashMap<>();
        param.put("year", year);
        param.put("month", month);
        param.put("id", id);
        
		List<Map<String,Object>> sum = sqlSessionTemplate.selectList("kr.ac.kopo.dao.ReportDAO.sum", param);
		
		return sum;
	}

	@Override
	public List<Map<String, Object>> consumeDate(String year, String month, String id){
		Map<String, Object> param = new HashMap<>();
		param.put("year", year);
		param.put("month", month);
		param.put("id", id);
		
		List<Map<String,Object>> consumeDate = sqlSessionTemplate.selectList("kr.ac.kopo.dao.ReportDAO.consumeDate",param);
		
		return consumeDate;
	}
	
	@Override
	public List<Map<String, Object>> consumeStore(String year, String month, String id){
		Map<String, Object> param = new HashMap<>();
		param.put("year", year);
		param.put("month", month);
		param.put("id", id);
		
		List<Map<String, Object>> consumeStore = sqlSessionTemplate.selectList("kr.ac.kopo.dao.ReportDAO.consumeStore", param);
		
		return consumeStore;
	}
	
	@Override
	public List<Map<String, Object>> consumeStats(String year, String month, String id){
		Map<String,Object> param = new HashMap<>();
		param.put("year", year);
		param.put("month", month);
		param.put("id", id);
		
		List<Map<String, Object>> consumeStats = sqlSessionTemplate.selectList("kr.ac.kopo.dao.ReportDAO.consumeStats", param);
		
		return consumeStats;
	}
}
