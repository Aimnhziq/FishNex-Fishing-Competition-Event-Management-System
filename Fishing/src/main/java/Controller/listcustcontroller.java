package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

import dao.CustDAO;


public class listcustcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustDAO dao;

    public listcustcontroller() {
        super();
        dao = new CustDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setAttribute("customers", CustDAO.getAllCustomers());
        RequestDispatcher view = request.getRequestDispatcher("listacccust.jsp");
        view.forward(request, response);
      }
}
