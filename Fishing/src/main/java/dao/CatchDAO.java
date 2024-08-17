package dao;

import java.sql.*;
import java.util.*;
import model.CatchBean;
import model.CustomerBean;
import db.ConnectionManager;

public class CatchDAO {
    static Connection con = null;
    static PreparedStatement ps = null;
    static Statement stmt = null;
    static ResultSet rs = null;
    private int CatchID;
    private int CustID;
    private String CustName;
    private int EventdetailID;
    private String CatchName;
    private double CatchWeight;
    private double CatchLength;
    private int EventID;

    public void addCatch(CatchBean bean) {
        CustID = bean.getCustID();
        CatchName = bean.getCatchName();
        CatchWeight = bean.getCatchWeight();
        CatchLength = bean.getCatchLength();
        EventID = bean.getEventID();
        EventdetailID = bean.getEventdetailID();

        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Create statement
            // Insert new record into catch table and retrieve the generated catch_id
            ps = con.prepareStatement(
                    "INSERT INTO catch (catch_name, catch_weight, catch_length) VALUES (?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, CatchName);
            ps.setDouble(2, CatchWeight);
            ps.setDouble(3, CatchLength);
            ps.executeUpdate();

            // Retrieve generated catch_id
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                CatchID = rs.getInt(1);  // Get the generated catch_id
            }
            
         // Insert data into eventdetail table using the retrieved catch_id
            ps = con.prepareStatement(
                    "INSERT INTO eventdetail (cust_id, event_id, cust_receipt) VALUES (?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, CustID);
            ps.setInt(2, EventID);
            ps.setInt(3, 0); // assuming cust_receipt is set to 0 or some default value
            ps.executeUpdate();

            // Retrieve generated eventdetail_id
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                EventdetailID = rs.getInt(1);  // Get the generated eventdetail_id
            }

            // Insert data into leaderboard table using the retrieved eventdetail_id and catch_id
            ps = con.prepareStatement(
                    "INSERT INTO leaderboard (eventdetail_id, catch_id, leaderboard_point) VALUES (?, ?, ?)");
            ps.setInt(1, EventdetailID);
            ps.setInt(2, CatchID);
            ps.setDouble(3, 0.0); // assuming initial leaderboard_point is set to 0
            ps.executeUpdate();

            System.out.println("Successfully inserted");

            // Close connection
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    

 // New method to get catches by eventID
    public static List<CatchBean> getCatchesByEventID(int eventID) {
        List<CatchBean> catches = new ArrayList<>();
        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Create statement
            String sql = "SELECT c.cust_id, c.cust_name, ca.catch_id, ca.catch_name, ca.catch_weight, ca.catch_length " +
                         "FROM customers c " +
                         "JOIN eventdetail ed ON c.cust_id = ed.cust_id " +
                         "JOIN leaderboard l ON ed.eventdetail_id = l.eventdetail_id " +
                         "JOIN catch ca ON l.catch_id = ca.catch_id " +
                         "WHERE ed.event_id = ? " +
                         "ORDER BY ca.catch_weight DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, eventID);

            // Execute query
            rs = ps.executeQuery();

            while (rs.next()) {
                CatchBean c = new CatchBean();
                c.setCatchID(rs.getInt("catch_id"));
                c.setCustID(rs.getInt("cust_id"));
                c.setCustName(rs.getString("cust_name"));
                c.setCatchName(rs.getString("catch_name"));
                c.setCatchWeight(rs.getDouble("catch_weight"));
                c.setCatchLength(rs.getDouble("catch_length"));
                catches.add(c);
            }

            // Close connection
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return catches;
    }

    public static CatchBean getCatchByID(int catchID) {
        CatchBean catchs = new CatchBean();
        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Create statement
            String sql = "SELECT ca.catch_id, c.cust_id, c.cust_name, ca.catch_name, ca.catch_weight, ca.catch_length " +
                         "FROM customers c " +
                         "JOIN eventdetail ed ON c.cust_id = ed.cust_id " +
                         "JOIN leaderboard l ON ed.eventdetail_id = l.eventdetail_id " +
                         "JOIN catch ca ON l.catch_id = ca.catch_id " +
                         "WHERE ca.catch_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, catchID);

            // Execute query
            rs = ps.executeQuery();
            if (rs.next()) {
                catchs.setCatchID(rs.getInt("catch_id"));
                catchs.setCustID(rs.getInt("cust_id"));
                catchs.setCustName(rs.getString("cust_name"));
                catchs.setCatchName(rs.getString("catch_name"));
                catchs.setCatchWeight(rs.getDouble("catch_weight"));
                catchs.setCatchLength(rs.getDouble("catch_length"));
            }

            // Close connection
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return catchs;
    }
    
    public static List<CatchBean> getAllCatch() {
        List<CatchBean> catchs = new ArrayList<>();

        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Create statement
            stmt = con.createStatement();
            String sql = "SELECT ca.catch_id, c.cust_id, c.cust_name, ca.catch_name, ca.catch_weight, ca.catch_length " +
                         "FROM customers c " +
                         "JOIN eventdetail ed ON c.cust_id = ed.cust_id " +
                         "JOIN catch ca ON ed.catch_id = ca.catch_id " +
                         "ORDER BY ca.catch_weight DESC";

            // Execute query
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                CatchBean c = new CatchBean();
                c.setCatchID(rs.getInt("catch_id"));
                c.setCustID(rs.getInt("cust_id"));
                c.setCustName(rs.getString("cust_name"));
                c.setCatchName(rs.getString("catch_name"));
                c.setCatchWeight(rs.getDouble("catch_weight"));
                c.setCatchLength(rs.getDouble("catch_length"));
                catchs.add(c);
            }

            // Close connection
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return catchs;
    }

