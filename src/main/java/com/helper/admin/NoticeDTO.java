package com.helper.admin;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class NoticeDTO {
	private int notice_seq;
	private String notice_title;
	private String notice_content;
	private String notice_date;
	private int view_count;
	
	public String getStrDate(Date date) { // Date형을 String 형으로 변환 
		String rs = null;
		try{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			rs = sdf.format(date);
		}catch(Exception e) {
			e.printStackTrace();
			}return rs;
	}
	public int getNotice_seq() {
		return notice_seq;
	}
	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = getStrDate(notice_date);
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public NoticeDTO() {};
	public NoticeDTO(int notice_seq, String notice_title, String notice_content, String notice_date, int view_count) {
		super();
		this.notice_seq = notice_seq;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.view_count = view_count;
	}
	
	public NoticeDTO(int notice_seq, String notice_title, String notice_content, Date notice_date, int view_count) {
		super();
		this.notice_seq = notice_seq;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = getStrDate(notice_date);
		this.view_count = view_count;
	}
	@Override
	public String toString() {
		return "notice_seq=" + notice_seq + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_date=" + notice_date + ", view_count=" + view_count ;
	}
	
	
}
