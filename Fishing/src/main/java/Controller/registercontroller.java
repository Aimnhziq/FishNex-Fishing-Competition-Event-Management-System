package Controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.EventdetailBean;
import dao.CustDAO;
import dao.EventdetailDAO;

public class registercontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustDAO dao;
    private EventdetailDAO dao2;

    public registercontroller() {
        super();
        dao = new CustDAO();
        dao2 = new EventdetailDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String custPass = request.getParameter("CustPass");
        // Debugging: Check custPass value
        System.out.println("CustPass: " + custPass);
        
        // Fetch customer details
        request.setAttribute("c", CustDAO.getCustomerByPass(custPass));
        
        // Fetch the number of participants
        String eventIDParam = request.getParameter("EventID");
        if (eventIDParam != null) {
            int eventID = Integer.parseInt(eventIDParam);
            // Debugging: Check eventID value
            System.out.println("Event ID: " + eventID);
            int registrationCount = dao2.getEventRegistrationCount(eventID);
            System.out.println("Registration Count: " + registrationCount);
            request.setAttribute("registrationCount", registrationCount);
        } else {
            System.out.println("EventID parameter is missing");
        }
        
        RequestDispatcher view = request.getRequestDispatcher("registerevent.jsp");
        view.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String eventIDParam = request.getParameter("EventID");
        if (eventIDParam != null) {
            int eventID = Integer.parseInt(eventIDParam);
            System.out.println("Event ID in doPost: " + eventID);
            int custID = Integer.parseInt(request.getParameter("CustID"));
            int custReceipt = Integer.parseInt(request.getParameter("CustReceipt"));

            // Check if the customer is already registered
            if (dao2.isCustomerRegistered(eventID, custID)) {
                request.setAttribute("errorMessage", "Customer is already registered for this event.");
                RequestDispatcher view = request.getRequestDispatcher("registerevent.jsp");
                view.forward(request, response);
                return;
            }

            // Check the current registration count
            if (dao2.getEventRegistrationCount(eventID) >= 20) {
                request.setAttribute("errorMessage", "Registration limit of 20 has been reached.");
                RequestDispatcher view = request.getRequestDispatcher("registerevent.jsp");
                view.forward(request, response);
                return;
            }

            // Proceed with the registration
            EventdetailBean detail = new EventdetailBean();
            detail.setCustID(custID);
            detail.setEventID(eventID);
            detail.setCustReceipt(custReceipt);

            dao2.addEventdetail(detail);

            request.setAttribute("eventdetail", EventdetailDAO.getEventDetails(eventID));
            RequestDispatcher view = request.getRequestDispatcher("homecust.jsp");
            view.forward(request, response);
        } else {
            System.out.println("EventID parameter is missing in doPost");
        }
    }
}