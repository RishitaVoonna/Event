<%-- 
    Document   : pkupdate
    Created on : Oct 2, 2019, 6:20:40 PM
    Author     : sys7
--%>

<%@page import="com.action.Event"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %> <%
String uemail=request.getParameter("uemail");
String time=request.getParameter("fid");
  String hashkey = "Event is updated our team will reach you soon";
    int id=Integer.parseInt(time);
   
  
  boolean b=false;
  b=Event.sendMail(hashkey, uemail, uemail);
 
 Event.pSkey(id,uemail);
 
 if(b == true){
 response.sendRedirect("aevent.jsp?msg=sucess");
}else{
response.sendRedirect("aevent.jsp?msg=fail");
}
%>
