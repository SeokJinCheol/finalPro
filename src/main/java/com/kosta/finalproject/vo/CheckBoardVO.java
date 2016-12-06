package com.kosta.finalproject.vo;

public class CheckBoardVO {
	private int codeNum, bill, deposit;
	private String startDate, endDate, userstartDate, userendDate, resister, rentter, packageStatus;

	public int getCodeNum() {
		return codeNum;
	}

	public void setCodeNum(int codeNum) {
		this.codeNum = codeNum;
	}

	public int getBill() {
		return bill;
	}

	public void setBill(int bill) {
		this.bill = bill;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getUserstartDate() {
		return userstartDate;
	}

	public void setUserstartDate(String userstartDate) {
		this.userstartDate = userstartDate;
	}

	public String getUserendDate() {
		return userendDate;
	}

	public void setUserendDate(String userendDate) {
		this.userendDate = userendDate;
	}

	public String getResister() {
		return resister;
	}

	public void setResister(String resister) {
		this.resister = resister;
	}

	public String getRentter() {
		return rentter;
	}

	public void setRentter(String rentter) {
		this.rentter = rentter;
	}

	public String getPackageStatus() {
		return packageStatus;
	}

	public void setPackageStatus(String packageStatus) {
		this.packageStatus = packageStatus;
	}
}