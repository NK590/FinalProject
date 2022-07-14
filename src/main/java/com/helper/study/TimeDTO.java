package com.helper.study;

public class TimeDTO {
	private int mem_seq;
	private String time_subject;
	private int time_count;
	private String time_date;
	
	public TimeDTO() {}
	public TimeDTO(int mem_seq, String time_subject, int time_count, String time_date) {
		super();
		this.mem_seq = mem_seq;
		this.time_subject = time_subject;
		this.time_count = time_count;
		this.time_date = time_date;
	}
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getTime_subject() {
		return time_subject;
	}
	public void setTime_subject(String time_subject) {
		this.time_subject = time_subject;
	}
	public int getTime_count() {
		return time_count;
	}
	public void setTime_count(int time_count) {
		this.time_count = time_count;
	}
	public String getTime_date() {
		return time_date;
	}
	public void setTime_date(String time_date) {
		this.time_date = time_date;
	}
	
	@Override
	public String toString() {
		return "mem_seq=" + mem_seq + ", time_subject=" + time_subject + ", time_count=" + time_count
				+ ", time_date=" + time_date;
	}
	
	
}
