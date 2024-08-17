package Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.StaffDAO;


public class viewstaffnewcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffDAO dao;

    public viewstaffnewcontroller() {
        super();
        dao = new StaffDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String staffPass = request.getParameter("StaffPass");
        request.setAttribute("s", StaffDAO.getStaffByPass(staffPass));
        RequestDispatcher view = request.getRequestDispatcher("viewstaff.jsp");
        view.forward(request, response);
    }
}
