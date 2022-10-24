package kr.ac.kopo.dao;

import java.util.List;
import java.util.Map;

public interface ReportDAO {

	public List<Map<String,Object>> sum(String year, String month, String id);
	public List<Map<String,Object>> consumeDate(String year, String month, String id);
	public List<Map<String,Object>> consumeStore(String year, String month, String id);
	public List<Map<String, Object>> consumeStats(String year, String month, String id);
}
