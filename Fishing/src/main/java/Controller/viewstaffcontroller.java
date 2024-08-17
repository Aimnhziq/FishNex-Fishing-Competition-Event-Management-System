package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.StaffDAO;

/**
 * Servlet implementation class ViewStaffController
 */
@WebServlet("/ViewStaffController")
public class viewstaffcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StaffDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewstaffcontroller() {
        super();
        dao = new StaffDAO();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int staffID = Integer.parseInt(request.getParameter("StaffID"));
        request.setAttribute("c", StaffDAO.getStaffByID(staffID));
        RequestDispatcher view = request.getRequestDispatcher("viewacc.jsp");
        view.forward(request, response);
	}
}
