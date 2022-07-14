package com.helper.week;

public class WeekDTO {
	
	private int mem_seq;
	private String record_week;
	private int record_time;
	
	public WeekDTO() {}
	public WeekDTO(int mem_seq, String record_week, int record_time) {
		super();
		this.mem_seq = mem_seq;
		this.record_week = record_week;
		this.record_time = record_time;
	}
	
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getRecord_week() {
		return record_week;
	}
	public void setRecord_week(String record_week) {
		this.record_week = record_week;
	}
	public int getRecord_time() {
		return record_time;
	}
	public void setRecord_time(int record_time) {
		this.record_time = record_time;
	}
	
	@Override
	public String toString() {
		return mem_seq + " : " + record_week + " : " + record_time;
	}
	
	
	
	
	
}
