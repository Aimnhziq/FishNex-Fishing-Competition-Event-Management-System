package Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.StaffDAO;

@WebServlet("/deletestaffcontroller")
public class deletestaffcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffDAO dao;

    public deletestaffcontroller() {
        super();
        dao = new StaffDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int staffID = Integer.parseInt(request.getParameter("StaffID"));
        dao.deleteStaff(staffID);;
        request.setAttribute("staff", StaffDAO.getAllStaff());
        RequestDispatcher view = request.getRequestDispatcher("loginstaff.jsp");
        view.forward(request, response);
    }
}


