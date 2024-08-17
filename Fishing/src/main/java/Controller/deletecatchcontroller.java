package Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.CatchDAO;
import dao.CustDAO;

//@WebServlet("/deletecatchcontroller")
public class deletecatchcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CatchDAO catchDAO;
    private CustDAO custDAO;

    public deletecatchcontroller() {
        super();
        catchDAO = new CatchDAO();
        custDAO = new CustDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String catchIDStr = request.getParameter("CatchID");
        String custIDStr = request.getParameter("CustID");

        try {
            if (catchIDStr != null && !catchIDStr.trim().isEmpty()) {
                int catchID = Integer.parseInt(catchIDStr);
                catchDAO.deleteCatch(catchID);
                response.sendRedirect("listeventcontroller");
            } else if (custIDStr != null && !custIDStr.trim().isEmpty()) {
                int custID = Integer.parseInt(custIDStr);
                custDAO.deleteCustomere(custID);
                response.sendRedirect("listeventcontroller");
            } else {
                // Log the issue for debugging
                System.err.println("Error: Neither CatchID nor CustID was provided or they are invalid.");
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "CatchID or CustID parameter is missing or invalid.");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while deleting the record.");
        }
    }
}
