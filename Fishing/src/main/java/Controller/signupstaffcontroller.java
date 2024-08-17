package Controller;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.StaffDAO;
import model.StaffBean;


public class signupstaffcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffDAO dao;

    public signupstaffcontroller() {
        super();
        dao = new StaffDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StaffBean staff = new StaffBean();
        staff.setStaffName(request.getParameter("StaffName"));
        staff.setStaffPhoneNum(Integer.parseInt(request.getParameter("StaffPhoneNum")));
        staff.setStaffEmail(request.getParameter("StaffEmail"));
        staff.setStaffPass(request.getParameter("StaffPass"));
        dao.addStaff(staff);

        // Forward to a success page or redirect to a different page
        request.setAttribute("staffs", StaffDAO.getAllStaff());
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }
}