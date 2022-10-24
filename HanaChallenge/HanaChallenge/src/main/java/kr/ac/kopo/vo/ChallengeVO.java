package kr.ac.kopo.vo;

import java.sql.Date;

public class ChallengeVO {
	
	private int challengeNo;
	private String challengeName;
	private int challengeGoal;
	private Date challengeStartDate;
	private Date challengeEndDate;
	private String challengePenaltyRate;
	private String id;
	private String consumeCode;
	private String accountNum;
	private String challengeType;
	private String friendId;
	private String name;
	
	@Override
	public String toString() {
		return "ChallengeVO [challengeNo=" + challengeNo + ", challengeName=" + challengeName + ", challengeGoal="
				+ challengeGoal + ", challengeStartDate=" + challengeStartDate + ", challengeEndDate="
				+ challengeEndDate + ", challengePenaltyRate=" + challengePenaltyRate + ", id=" + id + ", consumeCode="
				+ consumeCode + ", accountNum=" + accountNum + ", challengeType=" + challengeType + ", friendId="
				+ friendId + ", name=" + name + "]";
	}

	public int getChallengeNo() {
		return challengeNo;
	}

	public void setChallengeNo(int challengeNo) {
		this.challengeNo = challengeNo;
	}

	public String getChallengeName() {
		return challengeName;
	}

	public void setChallengeName(String challengeName) {
		this.challengeName = challengeName;
	}

	public int getChallengeGoal() {
		return challengeGoal;
	}

	public void setChallengeGoal(int challengeGoal) {
		this.challengeGoal = challengeGoal;
	}

	public Date getChallengeStartDate() {
		return challengeStartDate;
	}

	public void setChallengeStartDate(Date challengeStartDate) {
		this.challengeStartDate = challengeStartDate;
	}

	public Date getChallengeEndDate() {
		return challengeEndDate;
	}

	public void setChallengeEndDate(Date challengeEndDate) {
		this.challengeEndDate = challengeEndDate;
	}

	public String getChallengePenaltyRate() {
		return challengePenaltyRate;
	}

	public void setChallengePenaltyRate(String challengePenaltyRate) {
		this.challengePenaltyRate = challengePenaltyRate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getConsumeCode() {
		return consumeCode;
	}

	public void setConsumeCode(String consumeCode) {
		this.consumeCode = consumeCode;
	}

	public String getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}

	public String getChallengeType() {
		return challengeType;
	}

	public void setChallengeType(String challengeType) {
		this.challengeType = challengeType;
	}

	public String getFriendId() {
		return friendId;
	}

	public void setFriendId(String friendId) {
		this.friendId = friendId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	


}