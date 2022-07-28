package com.helper.chat;

public class ChatDTO {
	private int chat_seq;
	private int group_seq;
	private String mem_nick;
	private String chat_content;
	private long chat_time;
	
	public ChatDTO() {}
	public ChatDTO(int chat_seq, int group_seq, String mem_nick, String chat_content, long chat_time) {
		super();
		this.chat_seq = chat_seq;
		this.group_seq = group_seq;
		this.mem_nick = mem_nick;
		this.chat_content = chat_content;
		this.chat_time = chat_time;
	}
	public int getChat_seq() {
		return chat_seq;
	}
	public void setChat_seq(int chat_seq) {
		this.chat_seq = chat_seq;
	}
	public int getGroup_seq() {
		return group_seq;
	}
	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getChat_content() {
		return chat_content;
	}
	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}
	public long chat_time() {
		return chat_time;
	}
	public void setChat_time(int chat_time) {
		this.chat_time = chat_time;
	}
	
	@Override
	public String toString() {
		return "ChatDTO [chat_seq=" + chat_seq + ", group_seq=" + group_seq + ", mem_nick=" + mem_nick
				+ ", chat_content=" + chat_content + ", chat_time=" + chat_time + "]";
	}
}
