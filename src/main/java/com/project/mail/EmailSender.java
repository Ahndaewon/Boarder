package com.project.mail;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailSender {
	
	private JavaMailSender mailSender;
	
	
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void sendMail(Email email) throws Exception {
		
		MimeMessage msg = mailSender.createMimeMessage();
		
		try {
			msg.setSubject(email.getSubject());
			msg.setText(email.getContent());
			msg.setRecipients( MimeMessage.RecipientType.TO, InternetAddress.parse( email.getReceiver() ) );
			
		} catch (MessagingException e) {
			System.out.println("MessagingException");
			e.printStackTrace();
		}
		
		try {
			mailSender.send(msg);
		} catch (MailException e) {
			System.out.println("MailException 발생");
			e.printStackTrace();
		}
	}
	

}
