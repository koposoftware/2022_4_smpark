package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.vo.ProductVO;

@Repository
public class ProductAdminDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Map<String, Object>> productList(){
		List<Map<String, Object>> productList = sqlSessionTemplate.selectList("kr.ac.kopo.dao.ProductAdminDAO.productList");
		return productList;
	}
	
	public int deleteproduct(String savingCode) {
		int deleteproduct = sqlSessionTemplate.delete("kr.ac.kopo.dao.ProductAdminDAO.deleteproduct", savingCode);
		return deleteproduct;
	}
	
	public ProductVO getProduct(int savingCode){
		Map<String, Object> param = new HashMap<>();
        param.put("savingCode", savingCode);
		ProductVO producVO = sqlSessionTemplate.selectOne("kr.ac.kopo.dao.ProductAdminDAO.getProduct", param);
		return producVO;
	}
	
	public int updateProduct(ProductVO productVO) {
		int updateProduct = sqlSessionTemplate.update("kr.ac.kopo.dao.ProductAdminDAO.updateProduct", productVO);
		return updateProduct;
	}
	
	public int insertProduct(ProductVO productVO) {
		int insertProduct = sqlSessionTemplate.insert("kr.ac.kopo.dao.ProductAdminDAO.insertProduct", productVO);
		return insertProduct;
	}

}
