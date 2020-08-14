

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/check")
public class check extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String val = request.getParameter("uID");
		int Id =Integer.parseInt(val);  
		HttpSession session1= request.getSession();
		String val1= (String)session1.getAttribute("value");
		
		if(val1.equals("Pending")) {
		response.sendRedirect("status.jsp");
		session1.setAttribute("id", Id);
		}
		else {
			 session1.setAttribute("id", Id);
			 RequestDispatcher rd= request.getRequestDispatcher("assign.jsp");
		 	 rd.include(request, response);
		}
	}

}
