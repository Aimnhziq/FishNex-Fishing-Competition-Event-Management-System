package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.CustDAO;

/**
 * Servlet implementation class ViewStaffController
 */
/*@WebServlet("/ViewStaffController")*/
public class viewlistcustcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewlistcustcontroller() {
        super();
        dao = new CustDAO();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int custID = Integer.parseInt(request.getParameter("CustID"));
        request.setAttribute("c", CustDAO.getCustomerByID(custID));
        RequestDispatcher view = request.getRequestDispatcher("viewlistcust.jsp");
        view.forward(request, response);
	}
}
