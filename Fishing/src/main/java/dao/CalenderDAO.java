package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CalenderBean;

public class CalenderDAO {
    private Connection connection; // Assume you have a database connection
    
    // Constructor to initialize the DAO with a database connection
    public CalenderDAO(Connection connection) {
        this.connection = connection;
    }
    
    // Method to fetch event details by date
    public List<CalenderBean> getEventsByDate(String date) throws SQLException {
        List<CalenderBean> events = new ArrayList<>();
        String query = "SELECT * FROM event WHERE event_date = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, date);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
            	CalenderBean event = new CalenderBean();
                event.setEventId(rs.getInt("event_id"));
                event.setEventName(rs.getString("event_name"));
                event.setEventFee(rs.getDouble("event_fee"));
                event.setEventDetail(rs.getString("event_detail"));
                event.setEventLocation(rs.getString("event_location"));
                event.setEventDate(rs.getString("event_date"));
                
                events.add(event);
            }
        }
        
        return events;
    }
}
