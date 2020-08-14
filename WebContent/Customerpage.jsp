<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>CustomerPage</title>
    <link rel="stylesheet" type="text/css" href="customerstyle.css">
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

    	<strong>Name:</strong><input type="text" name="name" id="name" required>

       <strong>Vehicle Type:</strong>
       <select name="vehicle" id="vehicle">
				<option value="Two Wheeler">Two Wheeler</option>
				<option value="Three Wheeler">Three Wheeler</option>
				<option value="Four Wheeler">Four Wheeler</option>
				<option value="Heavy Vehicle">Heavy Vehicle</option>
			 </select><br>

      <strong>Address:</strong><input type="text" name="address" id="address" required>

      <strong>Engine No:</strong><input type="text" name="engine" id="engine" required><br>

      <strong>Gender:</strong><input type="text" name="gender" id="gender" required>

       <strong>Model:</strong><input type="text" name="model" id="model" required><br>

       <strong>Age:</strong><input type="text" name="age" id="age" required>

        <strong>Make:</strong><input type="text" name="make" id="make" required><br>


      <strong>RTO Office:</strong>

      <select name="rto" id="rto">
				<option value="Chennai">Chennai</option>
				<option value="Hyderabad">Hyderabad</option>
				<option value="Delhi">Delhi</option>
				<option value="Pune">Pune</option>
				<option value="Bangalore">Bangalore</option>
			</select>

      <strong>DL Number:</strong><input type="text" name="dlno" id="dlno" required><br>

      <strong>Insurance Number:</strong><input type="text" name="insuranceno" id="insurance" required><br>

      <input type="submit" value="Register" id="register">

        </form>

       </div>
  </body>
</html>
