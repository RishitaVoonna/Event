<%@ page import="java.sql.*" %> 
<%
String name = request.getParameter("email").toString();

String data ="";
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event", "root", "root");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from ureg where email='"+name+"'");
int count=0;
while(rs.next())
{

count++;

}

if(count>0)
{
data="Email-ID already exists!";
}
else
{
data="You can register";
}
out.println(data);

}
catch (Exception e) {
System.out.println(e);
}
%>