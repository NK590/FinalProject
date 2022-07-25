package com.helper.member;


public class KakaoDTO {

	private int kakao_seq;
	private String kakao_name;
	private String kakao_email;
	
	public KakaoDTO() {}

	public KakaoDTO(int kakao_seq, String kakao_name, String kakao_email) {
		super();
		this.kakao_seq = kakao_seq;
		this.kakao_name = kakao_name;
		this.kakao_email = kakao_email;
	}

	public int getkakao_seq() {
		return kakao_seq;
	}

	public void setkakao_seq(int kakao_seq) {
		this.kakao_seq = kakao_seq;
	}

	public String getkakao_name() {
		return kakao_name;
	}

	public void setkakao_name(String kakao_name) {
		this.kakao_name = kakao_name;
	}

	public String getkakao_email() {
		return kakao_email;
	}

	public void setkakao_email(String kakao_email) {
		this.kakao_email = kakao_email;
	}

	@Override
	public String toString() {
		return "KakaoDTO [kakao_seq=" + kakao_seq + ", kakao_name=" + kakao_name + ", kakao_email=" + kakao_email + "]";
	}
	
	
}
