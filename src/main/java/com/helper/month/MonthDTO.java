package com.helper.month;

public class MonthDTO {
	
	private int mem_seq;
	private String recorde_month;
	private int recode_time;
	
	public MonthDTO() {}
	public MonthDTO(int mem_seq, String recorde_month, int recode_time) {
		super();
		this.mem_seq = mem_seq;
		this.recorde_month = recorde_month;
		this.recode_time = recode_time;
	}
	
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getRecorde_month() {
		return recorde_month;
	}
	public void setRecorde_month(String recorde_month) {
		this.recorde_month = recorde_month;
	}
	public int getRecode_time() {
		return recode_time;
	}
	public void setRecode_time(int recode_time) {
		this.recode_time = recode_time;
	}
	
	@Override
	public String toString() {
		return mem_seq + " : " + recorde_month + " : " + recode_time;
	}
	
	
	
}
