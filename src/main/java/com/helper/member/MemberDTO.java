package com.helper.member;

public class MemberDTO {
	private int mem_seq;
	private String mem_id;
	private String mem_pw;
	private String mem_nick;
	private String mem_std_key;
	private String mem_black;
	private int group_seq;
	
	public MemberDTO() {}
	
	public MemberDTO(int mem_seq, String mem_id, String mem_pw, String mem_nick, String mem_std_key,
			String mem_black, int group_seq) {
		super();
		this.mem_seq = mem_seq;
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_nick = mem_nick;
		this.mem_std_key = mem_std_key;
		this.mem_black = mem_black;
		this.group_seq = group_seq;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_nick() {
		return mem_nick;
	}

	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}

	public String getMem_std_key() {
		return mem_std_key;
	}

	public void setMem_std_key(String mem_std_key) {
		this.mem_std_key = mem_std_key;
	}

	public String getMem_black() {
		return mem_black;
	}

	public void setMem_black(String mem_black) {
		this.mem_black = mem_black;
	}

	public int getGroup_seq() {
		return group_seq;
	}

	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}

	@Override
	public String toString() {
		return "MemberDTO [mem_seq=" + mem_seq + ", mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_nick="
				+ mem_nick + ", mem_std_key=" + mem_std_key + ", mem_black=" + mem_black + ", group_seq="
				+ group_seq + "]";
	}
	
	
}
