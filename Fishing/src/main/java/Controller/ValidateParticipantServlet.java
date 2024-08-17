package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import db.ConnectionManager;

/*@WebServlet("/ValidateParticipantServlet")*/
public class ValidateParticipantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	int custID = Integer.parseInt(request.getParameter("CustID"));
    	int eventID = Integer.parseInt(request.getParameter("EventID"));
        response.setContentType("text/plain");

        try {
            // Get connection
            Connection con = ConnectionManager.getConnection();

            // Create statement
            String query = "SELECT eventdetail_id FROM eventdetail WHERE cust_id = ? AND event_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, custID);
            ps.setInt(2, eventID);
            ResultSet rs = ps.executeQuery();

            PrintWriter out = response.getWriter();
            if (rs.next()) {
                out.write("valid");
            } else {
                out.write("invalid");
            }

            // Close resources
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
