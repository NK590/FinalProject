package com.helper.study;

public class SubjectDTO {
	private int mem_seq;
	private String time_subject;
	
	public SubjectDTO() {}
	public SubjectDTO(int mem_seq, String time_subject) {
		super();
		this.mem_seq = mem_seq;
		this.time_subject = time_subject;
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
	
}
