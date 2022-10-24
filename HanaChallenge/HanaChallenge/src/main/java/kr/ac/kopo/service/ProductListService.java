package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ProductListDAO;

@Service
public class ProductListService {
	@Autowired
	private ProductListDAO productlistDAO;
	
	public List<Map<String, Object>> savinglist(){
		List<Map<String, Object>> savinglist = productlistDAO.savinglist();
		return savinglist;
	}
	
	public List<Map<String, Object>> savinglist(String keyword){
		List<Map<String, Object>> savinglist = productlistDAO.savinglist(keyword);
		return savinglist;
	}
	
	public List<Map<String, Object>> categorysavinglist(String consumeCode){
		List<Map<String, Object>> categorysavinglist = productlistDAO.categorysavinglist(consumeCode);
		return categorysavinglist;
	}
	
}
