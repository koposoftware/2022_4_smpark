package kr.ac.kopo;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.ac.kopo.service.ScheduleService;

/*
*           *　　　　　　*　　　　　　*　　　　　　*　　　　　　*
초(0-59)   분(0-59)　　시간(0-23)　　일(1-31)　　월(1-12)　　요일(0-7)
*/

@Component
public class Scheduler {
	@Autowired
	ScheduleService scheduleService;
	
	@Scheduled(cron = "* * * 1 * *") //매월 1일 실행
	//@Scheduled(cron = "30 * * * * *") //30초마다 실행되게 테스트
	public void cronJobSch() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate now = LocalDate.now();
		LocalDate lastMonthLastDay = now.withDayOfMonth(1).minusDays(1);
		String nowSTring = lastMonthLastDay.format(formatter);
		
		System.out.println(nowSTring);
		
		scheduleService.sendPenalty(nowSTring);
   }
}