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

import kr.ac.kopo.service.ChallengeService;
import kr.ac.kopo.service.MemberService;
import kr.ac.kopo.vo.ChallengeVO;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.ReportVO;

@Controller
public class ChallengeController {

	@Autowired
	private ChallengeService challengeService;
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/challenge")
	public String challenge(HttpServletRequest req, Model model, @ModelAttribute ReportVO report, ChallengeVO challenge,
			HttpSession session) {
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String id = req.getParameter("id");

		year = "2022";
		month = "9";
	

		MemberVO member = (MemberVO) session.getAttribute("loginVO");
		if(member == null) {
			return "/member/redirect";
		}
		id = member.getId();

		List<Map<String, Object>> sum = challengeService.sum(year, month, id);
		List<Map<String,Object>> selectAccount = challengeService.selectAccount(id);	
		List<ChallengeVO> challengeList = challengeService.getChallengeList(id); 
		List<MemberVO> memberList = memberService.getUserList();
		int memberIndex = -1;
		
		for(MemberVO memverVO : memberList) {
			if(memverVO.getId().equals(id)) {
				memberIndex = memberList.indexOf(memverVO);
			}
		}
		memberList.remove(memberIndex);
		
		model.addAttribute("challengeList", challengeList); 
		model.addAttribute("selectAccount", selectAccount);
		model.addAttribute("sum", sum);
		model.addAttribute("memberList", memberList);

		System.out.println("challengesum : " + sum);
		System.out.println("challengelist : "+ challengeList);
		return "/challenge/challenge";
	}

	@PostMapping("/challenge/proc")
	public String challengeProc(@ModelAttribute("challengeVO") ChallengeVO challenge, BindingResult result, Model model,
			HttpSession session) {
		
		if (result.hasErrors()) {
			System.out.println("error");
			return "challenge/challengeProc";
		} else {
			MemberVO member = (MemberVO) session.getAttribute("loginVO");
			String id = member.getId();
			challenge.setId(id);

			int serviceResult = challengeService.insertChallenge(challenge);
			
			model.addAttribute("result", serviceResult);
			model.addAttribute("challengeType", challenge.getChallengeType());
			model.addAttribute("friendId",challenge.getFriendId());
			
			System.out.println("insertresult" + result);
			return "challenge/challengeProc";
		}
	}
	
	@RequestMapping("/challengeAccept")
	public String challengeAccept(HttpServletRequest req, Model model, @ModelAttribute ReportVO report, ChallengeVO challenge,
			HttpSession session) {
		
		MemberVO member = (MemberVO) session.getAttribute("loginVO");
		if(member == null) {
			return "/member/redirect";
		}
		String id = member.getId();

		List<ChallengeVO> challengeList = challengeService.getFriendChallengeList(id); 
		
		model.addAttribute("challengeList", challengeList); 

		System.out.println("challengelistff : "+ challengeList);
		return "/challenge/challengeAccept";
	}
	
	@PostMapping("/challengeUpdate")
	public String challengeUpdate(HttpServletRequest req, Model model, @ModelAttribute("challengeVO") ChallengeVO challenge, ReportVO report, BindingResult result,
			HttpSession session) {
		
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String id = req.getParameter("id");
		
		year = "2022";
		month = "9";
		
		MemberVO member = (MemberVO) session.getAttribute("loginVO");
		if(member == null) {
			return "/member/redirect";
		}
		id = member.getId();
		
		List<Map<String, Object>> sum = challengeService.sum(year, month, id);
		List<Map<String,Object>> selectAccount = challengeService.selectAccount(id);
		
		model.addAttribute("selectAccount", selectAccount);
		model.addAttribute("sum", sum);
		
		if (result.hasErrors()) {
			System.out.println("error");
			return "/challenge/challengeAccept";
		} else {
			int serviceResult = challengeService.updateChallenge(challenge);
			
			model.addAttribute("result", serviceResult);
			System.out.println("result : "+ serviceResult);
			return "/challenge/challengeUpdate";
		}
	}

}