    public void updateCatch(CatchBean catchs) {
        CatchID = catchs.getCatchID();
        CatchWeight = catchs.getCatchWeight();
        CatchLength = catchs.getCatchLength();

        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Create statement
            ps = con.prepareStatement(
                    "UPDATE catch SET catch_weight=?, catch_length=? WHERE catch_id=?");
            
            ps.setDouble(1, CatchWeight);
            ps.setDouble(2, CatchLength);
            ps.setInt(3, CatchID);

            // Execute query
            ps.executeUpdate();
            System.out.println("Successfully updated");

            // Close connection
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteCatch(int catchID) {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Start a transaction
            con.setAutoCommit(false);

            // Delete from eventdetail table where catch_id matches
            ps = con.prepareStatement("DELETE FROM leaderboard WHERE catch_id = ?");
            ps.setInt(1, catchID);
            ps.executeUpdate();
            ps.close();

            // Delete from catch table
            ps = con.prepareStatement("DELETE FROM catch WHERE catch_id = ?");
            ps.setInt(1, catchID);
            ps.executeUpdate();
            ps.close();

            // Commit the transaction
            con.commit();
        } catch (SQLException e) {
            try {
                // Rollback the transaction in case of an error
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                // Close connection
                if (con != null) {
                    con.setAutoCommit(true);
                    con.close();
                }
            } catch (SQLException closeEx) {
                closeEx.printStackTrace();
            }
        }
    }
    
    public static CatchBean getCatchByEventAndCust(int eventID, int custID) {
        CatchBean c = new CatchBean(); // Initialize the CatchBean object to be returned

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Create statement
            String sql = "SELECT cu.cust_id, cu.cust_name " +
                         "FROM customers cu " +
                         "JOIN eventdetail ed ON cu.cust_id = ed.cust_id " +
                         "WHERE ed.event_id = ? AND cu.cust_id = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, eventID);
            ps.setInt(2, custID);

            // Execute query
            rs = ps.executeQuery();
            if (rs.next()) {
                c.setCustID(rs.getInt("cust_id"));
                c.setCustName(rs.getString("cust_name"));
            } else {
                // Handle case where no results are found
                c = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Ensure that resources are closed
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return c; // Return the CatchBean object, which may be null if no result is found
    }

    public static Connection getConnection() throws SQLException {
        String jdbcURL = "jdbc:postgresql://localhost:5432/fishing;user=postgres;password=2021898778;encrypt=true;trustServerCertificate=true;";
        String username = "postgres";
        String password = "2021898778";
        return DriverManager.getConnection(jdbcURL, username, password);
    }
}
