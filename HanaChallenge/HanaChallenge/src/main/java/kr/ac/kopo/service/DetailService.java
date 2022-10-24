package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.DetailDAO;

@Service
public class DetailService {
	@Autowired
	private DetailDAO detailDAO;
	
	public List<Map<String,Object>> productList(){
		List<Map<String, Object>> productList = detailDAO.productList();
		return productList;
	}
}
