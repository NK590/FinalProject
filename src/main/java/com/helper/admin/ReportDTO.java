package com.helper.admin;

public class ReportDTO {

	private int report_seq, mem_seq;
	private String mem_std_key, mem_id, mem_nick, report_reason;
	
	
	public ReportDTO() {}
	public ReportDTO(int report_seq, int mem_seq, String mem_std_key, String mem_id, String mem_nick,
			String report_reason) {
		super();
		this.report_seq = report_seq;
		this.mem_seq = mem_seq;
		this.mem_std_key = mem_std_key;
		this.mem_id = mem_id;
		this.mem_nick = mem_nick;
		this.report_reason = report_reason;
	}

	public int getReport_seq() {
		return report_seq;
	}
	public void setReport_seq(int report_seq) {
		this.report_seq = report_seq;
	}
	public int getMem_seq() {
		return mem_seq;
	}
	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}
	public String getMem_std_key() {
		return mem_std_key;
	}
	public void setMem_std_key(String mem_std_key) {
		this.mem_std_key = mem_std_key;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getReport_reason() {
		return report_reason;
	}
	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}

	@Override
	public String toString() {
		return report_seq + " : " + mem_seq + " : " + mem_std_key
				+ " : " + mem_id + " : " + mem_nick + " : " + report_reason;
	}
	
	
	
	
	
}
