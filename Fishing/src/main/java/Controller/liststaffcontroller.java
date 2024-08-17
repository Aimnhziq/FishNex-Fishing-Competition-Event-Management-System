package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

import dao.StaffDAO;


public class liststaffcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffDAO dao;

    public liststaffcontroller() {
        super();
        dao = new StaffDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setAttribute("staff", StaffDAO.getAllStaff());
        RequestDispatcher view = request.getRequestDispatcher("listaccstaff.jsp");
        view.forward(request, response);
      }
}
