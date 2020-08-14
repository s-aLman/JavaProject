import java.sql.*;
import java.io.PrintWriter;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/process2")
public class process2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session1= request.getSession(); 
		PrintWriter out = response.getWriter(); 
		try {
			int uid= (int) session1.getAttribute("id");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root",""); 
			
			 PreparedStatement pst = con.prepareStatement("UPDATE data SET status=? WHERE id=?");
			 pst.setString(1, "Rejected");
			 pst.setInt(2,uid);
		     pst.executeUpdate();
		     pst.close(); 
	         con.close();
	         
		     request.setAttribute("message", "Request Processed Successfully");
		 	 RequestDispatcher rd= request.getRequestDispatcher("assign.jsp");
		 	 rd.include(request, response);
		}
			catch (Exception e){
				 out.println(e);
			    }
	}

}
