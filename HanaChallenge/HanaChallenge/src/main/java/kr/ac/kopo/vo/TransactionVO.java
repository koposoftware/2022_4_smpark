package kr.ac.kopo.vo;

public class TransactionVO {
	
	private String myAccount;
	private int myBalance;
	private int transNo;
	private String transType;
	private String targetName;
	private int transAmount;
	private String transDate;
	private String targetAccount;
	private String targetBank;
	private String myName;
	private String myBank;
	
	@Override
	public String toString() {
		return "TransactionVO [myAccount=" + myAccount + ", myBalance=" + myBalance + ", transNo=" + transNo
				+ ", transType=" + transType + ", targetName=" + targetName + ", transAmount=" + transAmount
				+ ", transDate=" + transDate + ", targetAccount=" + targetAccount + ", targetBank=" + targetBank
				+ ", myName=" + myName + ", myBank=" + myBank + "]";
	}

	public String getMyAccount() {
		return myAccount;
	}

	public void setMyAccount(String myAccount) {
		this.myAccount = myAccount;
	}

	public int getMyBalance() {
		return myBalance;
	}

	public void setMyBalance(int myBalance) {
		this.myBalance = myBalance;
	}

	public int getTransNo() {
		return transNo;
	}

	public void setTransNo(int transNo) {
		this.transNo = transNo;
	}

	public String getTransType() {
		return transType;
	}

	public void setTransType(String transType) {
		this.transType = transType;
	}

	public String getTargetName() {
		return targetName;
	}

	public void setTargetName(String targetName) {
		this.targetName = targetName;
	}

	public int getTransAmount() {
		return transAmount;
	}

	public void setTransAmount(int transAmount) {
		this.transAmount = transAmount;
	}

	public String getTransDate() {
		return transDate;
	}

	public void setTransDate(String transDate) {
		this.transDate = transDate;
	}

	public String getTargetAccount() {
		return targetAccount;
	}

	public void setTargetAccount(String targetAccount) {
		this.targetAccount = targetAccount;
	}

	public String getTargetBank() {
		return targetBank;
	}

	public void setTargetBank(String targetBank) {
		this.targetBank = targetBank;
	}

	public String getMyName() {
		return myName;
	}

	public void setMyName(String myName) {
		this.myName = myName;
	}

	public String getMyBank() {
		return myBank;
	}

	public void setMyBank(String myBank) {
		this.myBank = myBank;
	}
	
	
	
}
