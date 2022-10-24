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

import kr.ac.kopo.Util;
import kr.ac.kopo.service.DetailService;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.ReportVO;

@Controller
public class AdminController {

	@Autowired
	private DetailService detailService;

	@RequestMapping("/admin")
	public String admin(HttpServletRequest req, Model model, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("loginVO");
		if(member == null) {
			return "redirect:/login";
		}
		
		if(member.getMember_lv() > 1) {
			return "redirect:/logout";
		}
		
		return "/admin/admin";
	}

	@RequestMapping("/detail")
	public String adminDetail(HttpServletRequest req, Model model, @ModelAttribute ReportVO report, HttpSession session) {
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		
		if(year == null || year.equals("")) {
			year = Util.getStringNowYear();
		}
		if(month == null || month.equals("")) {
			month = Util.getStringNowMonth();
		}
		System.out.println("year : " + year +  "month : " + month);
		
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		
		List<Map<String, Object>> productList = detailService.productList();
		
		model.addAttribute("productList",productList);
		System.out.println("productListdetail : " + productList);
		return "/admin/detail";
	}

}
