package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

import dao.CatchDAO;


public class listcatchmaincontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CatchDAO dao;

    public listcatchmaincontroller() {
        super();
        dao = new CatchDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setAttribute("catchs", CatchDAO.getAllCatch());
        RequestDispatcher view = request.getRequestDispatcher("listcatchmain.jsp");
        view.forward(request, response);
      }
}
