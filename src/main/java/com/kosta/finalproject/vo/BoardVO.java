package com.kosta.finalproject.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

//VO_Test
public class BoardVO {
	int bNum, bgnum, groupnum, ranknum;
	String title, contents, id, img, category;
	int startRow, endRow, readcount;
	@JsonFormat(pattern = "yyyy-MM-dd")
	Timestamp bDate;

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public Timestamp getbDate() {
		return bDate;
	}

	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public int getBgnum() {
		return bgnum;
	}

	public void setBgnum(int bgnum) {
		this.bgnum = bgnum;
	}

	public int getGroupnum() {
		return groupnum;
	}

	public void setGroupnum(int groupnum) {
		this.groupnum = groupnum;
	}

	public int getRanknum() {
		return ranknum;
	}

	public void setRanknum(int ranknum) {
		this.ranknum = ranknum;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
}