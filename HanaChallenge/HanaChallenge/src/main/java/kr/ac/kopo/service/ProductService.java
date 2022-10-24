package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ProductDAO;

@Service
public class ProductService {

	 @Autowired
	 private ProductDAO productDAO;
	 
	 public List<Map<String, Object>> sumList(String year, String month, String id){
		 List<Map<String, Object>> sumList = productDAO.sumList(year, month, id);
		 return sumList;
	 }
	 
	 public List<Map<String, Object>> selectSaving(){
		 List<Map<String, Object>> selectSaving = productDAO.selectSaving();
		 return selectSaving;
	 }
}
