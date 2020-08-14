

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
		String uname = request.getParameter("userID");
		String pass = request.getParameter("password");
		
		HttpSession session= request.getSession();
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
		
		PreparedStatement pst = con.prepareStatement("SELECT * FROM login WHERE uid=? and PWD=?");
		  pst.setString(1,uname);
		  pst.setString(2,pass);
		  
		  String unameDB="";
		  String passDB="";
		  
		 ResultSet rs= pst.executeQuery();
		 while(rs.next())
		 {
			 unameDB= rs.getString("uid");
			 passDB= rs.getString("PWD");
		 }
		
		if(uname.equals(unameDB) && pass.equals(passDB))
		{	
			if(uname.equals("admin123"))
			{
				RequestDispatcher rd= request.getRequestDispatcher("Adminpage.jsp");	
				rd.forward(request, response);
				session.setAttribute("User", uname);
			}
			else
			{
				RequestDispatcher rd= request.getRequestDispatcher("Customerpage.jsp");
				rd.forward(request, response);
				session.setAttribute("User", uname);
			}
		}
		else
		{
		request.setAttribute("error", "Invalid Input");
		RequestDispatcher rd= request.getRequestDispatcher("Loginpage.jsp");
		rd.include(request, response);
		}
	}
		catch (Exception e){
		      out.println(e);
		    }
	}
}
