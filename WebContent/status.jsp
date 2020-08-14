<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%	try {
	HttpSession session1= request.getSession(); 
	int Id= (int)session1.getAttribute("id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root",""); 
	
	PreparedStatement pst = con.prepareStatement("select * from data where id=?");
	pst.setInt(1,Id);
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
     String Plateno=null;
	while(rs.next()){
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
	         Plateno = rs.getString("plateno");
	      }
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>View Request</title>
  <link rel="stylesheet" type="text/css" href="status.css">
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
		      <p id="head">View Request</p>
		      
      <form action="process" method="post">

    	<strong>Name:</strong><input type="text" value="<%= Name%>" id="name" readonly>

       <strong>Vehicle Type:</strong><input type="text" value="<%= Vehicle%>" id="vehicle" readonly><br>

      <strong>Address:</strong><input type="text" value="<%= Address%>" id="address" readonly>

      <strong>Engine No:</strong><input type="text" value="<%= Engine%>" id="engine" readonly><br>

      <strong>Gender:</strong><input type="text" value="<%= Gender%>" id="gender" readonly>

       <strong>Model:</strong><input type="text" value="<%= Model%>" id="model" readonly><br>

       <strong>Age:</strong><input type="text" value="<%= Age%>" id="age" readonly>

        <strong>Make:</strong><input type="text" value="<%= Make%>" id="make" readonly><br>

		<strong>RTO Office:</strong><input type="text" value="<%= Rto%>" id="rto" readonly>

      <strong>DL Number:</strong><input type="text" value="<%= Dlno%>" id="dlno" readonly><br>

      <strong>Insurance Number:</strong><input type="text" value="<%= Insurance%>" id="insurance" readonly>
	
	  <strong>Plate No:</strong><input type="text" style="text-align:center;" value="<%= Plateno%>" id="plateno" readonly><br>
	  
      <button type="submit" id="approve">Approve</button>
      
	  <button type="submit" formaction="process2" name="name" id="reject">Reject</button>
        </form>
       </div>
         <%rs.close();
	}
	catch (Exception e){
	      out.println(e);
	    } %>
</body>
</html>