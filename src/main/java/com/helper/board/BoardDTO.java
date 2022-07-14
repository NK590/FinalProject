package com.helper.board;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class BoardDTO {
	private int bo_seq;
	private int mem_seq;
	private String mem_nick;
	private String bo_title;
	private String bo_content;
	private String bo_date;
	
	BoardDTO(){}

	public BoardDTO(int bo_seq, int mem_seq, String mem_nick, String bo_title, String bo_content, String bo_date) {
		super();
		this.bo_seq = bo_seq;
		this.mem_seq = mem_seq;
		this.mem_nick = mem_nick;
		this.bo_title = bo_title;
		this.bo_content = bo_content;
		this.bo_date = bo_date;
	}
	

	public BoardDTO(int bo_seq, int mem_seq, String mem_nick, String bo_title, String bo_content, Date bo_date) {
		super();
		this.bo_seq = bo_seq;
		this.mem_seq = mem_seq;
		this.mem_nick = mem_nick;
		this.bo_title = bo_title;
		this.bo_content = bo_content;
		this.bo_date = getStrDate(bo_date);
	}
	public String getStrDate(Date date) { // Date형을 String 형으로 변환 
		String rs = null;
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			rs = sdf.format(date);
		}catch(Exception e) {
			e.printStackTrace();
			}return rs;
	}
	

	public int getBo_seq() {
		return bo_seq;
	}

	public void setBo_seq(int bo_seq) {
		this.bo_seq = bo_seq;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public String getMem_nick() {
		return mem_nick;
	}

	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}

	public String getBo_title() {
		return bo_title;
	}

	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}

	public String getBo_content() {
		return bo_content;
	}

	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}

	public String getBo_date() {
		return bo_date;
	}

	public void setBo_date(String bo_date) {
		this.bo_date = bo_date;
	}

	@Override
	public String toString() {
		return "BoardDTO [bo_seq=" + bo_seq + ", mem_seq=" + mem_seq + ", mem_nick=" + mem_nick + ", bo_title="
				+ bo_title + ", bo_content=" + bo_content + ", bo_date=" + bo_date + "]";
	}
	
}
