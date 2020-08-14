<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
Connection connection = null;
try {
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306", "root", "");
Statement statement = connection.createStatement();
String query = "CREATE DATABASE IF NOT EXISTS register";
statement.executeUpdate(query);

Statement statement2 = connection.createStatement();
String query2 = "CREATE TABLE IF NOT EXISTS register.data(user VARCHAR(15),id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,name VARCHAR(25),vehicle VARCHAR(25),age INT,address VARCHAR(100),gender VARCHAR(10),rto VARCHAR(10),engine VARCHAR(20),dlno VARCHAR(20),make VARCHAR(20),model VARCHAR(20),insurance VARCHAR(20),status VARCHAR(16) NOT NULL DEFAULT 'Pending',plateno VARCHAR(16) NOT NULL DEFAULT '-')";
statement2.executeUpdate(query2);

Statement statement1 = connection.createStatement();
String query1 = "CREATE TABLE IF NOT EXISTS register.login(uid VARCHAR(16) NOT NULL,PWD VARCHAR(16) NOT NULL)";
statement1.executeUpdate(query1);

Statement statement4 = connection.createStatement();
String query4 = "ALTER TABLE register.data AUTO_INCREMENT=100000";
statement4.executeUpdate(query4);

Statement statement5 = connection.createStatement();
String query5 = "INSERT INTO register.login VALUES('customer','customer123')";
String query6 = "INSERT INTO register.login values('admin123','admin123')";
statement5.executeUpdate(query5);
statement5.executeUpdate(query6);
}
catch (Exception e)
{
	out.println(e);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="loginstyle.css">
</head>
<body>
	<div class="form-container">
		<h2 id="head">Login</h2><br>
		<h3 style="color:red;text-align:center;">${error}</h3>
		
		<form action="loginservlet" method="post">
			<table>
				<tr>
					<td style="text-align: left"><strong>User ID</strong></td>
					<td><input type="text" name="userID"></td>
				</tr>
				<tr>
					<td style="text-align: left"><strong>Password</strong></td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" name="login" value="Login"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>