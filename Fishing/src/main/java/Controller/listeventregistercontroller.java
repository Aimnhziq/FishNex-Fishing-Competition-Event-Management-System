package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

import dao.EventDAO;


public class listeventregistercontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EventDAO dao;

    public listeventregistercontroller() {
        super();
        dao = new EventDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setAttribute("event", EventDAO.getAllEvent());
        RequestDispatcher view = request.getRequestDispatcher("listeventregister.jsp");
        view.forward(request, response);
      }
}
