package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.CatchDAO;
import model.CatchBean;

/**
 * Servlet implementation class UpdateStaffController
 */

public class updatecatchcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CatchDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatecatchcontroller() {
        super();
        dao = new CatchDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int catchID = Integer.parseInt(request.getParameter("CatchID"));
        request.setAttribute("c", CatchDAO.getCatchByID(catchID));
        RequestDispatcher view = request.getRequestDispatcher("updatecatch.jsp");
        view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CatchBean catchs = new CatchBean();
		catchs.setCatchID(Integer.parseInt(request.getParameter("CatchID")));
		catchs.setCatchWeight(Double.parseDouble(request.getParameter("CatchWeight")));
        catchs.setCatchLength(Double.parseDouble(request.getParameter("CatchLength")));
        
		dao.updateCatch(catchs);
		
		
        response.sendRedirect("listeventcontroller");
		
	}

}
