package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmailController {
	
	//private EmailService emailService;
	@RequestMapping("/email")
	public String email(){
		return "admin/email";
	}
}
