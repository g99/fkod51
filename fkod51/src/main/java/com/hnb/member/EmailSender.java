package com.hnb.member;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
 
import com.hnb.member.Email;
 
@Component
public class EmailSender  {
     
     
	public void sendMail(Email email) throws MessagingException, UnsupportedEncodingException {

        // SSL // I USED THIS METHOD            
        Properties propsSSL = new Properties();

        // EVEN IF YOU SKIP THESE TWO PROP IT WOULD WORK
        propsSSL.put("mail.transport.protocol", "smtps");
        propsSSL.put("mail.smtps.host", "smtp.gmail.com");

        // THIS IS THE MOST IMPORTANT PROP --> "mail.smtps.auth"
        propsSSL.put("mail.smtps.auth", "true");

        Session sessionSSL = Session.getInstance(propsSSL);
        sessionSSL.setDebug(true);

        Message messageSSL = new MimeMessage(sessionSSL);
        messageSSL.setFrom(new InternetAddress("dingo44kr@gmail.com", "이성한")); //setFrom: 보내는 사람의 이메일 주소와, 이름
        messageSSL.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email.getReciver())); // setRecipients: 받는 사람의 이메일 주소
        messageSSL.setSubject(email.getSubject()); // 메일 제목
        messageSSL.setText(email.getContent()); // 메일 내용

        Transport transportSSL = sessionSSL.getTransport();
        // EVEN IF YOU SKIP PORT NUMBER , IT WOULD WORK
        transportSSL.connect("smtp.gmail.com", 465, "dingo44kr@gmail.com", "tlsgP0205");
        transportSSL.sendMessage(messageSSL, messageSSL.getAllRecipients());
        transportSSL.close();
        System.out.println("SSL done.");
        System.out.println("받는 사람"+email.getReciver());
        System.out.println("메일 제목"+email.getSubject());
        System.out.println("보내는 내용"+email.getContent());
    }
    


    
    
    
    
    
    
  /* 이 버전은 com.sun.mail.smtp.SMTPSendFailedException: 530-5.5.1 Authentication Required 에러가 남. 
   * public void SendEmail(Email email) throws Exception {
        System.out.println("센드메일로진입");
        System.out.println("보내는 제목"+email.getSubject());
        System.out.println("받는 사람"+email.getReciver());
        System.out.println("보내는 내용"+email.getContent());
        MimeMessage msg = mailSender.createMimeMessage();
        msg.setSubject(email.getSubject());
        msg.setText(email.getContent());
        msg.setRecipient(RecipientType.TO , new InternetAddress(email.getReciver()));
        
        
        
        String SMTP_HOST_NAME = "gmail-smtp.l.google.com";
        // Properties 설정
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.host", SMTP_HOST_NAME);
        props.put("mail.smtp.auth", "true");
        mailSender.send(msg);
    }*/
}