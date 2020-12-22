<!DOCTYPE html>
<html lang="en">
    <%@ page import="java.sql.*" %> 
<head>
	<title>Table V03</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="table/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="table/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="table/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="table/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="table/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="table/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="table/css/util.css">
	<link rel="stylesheet" type="text/css" href="table/css/main.css">
<!--===============================================================================================-->
<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="icon" href="img/fav-icon.png" type="image/x-icon" />
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Sierra</title>

        <!-- Icon css link -->
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        
        <!-- Rev slider css -->
        <link href="vendors/revolution/css/settings.css" rel="stylesheet">
        <link href="vendors/revolution/css/layers.css" rel="stylesheet">
        <link href="vendors/revolution/css/navigation.css" rel="stylesheet">
        
        <!-- Extra plugin css -->
        <link href="vendors/owl-carousel/owl.carousel.min.css" rel="stylesheet">
        <link href="vendors/magnify-popup/magnific-popup.css" rel="stylesheet">
        
        
        <link href="css/style.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css2/style2.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>
     <!--================Header Menu Area =================-->
        <!--================Header Menu Area =================-->
        <header class="main_menu_area">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#"><img src="img/logo.png" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>

               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav">
                        <li class="nav-item active"><a class="nav-link" href="admin.jsp">Home</a></li>
                        <li class="nav-item active"><a class="nav-link" href="aevent.jsp">Event Request</a></li>
                        <li class="nav-item"><a class="nav-link" href="AdminHome.html">Logout</a></li></ul>
                </div>
            </nav>
        </header>
        <!--================End Header Menu Area =================-->
        
        <!--================Banner Area =================-->
        <section class="banner_area">
            <div class="container">
                <div class="banner_inner_text">
                    <h2>Admin</h2>
                    <p>Services</p>
                </div>
            </div>
        </section>
        <!--================End Banner Area =================-->
	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				
				<div class="table100 ver6 m-b-110">
					<table data-vertable="ver6">
						<thead>
							<tr class="row100 head">
								<th class="column100 column1" data-column="column1">id</th>
								<th class="column100 column3" data-column="column1">Email</th>
								<th class="column100 column4" data-column="column1">Event</th>
                                                                <th class="column100 column1" data-column="column1">Location</th>
                                                                <th class="column100 column1" data-column="column1">Time</th>
								<th class="column100 column5" data-column="column1">Accept</th>
								
							</tr>
						</thead>
                                                <%
                                                    String pkey="no";
                                                    int id=0;
                                                    String name=null,email=null,qrcode=null,times=null,location=null,status=null;
                                                    try{
                                                    Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event", "root", "root");
String qry="select * from event";
PreparedStatement ps=con.prepareStatement(qry);
ResultSet rs=ps.executeQuery();
while(rs.next())
	{
            
            id=rs.getInt("id");
            email=rs.getString("email");
            qrcode=rs.getString("event");
            location=rs.getString("location");
            times=rs.getString("timestamp");
            status=rs.getString("status");
                                                %>
						<tbody>
							<tr class="row100">
								<td class="column100 column1" data-column="column1"><%=id%></td>
								<td class="column100 column2" data-column="column1"><%=email%></td>
								<td class="column100 column3" data-column="column1"><%=qrcode%></td>
								<td class="column100 column4" data-column="column1"><%=location%></td>
                                                                <td class="column100 column4" data-column="column1"><%=times%></td>
                                                                <%
                                                                    if(status.equals("no")){
                                                                %>
								<td class="column100 column5" data-column="column1"><a href="eupdate.jsp?uemail=<%=email%>&&fid=<%=id%>">Accept</a></td>
								<% }else{%>
                                                                <td class="column100 column5" data-column="column1">Approved</td>
                                                                <%}%>
							</tr>
<%	  
}
	   }
	   catch(Exception e1)
	   {
	     out.println(e1.getMessage());
	   }
 %>	
							
						</tbody>
					</table>
                                  
				</div>
			</div>
		</div>
	</div>


	

<!--===============================================================================================-->	
	<script src="table/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="table/vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="table/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="table/js/main.js"></script>

</body>
</html>