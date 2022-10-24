package kr.ac.kopo.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.Util;
import kr.ac.kopo.service.ReportService;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.ReportVO;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService reportService;
	
	/*
	 * @RequestMapping("/report") public String report() { return "report/report"; }
	 */
	
	@RequestMapping("/report")
	public String report(HttpServletRequest req, Model model, @ModelAttribute ReportVO report, HttpSession session) {
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String id = req.getParameter("id");
		
		if(year == null || year.equals("")) {
			year = Util.getStringNowYear();
		}
		if(month == null || month.equals("")) {
			month = Util.getStringNowMonth();
		}
		
		MemberVO member = (MemberVO) session.getAttribute("loginVO");
		System.out.println("userid : " + member);
		id= member.getId();
		
		
		List<Map<String, Object>> sum = reportService.sum(year, month, id);
		for(Map<String,Object> data : sum) {
			Set<String> keys = data.keySet();
			for(String key:keys) {
				
			}
		}
		
		List<Map<String, Object>> consumeDate = reportService.consumeDate(year, month, id);
		for(Map<String, Object> data : consumeDate ) {
			Set<String> keys = data.keySet();
			for(String key : keys) {
				
			}
		}
		
		List<Map<String, Object>> consumeStore = reportService.consumeStore(year, month, id);
		for(Map<String, Object> data : consumeDate) {
			Set<String> keys = data.keySet();
			for(String key : keys) {
				
			}
		}
		
		List<Map<String, Object>> consumeStats = reportService.consumeStats(year, month, id);
		for(Map<String, Object> data : consumeStats)
		
		model.addAttribute("sum", sum);
		model.addAttribute("consumeDate",consumeDate);
		model.addAttribute("consumeStore",consumeStore);
		model.addAttribute("consumeStats",consumeStats);
		
		System.out.println("date : " + consumeDate);
		return "report/report";
		
	}
	

	
	
	
}
