package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.ProductAdminDAO;
import kr.ac.kopo.vo.ProductVO;

@Service
public class ProductAdminService {
	@Autowired
	private ProductAdminDAO productAdminDAO;
	
	public List<Map<String,Object>> productList(){
		List<Map<String, Object>> productList = productAdminDAO.productList();
		return productList;
	}
	
	public int deleteproduct(String savingCode) {
		return productAdminDAO.deleteproduct(savingCode);
	}
	
	public ProductVO getProduct(int savingCode){
		ProductVO productVo = productAdminDAO.getProduct(savingCode);
		return productVo;
	}
	
	public int updateProduct(ProductVO productVo) {
		return productAdminDAO.updateProduct(productVo);
	}
	
	public int insertProduct(ProductVO productVO) {
		return productAdminDAO.insertProduct(productVO);
	}
}
