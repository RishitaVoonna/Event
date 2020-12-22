<%-- 
    Document   : signup
    Created on : Sep 16, 2019, 12:15:01 PM
    Author     : sys7
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBAction.DBConnectionn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String event=request.getParameter("event");
String location=request.getParameter("location");
String time = request.getParameter("time");
String date = request.getParameter("date");
String status="no";
%>
<%
Connection con=null;
PreparedStatement ps=null;
int count=0;
try{
    
con=DBConnectionn.getConnection();
Statement st=con.createStatement();

ps=con.prepareStatement("insert into event(name,email,event,location,timestamp,status)values(?,?,?,?,?,?)");
ps.setString(1, name);
ps.setString(2, email);
ps.setString(3, event);
ps.setString(4, location);
ps.setString(5, date+"-"+time);
ps.setString(6, status);
int i=0;
i=ps.executeUpdate();
if(i>0){
response.sendRedirect("ohome.jsp?msg=success");
}else{
response.sendRedirect("ohome.jsp?msg=fail");
}

%>
<%
}catch(Exception e){
e.printStackTrace();}
%>