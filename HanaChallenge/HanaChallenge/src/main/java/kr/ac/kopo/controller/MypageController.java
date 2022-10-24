package kr.ac.kopo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.service.MypageService;
import kr.ac.kopo.vo.MemberVO;

@Controller
public class MypageController {
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping("/mypage")
	public String mypageAccount(HttpServletRequest req, Model model,
			HttpSession session) {
		String id = req.getParameter("id");
		
		MemberVO member = (MemberVO) session.getAttribute("loginVO");
		id = member.getId();
		
		List<Map<String,Object>> selectAccount = mypageService.selectAccount(id);
		List<Map<String,Object>> joinsavingList = mypageService.joinsavingList(id);
		List<Map<String, Object>> challengeList = mypageService.challengeList(id);
		
		model.addAttribute("selectAccount", selectAccount);
		model.addAttribute("joinsavingList", joinsavingList);
		model.addAttribute("challengeList", challengeList);
		
		System.out.println("selectAccount : " + selectAccount);
		System.out.println("joinsavingList :" + joinsavingList);
		System.out.println("challengeList :" + challengeList );
		
		return "/mypage/mypage";
	}
	

	@RequestMapping("/translist")
	public String translist(Model model, HttpServletRequest req) {
	
		String accountNum = req.getParameter("accountNum");
		
		List<Map<String, Object>> translist = mypageService.transList(accountNum);
		model.addAttribute("translist", translist);
		System.out.println("translist : " + translist );
		return "/mypage/translist";
	}
	
	@RequestMapping("/savingdetail")
	public String savingdetail(Model model, HttpServletRequest req, HttpSession session) {
		String savingCode = req.getParameter("savingCode");
		String id =req.getParameter("id");
		
		MemberVO member = (MemberVO) session.getAttribute("loginVO");
		id = member.getId();
		
		List<Map<String, Object>> savingDetail = mypageService.savingDetail(savingCode, id);
		List<Map<String, Object>> rateChange = mypageService.rateChange(savingCode, id);
		
		model.addAttribute("savingDetail", savingDetail);
		model.addAttribute("rateChange", rateChange);
		System.out.println("savingDetail : " + savingDetail);
		System.out.println("rateChange: " + rateChange);
		
		return "/mypage/savingdetail";
	}
}
