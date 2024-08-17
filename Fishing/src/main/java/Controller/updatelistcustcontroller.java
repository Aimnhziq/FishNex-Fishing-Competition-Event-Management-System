package Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.CustDAO;
import model.CustomerBean;


public class updatelistcustcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustDAO dao;

    public updatelistcustcontroller() {
        super();
        dao = new CustDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        int custID = Integer.parseInt(request.getParameter("CustID"));
        System.out.println("cust ID : " + custID);
        request.setAttribute("c", CustDAO.getCustomerByID(custID));
        RequestDispatcher view = request.getRequestDispatcher("updatecust.jsp");
        view.forward(request, response);
      }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CustomerBean customer = new CustomerBean();
        int custID = Integer.parseInt(request.getParameter("CustID"));
        System.out.println("cust ID : " + custID);
        customer.setCustID(Integer.parseInt(request.getParameter("CustID")));
        customer.setCustName(request.getParameter("CustName"));
        customer.setCustPhoneNum(Integer.parseInt(request.getParameter("CustPhoneNum")));
        customer.setCustEmail(request.getParameter("CustEmail"));
        customer.setCustPass(request.getParameter("CustPass"));

       
        HttpSession session = request.getSession();
        session.setAttribute("CustID", customer.getCustID());
        session.setAttribute("CustName", customer.getCustName());
        session.setAttribute("CustPhoneNum", customer.getCustPhoneNum());
        session.setAttribute("CustEmail", customer.getCustEmail());
        session.setAttribute("CustPass", customer.getCustPass());
        
        dao.updateCustomer(customer);

        request.setAttribute("customers", CustDAO.getAllCustomers());
        RequestDispatcher view = request.getRequestDispatcher("viewcust.jsp");
        view.forward(request, response);
        
    }
}

