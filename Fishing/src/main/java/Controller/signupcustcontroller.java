package Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.CustDAO;
import model.CustomerBean;


public class signupcustcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustDAO dao;

    public signupcustcontroller() {
        super();
        dao = new CustDAO();
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CustomerBean customer = new CustomerBean();
        customer.setCustName(request.getParameter("CustName"));
        customer.setCustPhoneNum(Integer.parseInt(request.getParameter("CustPhoneNum")));
        customer.setCustEmail(request.getParameter("CustEmail"));
        customer.setCustPass(request.getParameter("CustPass"));

        dao.addCustomer(customer);

        // Forward to a success page or redirect to a different page
        request.setAttribute("customers", CustDAO.getAllCustomers());
        RequestDispatcher  view = request.getRequestDispatcher("logincust.jsp");
        view.forward(request, response);
    }
}


