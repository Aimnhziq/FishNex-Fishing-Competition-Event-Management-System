package dao;
import java.sql.*;
import java.util.*;
import model.StaffBean;
import db.ConnectionManager;


public class StaffDAO {
    static Connection con = null;
    static PreparedStatement ps = null;
    static Statement stmt = null;
    static ResultSet rs = null;
    private int StaffID;
    private String StaffName;
    private int StaffPhoneNum;
    private String StaffEmail;
    private String StaffPass;

    public void addStaff(StaffBean bean) {
        
        StaffName = bean.getStaffName();
        StaffPhoneNum = bean.getStaffPhoneNum();
        StaffEmail = bean.getStaffEmail();
        StaffPass = bean.getStaffPass();

        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Create statement
            ps = con.prepareStatement(
            		"INSERT INTO staff (staff_name,staff_phonenum,staff_email,staff_pass)VALUES(?,?,?,?)");
            
            ps.setString(1, StaffName);
            ps.setInt(2, StaffPhoneNum);
            ps.setString(3, StaffEmail);
            ps.setString(4, StaffPass);

            // Execute query
            ps.executeUpdate();
            System.out.println("Successfully inserted");

            // Close connection
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


public static List<StaffBean> getAllStaff() {
    List<StaffBean> staff = new ArrayList<StaffBean>();

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        stmt = con.createStatement();
        String sql = "SELECT * FROM staff ORDER BY staff_id";

        // Execute query
        rs = stmt.executeQuery(sql);

        while (rs.next()) {
            StaffBean s = new StaffBean();
            s.setStaffID(rs.getInt("staff_id"));
            s.setStaffName(rs.getString("staff_name"));
            s.setStaffPhoneNum(rs.getInt("staff_phonenum"));
            s.setStaffEmail(rs.getString("staff_email"));
            s.setStaffPass(rs.getString("staff_pass"));
            staff.add(s);
        }

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return staff;
}

public static StaffBean getStaffByID(int StaffID) {
    StaffBean staff = new StaffBean();
    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("SELECT * FROM staff WHERE staff_id= ?");
        ps.setInt(1, StaffID);

        // Execute query
        rs = ps.executeQuery();
        if (rs.next()) {
            staff.setStaffID(rs.getInt("staff_id"));
            staff.setStaffName(rs.getString("staff_name"));
            staff.setStaffPhoneNum(rs.getInt("staff_phonenum"));
            staff.setStaffEmail(rs.getString("staff_email"));
            staff.setStaffPass(rs.getString("staff_pass"));
        }

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return staff;
}


public static StaffBean getStaffByPass(String StaffPass) {
    StaffBean staff = new StaffBean();
    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("SELECT * FROM staff WHERE staff_pass = ?");
        ps.setString(1, StaffPass);

        // Execute query
        rs = ps.executeQuery();
        if (rs.next()) {
            staff.setStaffID(rs.getInt("staff_id"));
            staff.setStaffName(rs.getString("staff_name"));
            staff.setStaffPhoneNum(rs.getInt("staff_phonenum"));
            staff.setStaffEmail(rs.getString("staff_email"));
            staff.setStaffPass(rs.getString("Staff_pass"));
        }

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return staff;
}


public void updateStaff(StaffBean staff) {
    StaffID = staff.getStaffID();
    StaffName = staff.getStaffName();
    StaffPhoneNum = staff.getStaffPhoneNum();
    StaffEmail = staff.getStaffEmail();
    StaffPass = staff.getStaffPass();

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement(
                "UPDATE staff SET staff_name=?, staff_phonenum=?, staff_email=?, staff_pass=? WHERE staff_id=?");
        ps.setString(1, StaffName);
        ps.setInt(2, StaffPhoneNum);
        ps.setString(3, StaffEmail);
        ps.setString(4, StaffPass);
        ps.setInt(5, StaffID);

        // Execute query
        ps.executeUpdate();
        System.out.println("Successfully updated");

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

public void deleteStaff(int staffID) {
    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("DELETE FROM staff WHERE staff_id=?");
        ps.setInt(1, staffID);

        // Execute query
        ps.executeUpdate();

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}


public StaffBean getStaffByName(String StaffName) {
    StaffBean staff = null;

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("SELECT * FROM staff WHERE staff_name = ?");
        ps.setString(1, StaffName);

        // Execute query
        rs = ps.executeQuery();

        // Check if the customer exists
        if (rs.next()) {
            // Create the customer object and populate its properties
            staff = new StaffBean();
            staff.setStaffID(rs.getInt("staff_id"));
            staff.setStaffName(rs.getString("staff_name"));
            staff.setStaffPhoneNum(rs.getInt("staff_phonenum"));
            staff.setStaffEmail(rs.getString("staff_email"));
            staff.setStaffPass(rs.getString("staff_pass"));
        }
        con.close();
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle the exception accordingly
    } 

    return staff;
}

public boolean authenticateStaff(String staffName, String staffPass) {
    StaffBean staff = getStaffByName(staffName);
    return staff != null && staff.getStaffPass().equals(staffPass);
}

public StaffBean validateLogin(String staffName, String staffPass) {
    StaffBean staffs = null;

    try {
      con = ConnectionManager.getConnection();
        String query = "SELECT * FROM staff WHERE staff_name = ? AND staff_pass = ?";
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setString(1, staffName);
        stmt.setString(2, staffPass);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            staffs = new StaffBean();
            staffs.setStaffID(rs.getInt("staff_id"));
            staffs.setStaffEmail(rs.getString("staff_email"));
            staffs.setStaffName(rs.getString("staff_name"));
            staffs.setStaffPhoneNum(rs.getInt("staff_phonenum"));
            staffs.setStaffPass(rs.getString("staff_pass"));
        }

        rs.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return staffs;
}

public static Connection getConnection() throws SQLException {
    String jdbcURL = "jdbc:postgresql://localhost:5432/fishing;user=postgres;password=2021898778;encrypt=true;trustServerCertificate=true;";
    String username = "postgres";
    String password = "2021898778";
    return DriverManager.getConnection(jdbcURL, username, password);
}


}
