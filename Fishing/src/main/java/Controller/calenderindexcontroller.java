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
public class calenderindexcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EventDAO dao;

    public calenderindexcontroller() {
        super();
        dao = new EventDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<EventBean> events = EventDAO.getAllEvent();
        request.setAttribute("event", events);
        RequestDispatcher view = request.getRequestDispatcher("calenderindex.jsp"); // Ensure this points to your calendar JSP
        view.forward(request, response);
    }
}
