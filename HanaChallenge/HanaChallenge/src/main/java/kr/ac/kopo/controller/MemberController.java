package kr.ac.kopo.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import kr.ac.kopo.service.MemberService;
import kr.ac.kopo.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		// spring form tag에서 사용할 memberVO를 공유영역에 등록시키기.
		request.setAttribute("memberVO", new MemberVO());
		
		
		return "member/login";
	}

	// login post, /login
	@PostMapping("/login")
	public String loginPost(@Valid @ModelAttribute("memberVO") MemberVO member, BindingResult result, Model model,
			HttpSession session) {

		System.out.println(result);
		System.out.println(member);
		if (result.hasErrors()) {
			
			return "member/login";

		} else {
			MemberVO Member = memberService.login(member);
			if (Member == null) {
				// id, password 유효하지 않음
				model.addAttribute("loginmsg", "ID와 PASSWORD가 유효하지 않습니다.");
				return "member/login";
			} else {
				session.setAttribute("loginVO", Member);
			}
			System.out.println(Member);			
			
			if(Member.getMember_lv() == 1) {
				return "redirect:/admin";
			}
				
			if(!member.getRedirectPath().equals("")) {
				return "redirect:/" + member.getRedirectPath();
			}
				
			return "redirect:/";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, SessionStatus sessionStatus) {
//		session.invalidate();
		
		sessionStatus.setComplete();
		session.invalidate();
		return "member/logout";
	}
	
	
	

}
