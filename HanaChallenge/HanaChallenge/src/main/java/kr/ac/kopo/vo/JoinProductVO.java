package kr.ac.kopo.vo;

import java.sql.Date;

public class JoinProductVO {
	
	private String id;
	private String savingCode;
	private Date startDate;
	private Date endDate;
	private String period;
	private float interestRate;
	private int joinAmount;
	private int collectAmount;
	private String accountNum;
	
	@Override
	public String toString() {
		return "JoinProductVO [id=" + id + ", savingCode=" + savingCode + ", startDate=" + startDate + ", endDate="
				+ endDate + ", period=" + period + ", interestRate=" + interestRate + ", joinAmount=" + joinAmount
				+ ", collectAmount=" + collectAmount + ", accountNum=" + accountNum + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSavingCode() {
		return savingCode;
	}

	public void setSavingCode(String savingCode) {
		this.savingCode = savingCode;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public float getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(float interestRate) {
		this.interestRate = interestRate;
	}

	public int getJoinAmount() {
		return joinAmount;
	}

	public void setJoinAmount(int joinAmount) {
		this.joinAmount = joinAmount;
	}

	public int getCollectAmount() {
		return collectAmount;
	}

	public void setCollectAmount(int collectAmount) {
		this.collectAmount = collectAmount;
	}

	public String getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}
	
	
	
	
	
}
