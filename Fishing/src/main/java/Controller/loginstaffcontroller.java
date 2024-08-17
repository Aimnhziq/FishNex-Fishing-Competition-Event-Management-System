package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import dao.StaffDAO;
import model.StaffBean;

/*@WebServlet("/loginCustController")*/
/**
 * Servlet implementation class loginCustController
 */
public class loginstaffcontroller extends HttpServlet {
 private static final long serialVersionUID = 1L;
    private StaffDAO dao;   
    /**
     * @see HttpServlet#HttpServlet()
     */
 public loginstaffcontroller() {
        super();
        dao = new StaffDAO();
       
        // TODO Auto-generated constructor stub
    }

 /**
  * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
  */
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  // TODO Auto-generated method stub
  response.getWriter().append("Served at: ").append(request.getContextPath());
 }

 /**
  * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  */
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  // TODO Auto-generated method stub
   String staffName = request.getParameter("StaffName");
         String staffPass = request.getParameter("StaffPass");
         System.out.println(staffName);
         StaffBean staff = dao.validateLogin(staffName, staffPass);

         if (staff != null) {
             // Login successful
             // Redirect to appropriate dashboard or perform cust-specific actions
             HttpSession session = request.getSession();
             session.setAttribute("StaffID", staff.getStaffID());
             session.setAttribute("StaffName", staff.getStaffName());
             session.setAttribute("StaffPhoneNum", staff.getStaffPhoneNum());
             session.setAttribute("StaffEmail", staff.getStaffEmail());
             session.setAttribute("StaffPass", staff.getStaffPass());




             response.getWriter().write("valid");
         } else {
             // Login failed
             response.getWriter().write("invalid");
         }
     }
  
 }
