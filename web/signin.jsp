<%-- 
    Document   : signin
    Created on : Sep 17, 2019, 10:41:35 AM
    Author     : sys7
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBAction.DBConnectionn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email=request.getParameter("email");
String password=request.getParameter("password");
%>
<%
Connection con=null;
PreparedStatement ps=null;
try {
        con=DBConnectionn.getConnection();
         Statement st=con.createStatement();
          ResultSet rt=st.executeQuery("select * from owner where email='"+email+"'");
          if(rt.next()){
             
                      response.sendRedirect("ohome.jsp?msg=sucess");
                  } else{
                      response.sendRedirect("ologin.jsp?msg=fail");
                  } 
              
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
