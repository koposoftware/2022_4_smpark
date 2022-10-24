package kr.ac.kopo;

import java.time.LocalDate;

public class Util {
	public static String getStringNowYear() {
		LocalDate now = LocalDate.now();
		return "" + now.getYear();
	}
	
	public static String getStringNowMonth() {
		LocalDate now = LocalDate.now();
		return "" + now.getMonthValue();
	}
	
	public static String getStringNowDay() {
		LocalDate now = LocalDate.now();
		return "" + now.getDayOfMonth();
	}
	
}