package com.helper.reply;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class ReplyDTO {
	private int reply_seq;
	private int bo_seq;
	private int mem_seq;
	private String mem_nick;
	private String reply_content;
	private String reply_date;
	
	ReplyDTO(){}

	public ReplyDTO(int reply_seq, int bo_seq, int mem_seq, String mem_nick, String reply_content, String reply_date) {
		super();
		this.reply_seq = reply_seq;
		this.bo_seq = bo_seq;
		this.mem_seq = mem_seq;
		this.mem_nick = mem_nick;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
	}
	public ReplyDTO(int reply_seq, int bo_seq, int mem_seq, String mem_nick, String reply_content, Date reply_date) {
		super();
		this.reply_seq = reply_seq;
		this.bo_seq = bo_seq;
		this.mem_seq = mem_seq;
		this.mem_nick = mem_nick;
		this.reply_content = reply_content;
		this.reply_date = getStr(reply_date);
	}
	
	public String getStr(Date date) {
		String rs = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			rs = sdf.format(date);
		}catch(Exception e) {
			e.printStackTrace();
		}return rs;

	}

	public int getReply_seq() {
		return reply_seq;
	}

	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
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

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public String getReply_date() {
		return reply_date;
	}

	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}

	@Override
	public String toString() {
		return "ReplyDTO [reply_seq=" + reply_seq + ", bo_seq=" + bo_seq + ", mem_seq=" + mem_seq + ", mem_nick="
				+ mem_nick + ", reply_content=" + reply_content + ", reply_date=" + reply_date + "]";
	}
	
}
