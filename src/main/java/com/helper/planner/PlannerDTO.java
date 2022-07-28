package com.helper.planner;

import java.sql.Date;
import java.time.format.DateTimeFormatter;

public class PlannerDTO {
	
	private int plan_seq;
	private int mem_seq;
	private String plan_title;
	private String plan_start;
	private String plan_end;
	
	public PlannerDTO() {}

	public PlannerDTO(int plan_seq, int mem_seq, String plan_title, String plan_start, String plan_end) {
		super();
		this.plan_seq = plan_seq;
		this.mem_seq = mem_seq;
		this.plan_title = plan_title;
		this.plan_start = plan_start;
		this.plan_end = plan_end;
	}
	

	public int getPlan_seq() {
		return plan_seq;
	}

	public void setPlan_seq(int plan_seq) {
		this.plan_seq = plan_seq;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public String getPlan_title() {
		return plan_title;
	}

	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}

	public String getPlan_start() {
		return plan_start;
	}

	public void setPlan_start(String plan_start) {
		this.plan_start = plan_start;
	}

	public String getPlan_end() {
		return plan_end;
	}

	public void setPlan_end(String plan_end) {
		this.plan_end = plan_end;
	}

	@Override
	public String toString() {
		return "PlannerDTO [plan_seq=" + plan_seq + ", mem_seq=" + mem_seq + ", plan_title=" + plan_title
				+ ", plan_start=" + plan_start + ", plan_end=" + plan_end + "]";
	}


	
}
