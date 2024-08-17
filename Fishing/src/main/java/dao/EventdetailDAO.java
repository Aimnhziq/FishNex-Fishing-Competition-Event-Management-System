package dao;

import java.sql.*;
import java.util.*;

import model.EventdetailBean;
import db.ConnectionManager;

public class EventdetailDAO {
    static Connection con = null;
    static PreparedStatement ps = null;
    static Statement stmt = null;
    static ResultSet rs = null;
    private int CustID;
    private int EventID;
    private int EventdetailID;
    private int CustReceipt;

    public void addEventdetail(EventdetailBean bean) {
        CustID = bean.getCustID();
        EventID = bean.getEventID();
        EventdetailID = bean.getEventdetailID();
        CustReceipt = bean.getCustReceipt();

        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Create statement
            ps = con.prepareStatement(
                "INSERT INTO eventdetail (cust_id, event_id, cust_receipt) VALUES (?, ?, ?)");

            ps.setInt(1, CustID);
            ps.setInt(2, EventID);
            ps.setInt(3, CustReceipt);

            // Execute query
            ps.executeUpdate();
            System.out.println("Successfully inserted");

            // Close connection
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<EventdetailBean> getEventDetails(int eventID) {
        List<EventdetailBean> eventDetails = new ArrayList<>();

        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Create statement
            String sql = "SELECT c.cust_id, c.cust_name, e.event_id, e.event_name, ed.cust_receipt " +
	                     "FROM customers c " +
	                     "JOIN eventdetail ed ON c.cust_id = ed.cust_id " +
	                     "JOIN event e ON ed.event_id = e.event_id " +
	                     "WHERE ed.event_id = ? AND ed.cust_receipt IS NOT NULL AND ed.cust_receipt != 0";
            ps = con.prepareStatement(sql);
            ps.setInt(1, eventID);

            // Execute query
            rs = ps.executeQuery();

            while (rs.next()) {
                EventdetailBean bean = new EventdetailBean();
                bean.setCustID(rs.getInt("cust_id"));
                bean.setCustName(rs.getString("cust_name"));
                bean.setEventID(rs.getInt("event_id"));
                bean.setEventName(rs.getString("event_name"));
                bean.setCustReceipt(rs.getInt("cust_receipt"));
                eventDetails.add(bean);
            }

            // Close connection
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return eventDetails;
    }
    
 // Add a method to check if a customer is already registered for an event
    public boolean isCustomerRegistered(int eventID, int custID) {
        boolean isRegistered = false;
        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT * FROM eventdetail WHERE event_id = ? AND cust_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, eventID);
            ps.setInt(2, custID);
            rs = ps.executeQuery();
            if (rs.next()) {
                isRegistered = true;
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isRegistered;
    }

 // Add a method to get the current registration count for an event
    public int getEventRegistrationCount(int eventID) {
        int count = 0;
        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT COUNT(DISTINCT cust_id) AS count FROM eventdetail WHERE event_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, eventID);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
            System.out.println("Registration count from DAO: " + count);
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public static Connection getConnection() throws SQLException {
        String jdbcURL = "jdbc:postgresql://localhost:5432/fishing";
        String username = "postgres";
        String password = "2021898778";
        return DriverManager.getConnection(jdbcURL, username, password);
    }
}
