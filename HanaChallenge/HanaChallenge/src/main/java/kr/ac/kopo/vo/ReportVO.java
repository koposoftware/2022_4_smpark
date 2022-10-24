package kr.ac.kopo.vo;

import java.sql.Date;

public class ReportVO {
	
	private int consumeNo;
	private int consumeAmount;
	private Date consumeDate;
	private String consumeStore;
	private String consumeCode;
	private String id;
	
	
	@Override
	public String toString() {
		return "ReportVO [consumeNo=" + consumeNo + ", consumeAmount=" + consumeAmount + ", consumeDate=" + consumeDate
				+ ", consumeStore=" + consumeStore + ", consumeCode=" + consumeCode + ", id=" + id + "]";
	}


	public int getConsumeNo() {
		return consumeNo;
	}


	public void setConsumeNo(int consumeNo) {
		this.consumeNo = consumeNo;
	}


	public int getConsumeAmount() {
		return consumeAmount;
	}


	public void setConsumeAmount(int consumeAmount) {
		this.consumeAmount = consumeAmount;
	}


	public Date getConsumeDate() {
		return consumeDate;
	}


	public void setConsumeDate(Date consumeDate) {
		this.consumeDate = consumeDate;
	}


	public String getConsumeStore() {
		return consumeStore;
	}


	public void setConsumeStore(String consumeStore) {
		this.consumeStore = consumeStore;
	}


	public String getConsumeCode() {
		return consumeCode;
	}


	public void setConsumeCode(String consumeCode) {
		this.consumeCode = consumeCode;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
	
	
	

}
