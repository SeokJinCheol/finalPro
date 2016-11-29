package com.kosta.finalproject.vo;

public class MailVO {

	private String sid, rid, text, senddate;
	private int mailNum;

	public int getMailNum() {
		return mailNum;
	}

	public String getSenddate() {
		return senddate;
	}

	public void setSenddate(String senddate) {
		this.senddate = senddate;
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
