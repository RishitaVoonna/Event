/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import DBAction.DBConnectionn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author sunil
 */
public class Event {
    public static void pSkey(int id,String email){
      Connection con=null;
      try {
          String staus="yes";
          con=DBConnectionn.getConnection();
           String sqlquery="update event set status='"+staus+"' where email='"+email+"' and id='"+id+"'";
      PreparedStatement ps=con.prepareStatement(sqlquery);
      ps.executeUpdate();
      } catch (SQLException e) {
      }
  }
    public static boolean sendMail(String msg, String userid, String to) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
        "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        // Assuming you are sending email from localhost


        Session session = Session.getDefaultInstance(props,
        new javax.mail.Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("clusterdata125@gmail.com","ram@5081");
        }
        });

        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(userid));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            message.setSubject("Approved Notification");
            message.setText(msg);

            Transport.send(message);

            
            return true;

        } catch (MessagingException e) {
            
            e.printStackTrace();
            return false;            
           // throw new RuntimeException(e);
        }
    }
}
