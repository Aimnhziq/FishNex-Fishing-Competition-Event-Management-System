package dao;
import java.sql.*;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import java.util.*;
import model.EventBean;
import db.ConnectionManager;


import java.util.Base64;


public class EventDAO {
    static Connection con = null;
    static PreparedStatement ps = null;
    static Statement stmt = null;
    static ResultSet rs = null;
    private int EventID;
    private String EventName;
    private String EventFee;
    private String EventDetail;
    private String EventLocation;
    private java.sql.Date EventDate;
    private Time StartTime;
    private Time EndTime;
    private byte[] EventPicture;

    public void addEvent(EventBean bean, byte[] imageData) {
        
        EventName = bean.getEventName();
        EventFee = bean.getEventFee();
        EventDetail = bean.getEventDetail();
        EventLocation = bean.getEventLocation();
        EventDate = (Date) bean.getEventDate();
        StartTime = bean.getStartTime();
        EndTime = bean.getEndTime();
        EventPicture = bean.getEventPicture();

        try {
            // Get connection
            con = ConnectionManager.getConnection();

            // Create statement
            ps = con.prepareStatement(
            		"INSERT INTO event (event_name, event_fee, event_detail, event_location, event_date, start_time, end_time, event_picture) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)");
            
            ps.setString(1, EventName);
            ps.setString(2, EventFee);
            ps.setString(3, EventDetail);
            ps.setString(4, EventLocation);
            ps.setDate(5, EventDate);
            ps.setTime(6, StartTime);
            ps.setTime(7, EndTime);
            ps.setBytes(8, imageData);
         // Set picture data
           
          

            // Execute quer

            // Execute query
            ps.executeUpdate();
            System.out.println("Successfully inserted");

            // Close connection
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static List<EventBean> getAllEvent() {
        List<EventBean> eventList = new ArrayList<>();

        try {
            con = ConnectionManager.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM event ORDER BY event_date, start_time";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                EventBean event = new EventBean();
                event.setEventID(rs.getInt("event_id"));
                event.setEventName(rs.getString("event_name"));
                event.setEventFee(rs.getString("event_fee"));
                event.setEventLocation(rs.getString("event_location"));
                event.setEventDate(rs.getDate("event_date"));
                event.setStartTime(rs.getTime("start_time"));
                event.setEndTime(rs.getTime("end_time"));

                byte[] imageData = rs.getBytes("event_picture");
                if (imageData != null && imageData.length > 0) {
                    String base64Image = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageData);
                    event.setEventPictureBase64(base64Image);
                }

                eventList.add(event);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return eventList;
    }
	

public static EventBean getEventByID(int EventID) {
    EventBean event = new EventBean();
    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("SELECT * FROM event WHERE event_id= ?");
        ps.setInt(1, EventID);

        // Execute query
        rs = ps.executeQuery();
        if (rs.next()) {
        	event.setEventID(rs.getInt("event_id"));
        	event.setEventName(rs.getString("event_name"));
        	event.setEventFee(rs.getString("event_fee"));
        	event.setEventDetail(rs.getString("event_detail"));
        	event.setEventLocation(rs.getString("event_location"));
        	event.setEventDate(rs.getDate("event_date"));
        	event.setStartTime(rs.getTime("start_time"));
        	event.setEndTime(rs.getTime("end_time"));
        	byte[] imageData = rs.getBytes("event_picture");
            if (imageData != null && imageData.length > 0) {
                String base64Image = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(imageData);
                event.setEventPictureBase64(base64Image);
            }
        }

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return event;
}





public void updateEvent(EventBean event) {
    EventID = event.getEventID();
    EventName = event.getEventName();
    EventFee = event.getEventFee();
    EventDetail = event.getEventDetail();
    EventLocation = event.getEventLocation();
    EventDate = (Date) event.getEventDate();
    StartTime = event.getStartTime();
    EndTime = event.getEndTime();
    EventPicture = event.getEventPicture();
    byte[] EventPicture = event.getEventPicture();

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        String sql = "UPDATE event SET event_name=?, event_fee=?, event_detail=?, event_location=?, event_date=?, start_time=?, end_time=?";
        if (EventPicture != null) {
            sql += ", event_picture=?";
        }
        sql += " WHERE event_id=?";

        ps = con.prepareStatement(sql);

        // Set parameters
        ps.setString(1, EventName);
        ps.setString(2, EventFee);
        ps.setString(3, EventDetail);
        ps.setString(4, EventLocation);
        ps.setDate(5, EventDate);
        ps.setTime(6, StartTime);
        ps.setTime(7, EndTime);

        if (EventPicture != null) {
            ps.setBytes(8, EventPicture);
            ps.setInt(9, EventID);
        } else {
            ps.setInt(8, EventID);
        }
      
        
     

        // Execute query
        ps.executeUpdate();
        System.out.println("Successfully updated");

        // Close connection
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}


public void deleteEvent(int eventID) {
    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Start a transaction
        con.setAutoCommit(false);

        // Delete from catch table
        ps = con.prepareStatement("DELETE FROM catch WHERE catch_id IN (SELECT catch_id FROM eventdetail WHERE event_id = ?)");
        ps.setInt(1, eventID);
        ps.executeUpdate();
        ps.close();

        // Delete from eventdetail table
        ps = con.prepareStatement("DELETE FROM eventdetail WHERE event_id = ?");
        ps.setInt(1, eventID);
        ps.executeUpdate();
        ps.close();

        // Delete from event table
        ps = con.prepareStatement("DELETE FROM event WHERE event_id = ?");
        ps.setInt(1, eventID);
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


public EventBean getEventByName(String EventName) {
    EventBean event = null;

    try {
        // Get connection
        con = ConnectionManager.getConnection();

        // Create statement
        ps = con.prepareStatement("SELECT * FROM event WHERE event_name = ?");
        ps.setString(1, EventName);

        // Execute query
        rs = ps.executeQuery();

        // Check if the customer exists
        if (rs.next()) {
            // Create the customer object and populate its properties
            event = new EventBean();
            event.setEventID(rs.getInt("event_id"));
        	event.setEventName(rs.getString("event_name"));
        	event.setEventFee(rs.getString("event_fee"));
        	event.setEventDetail(rs.getString("event_detail"));
        	event.setEventLocation(rs.getString("event_location"));
        	event.setEventDate(rs.getDate("event_date"));
        	event.setStartTime(rs.getTime("start_time"));
        	event.setEndTime(rs.getTime("end_time"));
        	event.setEventPicture(rs.getBytes("event_picture"));
        }
        con.close();
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle the exception accordingly
    } 

    return event;
}



public static Connection getConnection() throws SQLException {
    String jdbcURL = "jdbc:postgresql://localhost:5432/fishing;user=postgres;password=2021898778;encrypt=true;trustServerCertificate=true;";
    String username = "postgres";
    String password = "2021898778";
    return DriverManager.getConnection(jdbcURL, username, password);
}


}
