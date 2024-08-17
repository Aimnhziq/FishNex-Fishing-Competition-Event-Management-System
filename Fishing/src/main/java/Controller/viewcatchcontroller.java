package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.CatchDAO;

/**
 * Servlet implementation class ViewStaffController
 */
public class viewcatchcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CatchDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewcatchcontroller() {
        super();
        dao = new CatchDAO();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int catchID = Integer.parseInt(request.getParameter("CatchID"));
        request.setAttribute("c", CatchDAO.getCatchByID(catchID));
        RequestDispatcher view = request.getRequestDispatcher("viewcatch.jsp");
        view.forward(request, response);
	}
}
