package Controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.StaffDAO;
import model.StaffBean;


public class updatestaffnewcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffDAO dao;

    public updatestaffnewcontroller() {
        super();
        dao = new StaffDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        int staffID = Integer.parseInt(request.getParameter("StaffID"));
        System.out.println("staff ID : " + staffID);
        request.setAttribute("c", StaffDAO.getStaffByID(staffID));
        RequestDispatcher view = request.getRequestDispatcher("updatestaff.jsp");
        view.forward(request, response);
      }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StaffBean staff = new StaffBean();
        int staffID = Integer.parseInt(request.getParameter("StaffID"));
        System.out.println("staffupdate ID : " + staffID);
        staff.setStaffID(Integer.parseInt(request.getParameter("StaffID")));
        staff.setStaffName(request.getParameter("StaffName"));
        staff.setStaffPhoneNum(Integer.parseInt(request.getParameter("StaffPhoneNum")));
        staff.setStaffEmail(request.getParameter("StaffEmail"));
        staff.setStaffPass(request.getParameter("StaffPass"));

       
        HttpSession session = request.getSession();
        session.setAttribute("StaffID", staff.getStaffID());
        session.setAttribute("StaffName", staff.getStaffName());
        session.setAttribute("StaffPhoneNum", staff.getStaffPhoneNum());
        session.setAttribute("StaffEmail", staff.getStaffEmail());
        session.setAttribute("StaffPass", staff.getStaffPass());
        
        dao.updateStaff(staff);

        request.setAttribute("staff", StaffDAO.getAllStaff());
        RequestDispatcher view = request.getRequestDispatcher("viewstaff.jsp");
        view.forward(request, response);
        
    }
}

