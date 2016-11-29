package com.kosta.finalproject.vo;

/*
codeNum int, 글번호
category varchar, 카테고리
title varchar, 제목
startDate date, 시작일
endDate date, 끝일
contents varchar, 내용
bill int, 대여비
deposit int, 보증금
packageStatus varchar, 상태 
img varchar 이미지
reaquestId varchar, 
registerId varchar
company varchar
*/

public class RegisterBoardVO {
	
	private int codeNum, bill, deposit;
	private String category, title, contents, packageStatus, varchar, reaquestId, registerId, company, startDate, endDate, userstartDate, userendDate, img;
	
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getPackageStatus() {
		return packageStatus;
	}
	public void setPackageStatus(String packageStatus) {
		this.packageStatus = packageStatus;
	}
	public String getVarchar() {
		return varchar;
	}
	public void setVarchar(String varchar) {
		this.varchar = varchar;
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
	public String getReaquestId() {
		return reaquestId;
	}
	public void setReaquestId(String reaquestId) {
		this.reaquestId = reaquestId;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getRegisterId() {
		return registerId;
	}
	public void setRegisterId(String registerId) {
		this.registerId = registerId;
	}
}
