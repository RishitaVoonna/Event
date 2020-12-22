<%  
    String ab=request.getParameter("name");
    String ab1=request.getParameter("password");

    if(request.getParameter("name").equals("admin") && request.getParameter("password").equals("admin"))
{
    
    response.sendRedirect("admin.jsp?msg=success");
}
else{
    response.sendRedirect("AdminHome.html.jsp?msg=failed");
}
%>