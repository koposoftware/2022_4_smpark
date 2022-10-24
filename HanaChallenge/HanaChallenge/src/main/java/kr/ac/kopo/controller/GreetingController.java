package kr.ac.kopo.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.HtmlUtils;

import kr.ac.kopo.vo.Greeting;
import kr.ac.kopo.vo.HelloMessage;

@Controller
public class GreetingController {
	@MessageMapping("/hello")	// 요청을 받는 곳
	@SendTo("/topic/greetings")	// 괄호 안의 메시지 브로커에 return 값을 보낸다.
	public Greeting greeting(HelloMessage message) throws Exception {
		Thread.sleep(1000);		// 수동 딜레이
		//return new Greeting("Hello, " + HtmlUtils.htmlEscape(message.getName()) + "!");
		return new Greeting(HtmlUtils.htmlEscape(message.getName()));
	}
	
	@MessageMapping("/second")	// 요청을 받는 곳
	@SendTo("/topic/second")	// 괄호 안의 메시지 브로커에 return 값을 보낸다.
	public Greeting second(HelloMessage message) throws Exception {
		Thread.sleep(1000);		// 수동 딜레이
		//return new Greeting("Hello, " + HtmlUtils.htmlEscape(message.getName()) + "!");
		return new Greeting(HtmlUtils.htmlEscape(message.getName()));
	}
    
    @RequestMapping("/websocket")
	public String websocket() {
		return "/websocket";
	}
    
    @RequestMapping("/websocket2")
	public String websocket2() {
		return "/websocket2";
	}
}
