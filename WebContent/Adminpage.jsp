<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Admin Page</title>
    <link rel="stylesheet" type="text/css" href="adminstyle.css">
  </head>
  <body>
    <div id="vehicleregister">
		    <h2>Online Vehicle Registration</h2>
	 </div>
    <div class="nav">
        <a href="Adminpage.jsp">Home</a>
        <a href="Loginpage.jsp">Logout</a>
    </div>

      <div class="form">
		      <p id="head">Search Requests</p>
		      
		     <form action="adminrequest.jsp">
		      
		      <strong>Status:</strong>
       			<select name="status" id="status">
				<option value="Pending">Pending</option>
				<option value="Approved">Approved</option>
				<option value="Rejected">Rejected</option>
				</select><br>
				
				<strong>RTO Office:</strong>
       			<select name="rto" id="rto">
				<option value="Chennai">Chennai</option>
				<option value="Hyderabad">Hyderabad</option>
				<option value="Delhi">Delhi</option>
				<option value="Pune">Pune</option>
				<option value="Bangalore">Bangalore</option>
				</select><br>
				
				<input type="submit" value="Search" id="search">
			</form>
			
		</div>
  </body>
</html>
