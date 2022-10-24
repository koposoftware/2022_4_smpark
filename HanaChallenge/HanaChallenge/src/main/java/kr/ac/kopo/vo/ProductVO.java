package kr.ac.kopo.vo;

import java.sql.Date;

public class ProductVO {

    private int savingCode;
    private String savingName;
    private String savingDetail;
    private int minAmount;
    private int maxAmount;
    private int minAge;
    private int maxAge;
    private String consumeCode;
    private String minPeriod;
    private String maxPeriod;
    private float baseRate;
    private float primeRate;
    private Date addDate;
    private String favoriteYn;
    
	@Override
	public String toString() {
		return "ProductVO [savingCode=" + savingCode + ", savingName=" + savingName + ", savingDetail=" + savingDetail
				+ ", minAmount=" + minAmount + ", maxAmount=" + maxAmount + ", minAge=" + minAge + ", maxAge=" + maxAge
				+ ", consumeCode=" + consumeCode + ", minPeriod=" + minPeriod + ", maxPeriod=" + maxPeriod
				+ ", baseRate=" + baseRate + ", primeRate=" + primeRate + ", addDate=" + addDate + ", favoriteYn="
				+ favoriteYn + "]";
	}

	public int getSavingCode() {
		return savingCode;
	}

	public void setSavingCode(int savingCode) {
		this.savingCode = savingCode;
	}

	public String getSavingName() {
		return savingName;
	}

	public void setSavingName(String savingName) {
		this.savingName = savingName;
	}

	public String getSavingDetail() {
		return savingDetail;
	}

	public void setSavingDetail(String savingDetail) {
		this.savingDetail = savingDetail;
	}

	public int getMinAmount() {
		return minAmount;
	}

	public void setMinAmount(int minAmount) {
		this.minAmount = minAmount;
	}

	public int getMaxAmount() {
		return maxAmount;
	}

	public void setMaxAmount(int maxAmount) {
		this.maxAmount = maxAmount;
	}

	public int getMinAge() {
		return minAge;
	}

	public void setMinAge(int minAge) {
		this.minAge = minAge;
	}

	public int getMaxAge() {
		return maxAge;
	}

	public void setMaxAge(int maxAge) {
		this.maxAge = maxAge;
	}

	public String getConsumeCode() {
		return consumeCode;
	}

	public void setConsumeCode(String consumeCode) {
		this.consumeCode = consumeCode;
	}

	public String getMinPeriod() {
		return minPeriod;
	}

	public void setMinPeriod(String minPeriod) {
		this.minPeriod = minPeriod;
	}

	public String getMaxPeriod() {
		return maxPeriod;
	}

	public void setMaxPeriod(String maxPeriod) {
		this.maxPeriod = maxPeriod;
	}

	public float getBaseRate() {
		return baseRate;
	}

	public void setBaseRate(float baseRate) {
		this.baseRate = baseRate;
	}

	public float getPrimeRate() {
		return primeRate;
	}

	public void setPrimeRate(float primeRate) {
		this.primeRate = primeRate;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public String getFavoriteYn() {
		return favoriteYn;
	}

	public void setFavoriteYn(String favoriteYn) {
		this.favoriteYn = favoriteYn;
	}


	
	
    
	
    
}

