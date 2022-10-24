package kr.ac.kopo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.service.ProductListService;

@Controller
public class ProductListController {
	
	@Autowired
	private ProductListService productlistservice;
	
	@RequestMapping("/productList")
	public String produclist(HttpServletRequest req, Model model,
			HttpSession session) {
		
		String keyword = req.getParameter("keyword");
		List<Map<String, Object>> savinglist;
		
		if(keyword == null || keyword == "") {
			savinglist = productlistservice.savinglist();
		} else {
			savinglist = productlistservice.savinglist(keyword);
		}
		int size = savinglist.size();
		
		model.addAttribute("savinglist", savinglist);
		model.addAttribute("size", size);
		
		System.out.println("savinglist : " + savinglist);
		System.out.println("size : " + size);
		return "/product/productList";
	}
	
	@RequestMapping("/productList/consumeCode")
	public String categorysavinglist(HttpServletRequest req, Model model,
			HttpSession session) {
		
		String consumeCode = req.getParameter("consumeCode");
		
		List<Map<String, Object>> categorysavinglist = productlistservice.categorysavinglist(consumeCode);
		int count = categorysavinglist.size();
		
		model.addAttribute("categorysavinglist", categorysavinglist);
		model.addAttribute("count", count);
		
		System.out.println("categorysavinglist : " + categorysavinglist);
		
		return "/product/productlist";
	}
	

	
}
