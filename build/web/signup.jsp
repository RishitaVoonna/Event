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
String password=request.getParameter("password");
String cpassword=request.getParameter("confirm_password");

%>
<%
Connection con=null;
PreparedStatement ps=null;
int count=0;
try{
    
con=DBConnectionn.getConnection();
Statement st=con.createStatement();
String strQuery = "SELECT COUNT(*) FROM ureg where email='"+email+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
if(Countrow.equals("0")){
ps=con.prepareStatement("insert into ureg(name,email,password,cpassword,count)values(?,?,?,?,?)");
ps.setString(1, name);
ps.setString(2, email);
ps.setString(3, password);
ps.setString(4, cpassword);
ps.setInt(5, count);

int i=0;
i=ps.executeUpdate();
if(i>0){
response.sendRedirect("about-us.jsp?msg=success");
}else{
response.sendRedirect("about-us.jsp?msg=fail");
}
}else{
out.println("Email already exists !");
}
%>
<%
}catch(Exception e){
e.printStackTrace();}
%>