package Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.CustDAO;


public class viewcustcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustDAO dao;

    public viewcustcontroller() {
        super();
        dao = new CustDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String custPass = request.getParameter("CustPass");
        request.setAttribute("c", CustDAO.getCustomerByPass(custPass));
        RequestDispatcher view = request.getRequestDispatcher("viewCust.jsp");
        view.forward(request, response);
    }
}
