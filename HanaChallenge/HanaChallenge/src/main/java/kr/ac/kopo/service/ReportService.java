package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ReportDAO;

@Service
public class ReportService {
	
	@Autowired
	private ReportDAO reportDAO;

	public List<Map<String, Object>> sum(String year, String month,  String id){
		List<Map<String,Object>> sum = reportDAO.sum(year, month, id);
		
		return sum;
	}
	
	public List<Map<String, Object>> consumeDate(String year,  String month, String id){
		List<Map<String, Object>> consumeDate = reportDAO.consumeDate(year, month, id);
		
		return consumeDate;
	}
	
	public List<Map<String, Object>> consumeStore(String year, String month, String id){
		List<Map<String, Object>> consumeStore = reportDAO.consumeStore(year, month, id);
		
		return consumeStore;
	}
	
	public List<Map<String, Object>> consumeStats(String year, String month, String id){
		List<Map<String, Object>> consumeStats = reportDAO.consumeStats(year, month, id);
		
		return consumeStats;
	}
}
