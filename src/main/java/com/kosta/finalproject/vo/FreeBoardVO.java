package com.kosta.finalproject.vo;

import java.util.Date;

public class FreeBoardVO {

	private int bnum, bgnum, groupnum, ranknum, count, rnum, startRow, endRow, replyCount;
	private String title, contents, id, img;
	private Date date;
	
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
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
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@Override
	public String toString() {
		return "FreeBoardVO [bnum=" + bnum + ", bgnum=" + bgnum + ", groupnum=" + groupnum + ", ranknum=" + ranknum
				+ ", count=" + count + ", rnum=" + rnum + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", replyCount=" + replyCount + ", title=" + title + ", contents=" + contents + ", id=" + id + ", img="
				+ img + ", date=" + date + "]";
	}
	
}
