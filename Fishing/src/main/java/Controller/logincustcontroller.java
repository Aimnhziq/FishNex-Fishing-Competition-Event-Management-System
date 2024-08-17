package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import dao.CustDAO;
import model.CustomerBean;

/**
 * Servlet implementation class loginCustController
 */
/*@WebServlet("/logincustcontroller")*/
public class logincustcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustDAO dao;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public logincustcontroller() {
        super();
        dao = new CustDAO();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String custName = request.getParameter("CustName");
        String custPass = request.getParameter("CustPass");
        CustomerBean cust = dao.validateLogin(custName, custPass);

        if (cust != null) {
            // Login successful
            HttpSession session = request.getSession();
            session.setAttribute("CustID", cust.getCustID());
            session.setAttribute("CustName", cust.getCustName());
            session.setAttribute("CustPhoneNum", cust.getCustPhoneNum());
            session.setAttribute("CustEmail", cust.getCustEmail());
            session.setAttribute("CustPass", cust.getCustPass());

            response.getWriter().write("valid");
        } else {
            // Login failed
            response.getWriter().write("invalid");
        }
    }
}
