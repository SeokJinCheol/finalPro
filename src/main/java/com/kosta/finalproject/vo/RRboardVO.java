package com.kosta.finalproject.vo;

public class RRboardVO {

	int codeNum, bill;
	String category, title, contents, adress, spotNum, packageStatus, img, reaquestId, registerId, company;
	String startDate, endDate, userstartDate, userendDate, word;

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
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

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getSpotNum() {
		return spotNum;
	}

	public void setSpotNum(String spotNum) {
		this.spotNum = spotNum;
	}

	public String getPackageStatus() {
		return packageStatus;
	}

	public void setPackageStatus(String packageStatus) {
		this.packageStatus = packageStatus;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getReaquestId() {
		return reaquestId;
	}

	public void setReaquestId(String reaquestId) {
		this.reaquestId = reaquestId;
	}

	public String getRegisterId() {
		return registerId;
	}

	public void setRegisterId(String registerId) {
		this.registerId = registerId;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
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

	@Override
	public String toString() {
		return "RRboardVO [codeNum=" + codeNum + ", bill=" + bill + ", category=" + category + ", title=" + title
				+ ", contents=" + contents + ", adress=" + adress + ", spotNum=" + spotNum + ", packageStatus="
				+ packageStatus + ", img=" + img + ", reaquestId=" + reaquestId + ", registerId=" + registerId
				+ ", company=" + company + ", startDate=" + startDate + ", endDate=" + endDate + ", userstartDate="
				+ userstartDate + ", userendDate=" + userendDate + "]";
	}

}
