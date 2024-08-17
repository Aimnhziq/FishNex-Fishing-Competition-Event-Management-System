package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.EventDAO;

/**
 * Servlet implementation class ViewStaffController
 
@WebServlet("/vieweventcontroller")*/
public class vieweventcustcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EventDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public vieweventcustcontroller() {
        super();
        dao = new EventDAO();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int eventID = Integer.parseInt(request.getParameter("EventID"));
        request.setAttribute("c", EventDAO.getEventByID(eventID));
        RequestDispatcher view = request.getRequestDispatcher("vieweventcust.jsp");
        view.forward(request, response);
	}
}
