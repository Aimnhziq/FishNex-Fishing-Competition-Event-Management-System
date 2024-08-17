package Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.CustDAO;


public class deletecustcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustDAO dao;

    public deletecustcontroller() {
        super();
        dao = new CustDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int custID = Integer.parseInt(request.getParameter("CustID"));
        dao.deleteCustomer(custID);
        request.setAttribute("customers", CustDAO.getAllCustomers());
        RequestDispatcher view = request.getRequestDispatcher("homeindex.jsp");
        view.forward(request, response);
    }
}

