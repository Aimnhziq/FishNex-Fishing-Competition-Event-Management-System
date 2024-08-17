package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import dao.EventDAO;
import dao.EventdetailDAO;
import model.EventdetailBean;
import model.EventBean; // Ensure you have an EventBean model class

//@WebServlet("/listeventcustcontroller")
public class listeventcustcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EventDAO eventDAO;
    private EventdetailDAO eventDetailDAO;

    public listeventcustcontroller() {
        super();
        eventDAO = new EventDAO();
        eventDetailDAO = new EventdetailDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<EventBean> events = EventDAO.getAllEvent();
        Map<Integer, Integer> registrationCounts = new HashMap<>();

        for (EventBean event : events) {
            int registrationCount = eventDetailDAO.getEventRegistrationCount(event.getEventID());
            registrationCounts.put(event.getEventID(), registrationCount);
        }

        request.setAttribute("event", events);
        request.setAttribute("registrationCounts", registrationCounts);

        RequestDispatcher view = request.getRequestDispatcher("listeventcust.jsp");
        view.forward(request, response);
    }
}
