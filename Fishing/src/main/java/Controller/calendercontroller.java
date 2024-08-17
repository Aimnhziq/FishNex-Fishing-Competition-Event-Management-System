package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import dao.EventDAO;
import model.EventBean;

/*@WebServlet("/calendercontroller")*/
public class calendercontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EventDAO dao;

    public calendercontroller() {
        super();
        dao = new EventDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<EventBean> events = EventDAO.getAllEvent();
        request.setAttribute("event", events);

        // Debug output
        for (EventBean event : events) {
            System.out.println("Event: " + event.getEventName() + " on " + event.getEventDate());
        }

        RequestDispatcher view = request.getRequestDispatcher("calender.jsp");
        view.forward(request, response);
    }
}
