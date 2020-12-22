/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import DBAction.DBConnectionn;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sys7
 */
public class Sign extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
            String email=request.getParameter("email");
String password=request.getParameter("password");
        
            Connection con=null;
PreparedStatement ps=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
int count=1;
try {
        con=DBConnectionn.getConnection();
       
            
         ps=con.prepareStatement("select * from ureg where email='"+email+"'");
          ResultSet rt=ps.executeQuery();
          if(rt.next()){
            
              String p=rt.getString("password");
              int id=rt.getInt("id");
              String uname=rt.getString("name");
          
              
              if(password.equalsIgnoreCase(p)){
                 
                      HttpSession session=request.getSession();
                      session.setAttribute("id",id);
                      int sessionid=(int)session.getAttribute("id");
                         
                      session.setAttribute("uname", uname); 
                      
                      session.setAttribute("email", email);
                      response.sendRedirect("ohome.jsp?msg=sucess");
                      String skey = null;
    
        }else{
                  response.sendRedirect("ologin.jsp?msg=wrongpassword");
              }
              
          
          
          
        
        
        }else{
         response.sendRedirect("service.html?msg=Query not working");
        }
    
        
}catch(Exception e){
    e.printStackTrace();
}}
}


