package com.helper.member;

import java.util.Date;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;


public class SendMail {

	public int compare(String mem_id) { // 인증메일 보내기
		// 메일 인코딩
		
		final String bodyEncoding = "UTF-8"; // 콘텐츠 인코딩

		String subject = "StudyHelper 인증번호 요청메일입니다."; // 제목
		String fromEmail = "damnyou1994@gmail.com"; // 보낼 이메일 주소
		String fromUsername = "StudyHelper"; // 보낸사람 이름
		String toEmail = mem_id; // 콤마(,)로 여러개 나열
		int randomNumber = this.ranNum();
		System.out.println(randomNumber);
		final String username = "damnyou1994@gmail.com"; // 구글 계정
		final String password = "ynbaowegjhrjpazf"; // 발급받은 앱 비번

		// 메일에 출력할 텍스트
		StringBuffer sb = new StringBuffer();
		sb.append("<h2>안녕하세요. StudyHelper입니다.^^</h4>");
		sb.append("<h4>해당 인증번호를 입력해 주세요~</h4>");
	      sb.append("<div style='background-image:url(https://lh3.googleusercontent.com/NiIqeDVC2d9Oa6PRq-sx-n3ZppparWAES6fXhiHb8x58yVTwtaltcZ_rrgqcGFsFfzlpHZvzIRMMeTAGwf8u0n8ucu_4zqiFfKi7r0N7fY3kuLYSMe2SEXk9NKJpmy1U1CxAx9xDNF6qSa_1UJVI349-_eaPjBQunLiPvA2BVZmfrobp7YdlKCovAfMQLbLyAGX3qETfXSg-XKYOiw5YDfrRNff9W5nOSMfiKC7ISx7qe_kemL_wPIHky0YN0Fw5aA4LsSEjNVmqZIk0kSRgpQrEybxEpZeKcy2AxMuG_Uu6rL1e3LcPkyooYtksaogHHoYls_CgK-9MV1Ek5xAuzEiipZA2G0WNU0SAHQe97djumbWgnmdZiXQ1i-HkCWcKM_E1L_Bvn9dlBFoAgtnHoyLRbfYJVGU37ngXYV0XkG0vfEWaHVCWKtGAs8KZkNdIHf34LdHvdgj0x08SdQlr-cezrrAuyQaHAdfriepG02CaPxCCXvy-WGbHGL2MVOkwXgNzKgC4mi_SPzW6rBZbuobhKBYJlpskguyJSIosanmCQdPIQNhWLqERUiqJfqYQr9VuFuPRsMjZ0EWSCWoY95PSOr3pHJN8LwZyuwqnwCXWvCa_iOftan3eIbFiBTHBnNhbZY9EjSMsWvkXJ315bm5HUSBQj66KqQjIoKdwtPrgJT_F1auW0_mUC_eYHTFj4TQvnKf-RmXNbCFf8HZxaDB8CfOPMoPN6iKxbqsWC9LecqiTcZAGvYbKiaU=w1152-h736-no?authuser=0)'>헬퍼도착했습니까??</div>");
		sb.append(randomNumber);
		String html = sb.toString();
		// 메일 옵션 설정
		Properties props = new Properties();

		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		try {
			// 메일 서버 인증 계정 설정
			// 메일 세션 생성
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
	                return new javax.mail.PasswordAuthentication(username, password);
	            }
	        });

			// 메일 송/수신 옵션 설정
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmail, fromUsername));
			message.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));
			message.setSubject(subject);
			message.setSentDate(new Date());

			// 메일 콘텐츠 설정
			Multipart mParts = new MimeMultipart();
			MimeBodyPart mTextPart = new MimeBodyPart();
			MimeBodyPart mFilePart = null;

			// 메일 콘텐츠 - 내용
			mTextPart.setText(html, bodyEncoding, "html");
			mParts.addBodyPart(mTextPart);

			// 메일 콘텐츠 설정
			message.setContent(mParts);

			// MIME 타입 설정
			MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
			MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
			MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
			MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
			MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
			MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
			CommandMap.setDefaultCommandMap(MailcapCmdMap);

			// 메일 발송
			Transport.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return randomNumber;
	}

	public int ranNum() {
        return ThreadLocalRandom.current().nextInt(100000, 1000000);
    }
	
	
}

