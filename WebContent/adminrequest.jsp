<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Request</title>
<link rel="stylesheet" type="text/css" href="adminrequeststyle.css">
</head>
<body>
<div id="vehicleregister">
		<h2>Online Vehicle Registration</h2>
	 </div>
    <div class="nav">
        <a href="Adminpage.jsp">Home</a>
        <a href="Loginpage.jsp">Logout</a>
    </div>
		<% 
       	try{
       	HttpSession session1= request.getSession();
    	String Status = request.getParameter("status");
    	String Rto = request.getParameter("rto");
    	session1.setAttribute("value",Status);
    	%>
      <div class="form">
		      <p id="head">Search Requests</p>
		       <form action="adminrequest.jsp">
		      
		      <strong>Status:</strong>	
		      <select name="status" id="status">
				<option><%= Status%></option>
				</select><br>
				
				<strong>RTO Office:</strong>	
				<select name="rto" id="rto">
				<option><%= Rto %></option>
				</select><br>
				
				<input type="submit" value="Search" id="search" disabled>
			</form>
    	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root",""); 
		
		
		PreparedStatement pst = con.prepareStatement("select id,name,make,model,rto,status from data where (status=? AND rto=?)");
		pst.setString(1,Status);
		pst.setString(2,Rto);
		
		ResultSet rs = pst.executeQuery();
		boolean b = rs.last(); 
		int count = rs.getRow(); 
		rs.beforeFirst();
		
		if(count>0) 
		{
			%>
			<table style="background-color: white;">
			<tr>
				<th>Request Id</th>
				<th>Name</th>
				<th>Make</th>
				<th>Model</th>
				<th>RTO Office</th>
				<th>Status</th>
			</tr>
		<% 
		while(rs.next())
		{
			rs.getInt(1);
		%>
			<tr>
				<td><form action="check" method="post"><input type="submit" value="<%= rs.getInt(1)%>" name="uID"></form></td>
				<td><%= rs.getString(2)%></td>
				<td><%= rs.getString(3)%></td>
				<td><%= rs.getString(4)%></td>
				<td><%= rs.getString(5)%></td>
				<td><%= rs.getString(6)%></td>
			</tr>
		<%
		}
       %>
		</table>
		<%
		}
		else{
		%>
		<h1 id="norecord">No records found</h1>
		</div>	
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