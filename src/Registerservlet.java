import java.io.PrintWriter;
import java.sql.*;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Registerservlet")
public class Registerservlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		HttpSession session= request.getSession();
		
		try {
		String User= (String) session.getAttribute("User");
		String Name = request.getParameter("name");
		String Vehicle = request.getParameter("vehicle");
		String Address = request.getParameter("address");
		String Engine = request.getParameter("engine");
		String Gender = request.getParameter("gender");
		String Model = request.getParameter("model");
		String Age = request.getParameter("age");
		String Make = request.getParameter("make");
		String Rto = request.getParameter("rto");
		String Dlno = request.getParameter("dlno");
		String Insurance = request.getParameter("insuranceno"); 
			
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root",""); 
		
		PreparedStatement pst = con.prepareStatement("INSERT INTO data VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,DEFAULT,DEFAULT)");
		 
		 pst.setString(1,User);
		 pst.setNull(2, Types.NULL);
	     pst.setString(3,Name);
	     pst.setString(4,Vehicle);
	     pst.setInt(5,Integer.valueOf(Age));
	     pst.setString(6,Address);
	     pst.setString(7,Gender);
	     pst.setString(8,Rto);
	     pst.setString(9,Engine);
	     pst.setString(10,Dlno);
	     pst.setString(11,Make);
	     pst.setString(12,Model);
	     pst.setString(13,Insurance);
	     int i = pst.executeUpdate();
	     pst.close(); 
         con.close();
	     if(i!=0){
	    	request.setAttribute("message", "Registration Successful");
	 		RequestDispatcher rd= request.getRequestDispatcher("customerdata.jsp");
	 		rd.include(request, response);
	       }
		}
		catch (Exception e){
		      out.println(e);
		    }
	  }
}
