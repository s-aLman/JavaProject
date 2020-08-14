<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%	try {
	String User= (String) session.getAttribute("User");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root",""); 
	
	PreparedStatement pst = con.prepareStatement("select * from data where user=?");
	pst.setString(1,User);
	 ResultSet rs = pst.executeQuery();
	 String Name=null;
     String Vehicle=null;
     int Age=0;
     String Address=null;
     String Gender=null;
     String Rto=null;
     String Engine=null;
     String Dlno=null;
     String Make=null;
     String Model=null;
     String Insurance=null;
		rs.last();
	         Name = rs.getString("name");
	         Vehicle = rs.getString("vehicle");
	         Age = rs.getInt("age");
	         Address = rs.getString("address");
	         Gender = rs.getString("gender");
	         Rto = rs.getString("rto");
	         Engine = rs.getString("engine");
	         Dlno = rs.getString("dlno");
	         Make = rs.getString("make");
	         Model = rs.getString("model");
	         Insurance = rs.getString("insurance");
	%>
<!DOCTYPE html>
<html>
  <head>
    <title>CustomerPage</title>
    <link rel="stylesheet" type="text/css" href="customerdata.css">
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

      <div class="form">
		      <p id="head">Registration Form</p>
		      
		      <h2 id="msg">${message}</h2>
		      
      <form action="Registerservlet" method="post">

      <strong>Name:</strong><input type="text" value="<%= Name%>" id="name" disabled>

      <strong>Vehicle Type:</strong><input type="text" value="<%= Vehicle%>" id="vehicle" disabled><br>

      <strong>Address:</strong><input type="text" value="<%= Address%>" id="address" disabled>

      <strong>Engine No:</strong><input type="text" value="<%= Engine%>" id="engine" disabled><br>

      <strong>Gender:</strong><input type="text" value="<%= Gender%>" id="gender" disabled>

      <strong>Model:</strong><input type="text" value="<%= Model%>" id="model" disabled><br>

      <strong>Age:</strong><input type="text" value="<%= Age%>" id="age" disabled>

      <strong>Make:</strong><input type="text" value="<%= Make%>" id="make" disabled><br>

	  <strong>RTO Office:</strong><input type="text" value="<%= Rto%>" id="rto" disabled>

      <strong>DL Number:</strong><input type="text" value="<%= Dlno%>" id="dlno" disabled><br>

      <strong>Insurance Number:</strong><input type="text" value="<%= Insurance%>" id="insurance" disabled>

      <input type="submit" value="Register" id="register" disabled>

        </form>

       </div>
             <%rs.close();
	}
	catch (Exception e){
	      out.println(e);
	    } %>
  </body>
</html>
