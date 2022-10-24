package kr.ac.kopo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.service.ProductService;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.ProductVO;
import kr.ac.kopo.vo.ReportVO;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/product")
	public String product(HttpServletRequest req, Model model, @ModelAttribute ReportVO report, HttpSession session  ) {
		
		String year = req.getParameter("year");
		String month =req.getParameter("month");
		String id = req.getParameter("id");
		
//		year = Util.getStringNowYear();
//		month = Util.getStringNowMonth();
		
		year = "2022";
		month= "09";
		
		MemberVO member = (MemberVO) session.getAttribute("loginVO");
		id = member.getId();
		
		List<Map<String, Object>> sumList = productService.sumList(year, month, id);
		model.addAttribute("sumList", sumList);
		
		System.out.println("sumList : " + sumList);
		
		return "/product/product";
	}
	
	@RequestMapping("/shoppingProduct")
	public String selectSaving(HttpServletRequest req, Model model, @ModelAttribute ProductVO productVO, HttpSession session ){
		
		List<Map<String, Object>> selectSaving = productService.selectSaving();
		model.addAttribute("selectSaving", selectSaving);
		System.out.println("selectSaving :" + selectSaving);
		
		return "/product/shoppingProduct";
	}

}
