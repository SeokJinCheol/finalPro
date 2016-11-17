package com.kosta.finalproject.vo;

import java.util.Date;

public class WorkTimeVO {
	String empNum;
	Date entertime, exittime;

	public String getEmpNum() {
		return empNum;
	}

	public void setEmpNum(String empNum) {
		this.empNum = empNum;
	}

	public Date getEntertime() {
		return entertime;
	}

	public void setEntertime(Date entertime) {
		this.entertime = entertime;
	}

	public Date getExittime() {
		return exittime;
	}

	public void setExittime(Date exittime) {
		this.exittime = exittime;
	}

}
