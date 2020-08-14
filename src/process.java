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


@WebServlet("/process")
public class process extends HttpServlet {
	private static final long serialVersionUID = 1L;

	   private int j; 
	   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session1= request.getSession(); 
		PrintWriter out = response.getWriter(); 
		try {
			int uid= (int) session1.getAttribute("id");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root","");
			 
			 PreparedStatement ps1 = con.prepareStatement("select count(plateno) from data where status='Approved'");
			 ResultSet rs1= ps1.executeQuery();
			 rs1.next();
			 j =  ((Number) rs1.getObject(1)).intValue();
			 j+=1000;
			 PreparedStatement ps = con.prepareStatement("select rto from data where id=?");
			 ps.setInt(1,uid);
			 ResultSet rs = ps.executeQuery();
			 	rs.next();
			 	String Rto = rs.getString("rto");
				String plate=null;
				if(Rto.equals("Chennai")) {
					plate="TN-11-"+j;
				}
				if(Rto.equals("Hyderabad")) {
					plate="AP-42-"+j;
				}
				if(Rto.equals("Delhi")) {
					plate="DL-03-"+j;
				}
				if(Rto.equals("Pune")) {
					plate="MH-54-"+j;
				}
				if(Rto.equals("Bangalore")) {
					plate="KA-15-"+j;
				}
			 PreparedStatement pst = con.prepareStatement("UPDATE data SET status=?, plateno=? WHERE id=?");
			 pst.setString(1, "Approved");
			 pst.setString(2,plate);
			 pst.setInt(3,uid);
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
