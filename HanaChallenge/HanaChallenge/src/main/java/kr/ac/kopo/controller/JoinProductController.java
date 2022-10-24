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

import kr.ac.kopo.service.JoinProductService;
import kr.ac.kopo.vo.JoinProductVO;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.ProductVO;

@Controller
public class JoinProductController {
	
	@Autowired
	private JoinProductService joinproductService;
	
	@RequestMapping("/shoppingProductJoin1")
	public String joinproduct(HttpServletRequest req, Model model,
			@ModelAttribute JoinProductVO joinproduct, ProductVO product, HttpSession session ) {
		
		String id = req.getParameter("id");
		
		MemberVO member = (MemberVO) session.getAttribute("loginVO");
		id = member.getId();
		
		return "/product/shoppingProductJoin1";
	}
	
	@RequestMapping("/shoppingProductJoin2")
	public String joinproduct(HttpServletRequest req, Model model,
			@ModelAttribute JoinProductVO joinproduct, HttpSession session ) {
		
		String id = req.getParameter("id");
		
		MemberVO member = (MemberVO) session.getAttribute("loginVO");
		id = member.getId();
		
		List<Map<String,Object>> selectAccount = joinproductService.selectAccount(id);
		model.addAttribute("selectAccount", selectAccount);
		System.out.println("selectAccount : " + selectAccount );
		return "/product/shoppingProductJoin2";
	}
	
	@PostMapping("/shoppingProductJoinProc")
	public String shoppingProductJoinProc(@ModelAttribute("JoinProductVO") JoinProductVO JoinProduct, BindingResult result, Model model,
			HttpSession session) {
		
		if (result.hasErrors()) {
			System.out.println("error");
			return "/product/shoppingProductJoinProc";
		} else {
			MemberVO member = (MemberVO) session.getAttribute("loginVO");
			String id = member.getId();
			JoinProduct.setId(id);

			int serviceResult = joinproductService.insertJoinProduct(JoinProduct);
			
			model.addAttribute("result", serviceResult);
			return "/product/shoppingProductJoinProc";
		}
	}
}
