package dao;
import java.sql.*;
import java.util.*;
import model.CustomerBean;
import model.EventBean;
import model.StaffBean;
import db.ConnectionManager;


public class CustDAO {
    static Connection con = null;
    static PreparedStatement ps = null;
    static Statement stmt = null;
    static ResultSet rs = null;
    private int CustID;
    private String CustName;
    private int CustPhoneNum;
    private String CustEmail;
    private String CustPass;


    public void addCustomer(CustomerBean bean) {
        
        CustName = bean.getCustName();
        CustPhoneNum = bean.getCustPhoneNum();
        CustEmail = bean.getCustEmail();
        CustPass = bean.getCustPass();


        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Create statement
            ps = con.prepareStatement(
            		"INSERT INTO customers (cust_name,cust_phonenum,cust_email,cust_pass)VALUES(?,?,?,?)");
            
            ps.setString(1, CustName);
            ps.setInt(2, CustPhoneNum);
            ps.setString(3, CustEmail);
            ps.setString(4, CustPass);


            // Execute query
            ps.executeUpdate();
            System.out.println("Successfully inserted");

            // Close connection
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


public static List<CustomerBean> getAllCustomers() {
    List<CustomerBean> customers = new ArrayList<CustomerBean>();

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        stmt = con.createStatement();
        String sql = "SELECT * FROM customers ORDER BY cust_id";

        // Execute query
        rs = stmt.executeQuery(sql);

        while (rs.next()) {
            CustomerBean c = new CustomerBean();
            c.setCustID(rs.getInt("cust_id"));
            c.setCustName(rs.getString("cust_name"));
            c.setCustPhoneNum(rs.getInt("cust_phonenum"));
            c.setCustEmail(rs.getString("cust_email"));
            c.setCustPass(rs.getString("cust_pass"));
            customers.add(c);
        }

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return customers;
}

public static CustomerBean getCustomerByID(int CustID) {
    CustomerBean customer = new CustomerBean();
    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("SELECT * FROM customers WHERE cust_id= ?");
        ps.setInt(1, CustID);

        // Execute query
        rs = ps.executeQuery();
        if (rs.next()) {
            customer.setCustID(rs.getInt("cust_id"));
            customer.setCustName(rs.getString("cust_name"));
            customer.setCustPhoneNum(rs.getInt("cust_phonenum"));
            customer.setCustEmail(rs.getString("cust_email"));
            customer.setCustPass(rs.getString("cust_pass"));
        }

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return customer;
}




public static CustomerBean getCustomerByPass(String CustPass) {
    CustomerBean customer = new CustomerBean();
    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("SELECT * FROM customers WHERE cust_pass = ?");
        ps.setString(1, CustPass);

        // Execute query
        rs = ps.executeQuery();
        if (rs.next()) {
            customer.setCustID(rs.getInt("cust_id"));
            customer.setCustName(rs.getString("cust_name"));
            customer.setCustPhoneNum(rs.getInt("cust_phonenum"));
            customer.setCustEmail(rs.getString("cust_email"));
            customer.setCustPass(rs.getString("cust_pass"));
        }

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return customer;
}

public void updateCustomer(CustomerBean customer) {
    CustID = customer.getCustID();
    CustName = customer.getCustName();
    CustPhoneNum = customer.getCustPhoneNum();
    CustEmail = customer.getCustEmail();
    CustPass = customer.getCustPass();

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement(
                "UPDATE customers SET cust_name=?, cust_phonenum=?, cust_email=?, cust_pass=? WHERE cust_id=?");
        ps.setString(1, CustName);
        ps.setInt(2, CustPhoneNum);
        ps.setString(3, CustEmail);
        ps.setString(4, CustPass);
        ps.setInt(5, CustID);

        // Execute query
        ps.executeUpdate();
        System.out.println("Successfully updated");

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}



public void deleteCustomer(int custID) {
    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("DELETE FROM customers WHERE cust_id=?");
        ps.setInt(1, custID);

        // Execute query
        ps.executeUpdate();

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}


public void deleteCustomers(int custID) throws SQLException {
    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Start a transaction
        con.setAutoCommit(false);

        // Delete from eventdetail table where cust_id matches
        ps = con.prepareStatement("DELETE FROM eventdetail WHERE cust_id = ?");
        ps.setInt(1, custID);
        ps.executeUpdate();
        ps.close();

        // Delete from customer table
        ps = con.prepareStatement("DELETE FROM customers WHERE cust_id = ?");
        ps.setInt(1, custID);
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
        throw e;
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

public void deleteCustomere(int custID) throws SQLException {
    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Start a transaction
        con.setAutoCommit(false);

        // Delete from eventdetail table where cust_id matches
        ps = con.prepareStatement("DELETE FROM eventdetail WHERE cust_id = ?");
        ps.setInt(1, custID);
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
        throw e;
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

public CustomerBean getCustomerByName(String CustName) {
    CustomerBean customer = null;

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("SELECT * FROM customers WHERE cust_name = ?");
        ps.setString(1, CustName);

        // Execute query
        rs = ps.executeQuery();

        // Check if the customer exists
        if (rs.next()) {
            // Create the customer object and populate its properties
            customer = new CustomerBean();
            customer.setCustID(rs.getInt("cust_id"));
            customer.setCustName(rs.getString("cust_name"));
            customer.setCustPhoneNum(rs.getInt("cust_phonenum"));
            customer.setCustEmail(rs.getString("cust_email"));
            customer.setCustPass(rs.getString("cust_pass"));
        }
        con.close();
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle the exception accordingly
    } 

    return customer;
}





public boolean authenticateCustomer(String custName, String custPass) {
    CustomerBean customer = getCustomerByName(custName);
    return customer != null && customer.getCustPass().equals(custPass);
}

public CustomerBean validateLogin(String custName, String custPass) {
    CustomerBean cust = null;

    try {
      con = ConnectionManager.getConnection();
        String query = "SELECT * FROM customers WHERE cust_name = ? AND cust_pass = ?";
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setString(1, custName);
        stmt.setString(2, custPass);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            cust = new CustomerBean();
            cust.setCustID(rs.getInt("cust_id"));
            cust.setCustEmail(rs.getString("cust_email"));
            cust.setCustName(rs.getString("cust_name"));
            cust.setCustPhoneNum(rs.getInt("cust_phonenum"));
            cust.setCustPass(rs.getString("cust_pass"));

        }

        rs.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return cust;
}

public static Connection getConnection() throws SQLException {
    String jdbcURL = "jdbc:postgresql://localhost:5432/fishing;user=postgres;password=2021898778;encrypt=true;trustServerCertificate=true;";
    String username = "postgres";
    String password = "2021898778";
    return DriverManager.getConnection(jdbcURL, username, password);
}


}
