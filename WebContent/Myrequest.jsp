<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Requests</title>
<link rel="stylesheet" type="text/css" href="myrequeststyle.css">
</head>
<body>
	<div id="vehicleregister">
		<h2>Online Vehicle Registration</h2>
	</div>
	<div class="nav">
		<a href="Customerpage.jsp">Home</a> 
		<a href="Myrequest.jsp">My Requests</a> 
		<a href="Loginpage.jsp">Logout</a>
	</div>

	<div class="box">
		<h3 id="head">My Requests</h3>
			<% 
       try{
    	String cust = (String) session.getAttribute("User");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root",""); 
		
		
		PreparedStatement pst = con.prepareStatement("select id,name,make,model,rto,plateno,status from data where user=?");
		pst.setString(1,cust);
	    
		ResultSet rs = pst.executeQuery();
		boolean b = rs.last(); 
		int count = rs.getRow(); 
		rs.beforeFirst();
		
		if(count>0) 
		{
			%>
			<table>
			<tr>
				<th>Request Id</th>
				<th>Name</th>
				<th>Make</th>
				<th>Model</th>
				<th>RTO Office</th>
				<th>Plate Number</th>
				<th>Status</th>
			</tr>
		<% 
		while(rs.next())
		{
		%>
			<tr>
				<td><%= rs.getInt(1)%></td>
				<td><%= rs.getString(2)%></td>
				<td><%= rs.getString(3)%></td>
				<td><%= rs.getString(4)%></td>
				<td><%= rs.getString(5)%></td>
				<td style="text-align: center;"><%= rs.getString(6)%></td>
				<td><%= rs.getString(7)%></td>
			</tr>
		<%
		}
       %>
		</table>
		</div>	
		<%
		}
		else{
		%>
		<h1 id="no">No Vehicles Registered yet.</h1>
		<%
		}
		pst.close(); 
	    con.close();
       }
		catch (Exception e){
		      out.println(e);
		    }
		%>
</body>
</html>