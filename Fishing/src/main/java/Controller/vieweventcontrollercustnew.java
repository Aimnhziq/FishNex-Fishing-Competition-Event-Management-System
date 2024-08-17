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
public class vieweventcontrollercustnew extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EventDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public vieweventcontrollercustnew() {
        super();
        dao = new EventDAO();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int eventID = Integer.parseInt(request.getParameter("EventID"));
		System.out.println("catchcust out ID : " + eventID);
        request.setAttribute("c", EventDAO.getEventByID(eventID));
        RequestDispatcher view = request.getRequestDispatcher("vieweventcustnew.jsp");
        view.forward(request, response);
	}
}
