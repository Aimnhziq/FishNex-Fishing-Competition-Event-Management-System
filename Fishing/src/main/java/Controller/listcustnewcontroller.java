package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;


import dao.EventdetailDAO;


public class listcustnewcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EventdetailDAO dao;

    public listcustnewcontroller() {
        super();
        dao = new EventdetailDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int eventID = Integer.parseInt(request.getParameter("EventID"));
        System.out.println("eventnew ID : " + eventID);
 
        request.setAttribute("eventdetails", EventdetailDAO.getEventDetails(eventID));
        RequestDispatcher view = request.getRequestDispatcher("listcustnew.jsp");
        view.forward(request, response);
    }
}