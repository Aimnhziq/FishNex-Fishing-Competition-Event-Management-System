package Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.EventDAO;

@WebServlet("/deleteevent")
public class deleteeventcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EventDAO dao;

    public deleteeventcontroller() {
        super();
        dao = new EventDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int eventID = Integer.parseInt(request.getParameter("EventID"));
            dao.deleteEvent(eventID);
            request.setAttribute("event", EventDAO.getAllEvent());
            response.sendRedirect("listeventcontroller");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Event ID");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while deleting the event");
        }
    }
}
