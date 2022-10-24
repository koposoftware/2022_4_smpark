package kr.ac.kopo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.service.ProductAdminService;
import kr.ac.kopo.vo.ProductVO;

@Controller
public class productAdminController {
	
	@Autowired
	private ProductAdminService productAdminService;
	
	@RequestMapping("/productAdmin")
	public String productAdmin(HttpServletRequest req, Model model,
			HttpSession session) {
		
		List<Map<String, Object>> productList = productAdminService.productList();
		
		model.addAttribute("productList",productList);
		System.out.println("productListAdmin : " + productList);
		return "admin/productAdmin";
	}
	
	
	@PostMapping("/deleteproduct")
	public String deleteProduct(HttpServletRequest req, Model model, @ModelAttribute("productVO") ProductVO productVO,BindingResult result,HttpSession session ) {
		
		String savingCode = req.getParameter("savingCode");
		
		int deleteproduct = productAdminService.deleteproduct(savingCode);
		model.addAttribute("deleteproduct" , deleteproduct);
		
		return "redirect:/productAdmin";
	}
	
	@RequestMapping("/productAdminUpdate")
	public String productAdminUpdate(HttpServletRequest req, Model model, HttpSession session) {
		String savingCode = req.getParameter("savingCode");
		
		
		if(savingCode == null || savingCode.equals("")) {
			return "redirect:/productAdmin";
		}
		
		int savingCodeInt =  Integer.parseInt(savingCode);
		
		ProductVO produceVo = productAdminService.getProduct(savingCodeInt);
		
		model.addAttribute("product",produceVo);
		
		
		return "admin/productAdminUpdate";
	}
	
	@PostMapping("/productAdminUpdateProc")
	public String productAdminUpdateProc(HttpServletRequest req, Model model, @ModelAttribute("productVO") ProductVO productVO,BindingResult result,HttpSession session ) {
		
		int updateResult = productAdminService.updateProduct(productVO);
		
		return "admin/productAdminUpdateProc";
	}
	
	@RequestMapping("/productAdminInsert")
	public String productAdminInsert() {
		return "admin/productAdminInsert";
	}
	
	@PostMapping("/productAdminInsertProc")
	public String productAdminInsertProc(@ModelAttribute("ProductVO") ProductVO ProductVO,BindingResult result, Model model,
			HttpSession session) {
		
		int insertProduct = productAdminService.insertProduct(ProductVO);
		model.addAttribute("insertProduct", insertProduct);
		return "admin/productAdminInsertProc";
	}
}
