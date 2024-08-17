package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

import dao.CatchDAO;


public class listcatchcustcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CatchDAO dao;

    public listcatchcustcontroller() {
        super();
        dao = new CatchDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int eventID = Integer.parseInt(request.getParameter("EventID"));
        System.out.println("out ID : " + eventID);
        request.setAttribute("catchs", CatchDAO.getCatchesByEventID(eventID));
        RequestDispatcher view = request.getRequestDispatcher("listcatchcustnew.jsp");
        view.forward(request, response);
    }
}