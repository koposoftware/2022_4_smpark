package kr.ac.kopo.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DetailDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> productList(){
		List<Map<String, Object>> productList = sqlSessionTemplate.selectList("kr.ac.kopo.dao.DetailDAO.productList");
		return productList;
	}
}
