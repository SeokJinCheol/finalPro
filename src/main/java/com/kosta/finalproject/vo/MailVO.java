package com.kosta.finalproject.vo;

public class MailVO {
	
	private String sid, rid, text;
	private int mailNum;

	public int getMailNum() {
		return mailNum;
	}

	public void setMailNum(int mailNum) {
		this.mailNum = mailNum;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}