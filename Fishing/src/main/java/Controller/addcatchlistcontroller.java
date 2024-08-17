package Controller;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.CatchDAO;
import model.CatchBean;

//@WebServlet("/addcatchlistcontroller")
public class addcatchlistcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CatchDAO dao;

    public addcatchlistcontroller() {
        super();
        dao = new CatchDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int eventID = Integer.parseInt(request.getParameter("EventID"));
        System.out.println("eventaddcatch ID : " + eventID);
        int custID = Integer.parseInt(request.getParameter("CustID"));
        System.out.println("custaddcatch ID : " + custID);

        // Add attributes to request
        request.setAttribute("c", CatchDAO.getCatchByEventAndCust(eventID, custID));
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("addcatchlist.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CatchBean catchs = new CatchBean();
        int eventID = Integer.parseInt(request.getParameter("EventID"));
        System.out.println("event ID : " + eventID);
        int custID = Integer.parseInt(request.getParameter("CustID"));
        System.out.println("cust ID : " + custID);
        catchs.setCustID(Integer.parseInt(request.getParameter("CustID")));
        catchs.setCatchName(request.getParameter("CatchName"));
        catchs.setCatchWeight(Double.parseDouble(request.getParameter("CatchWeight")));
        catchs.setCatchLength(Double.parseDouble(request.getParameter("CatchLength")));
        catchs.setEventID(Integer.parseInt(request.getParameter("EventID")));
        dao.addCatch(catchs);

        // Forward to a success page or redirect to a different page
        request.setAttribute("catch", CatchDAO.getCatchesByEventID(eventID));
        response.sendRedirect("listeventcontroller");
    }
}
