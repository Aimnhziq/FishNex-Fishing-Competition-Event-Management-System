package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import db.ConnectionManager;
import model.LeaderboardBean;

public class LeaderboardDAO {

	public void updateLeaderboard(int eventId) {
	    String query = "SELECT c.cust_name, ca.catch_name, ca.catch_weight, ed.eventdetail_id, l.leaderboard_id, ed.cust_id " +
	                   "FROM eventdetail ed " +
	                   "JOIN customers c ON ed.cust_id = c.cust_id " +
	                   "JOIN leaderboard l ON ed.eventdetail_id = l.eventdetail_id " +
	                   "JOIN catch ca ON l.catch_id = ca.catch_id " +
	                   "WHERE ed.event_id = ?";

	    Map<Integer, Double> pointsMap = new HashMap<>();
	    Map<Integer, List<String>> catchDetailsMap = new HashMap<>();

	    try (Connection con = ConnectionManager.getConnection();
	         PreparedStatement ps = con.prepareStatement(query)) {

	        ps.setInt(1, eventId);
	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                String catchName = rs.getString("catch_name");
	                double catchWeight = rs.getDouble("catch_weight");
	                int eventdetailId = rs.getInt("eventdetail_id");

	                double points = 0;
	                if ("patin".equalsIgnoreCase(catchName) || "pacu".equalsIgnoreCase(catchName) || "tongsan".equalsIgnoreCase(catchName)) {
	                    points = 0.3 + catchWeight;
	                } else if ("baung".equalsIgnoreCase(catchName) || "rohu".equalsIgnoreCase(catchName) || "toman".equalsIgnoreCase(catchName) || "keli".equalsIgnoreCase(catchName)) {
	                    points = 0.5 + catchWeight;
	                } else {
	                    points = 0.8 + catchWeight; // For "Other"
	                }

	                pointsMap.put(eventdetailId, pointsMap.getOrDefault(eventdetailId, 0.0) + points);

	                catchDetailsMap.computeIfAbsent(eventdetailId, k -> new ArrayList<>())
	                        .add(catchName + " (" + catchWeight + " kg)");
	            }

	            String updatePointsQuery = "UPDATE leaderboard SET leaderboard_point = ? WHERE eventdetail_id = ?";
	            try (PreparedStatement ps2 = con.prepareStatement(updatePointsQuery)) {
	                for (Map.Entry<Integer, Double> entry : pointsMap.entrySet()) {
	                    int eventdetailId = entry.getKey();
	                    double totalPoints = entry.getValue();

	                    ps2.setDouble(1, totalPoints);
	                    ps2.setInt(2, eventdetailId);
	                    ps2.executeUpdate();
	                }
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	
	public List<LeaderboardBean> getLeaderboard(int eventId) {
	    List<LeaderboardBean> leaderboard = new ArrayList<>();
	    String query = "SELECT c.cust_name, ed.cust_id, SUM(l.leaderboard_point) AS total_points " +
	                   "FROM eventdetail ed " +
	                   "JOIN customers c ON ed.cust_id = c.cust_id " +
	                   "JOIN leaderboard l ON ed.eventdetail_id = l.eventdetail_id " +
	                   "WHERE ed.event_id = ? " +
	                   "GROUP BY ed.cust_id, c.cust_name";

	    Map<Integer, LeaderboardBean> leaderboardMap = new HashMap<>();

	    try (Connection con = ConnectionManager.getConnection();
	         PreparedStatement ps = con.prepareStatement(query)) {

	        ps.setInt(1, eventId);
	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                String custName = rs.getString("cust_name");
	                int custId = rs.getInt("cust_id");
	                double totalPoints = rs.getDouble("total_points");

	                LeaderboardBean entry = new LeaderboardBean();
	                entry.setCustName(custName);

	                // Format the total points to 2 decimal places
	                String formattedPoints = String.format("%.2f", totalPoints);
	                entry.setPoints(Double.parseDouble(formattedPoints)); // Store formatted value as double

	                entry.setCatchName(getCatchDetails(con, custId, eventId)); // Fetch catch details
	                leaderboardMap.put(custId, entry);
	            }

	            leaderboard.addAll(leaderboardMap.values());
	            leaderboard.sort((e1, e2) -> Double.compare(e2.getPoints(), e1.getPoints()));

	            for (int i = 0; i < leaderboard.size(); i++) {
	                leaderboard.get(i).setRank(i + 1);
	            }

	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return leaderboard;
	}


	private String getCatchDetails(Connection con, int custId, int eventId) throws SQLException {
	    String query = "SELECT ca.catch_name, ca.catch_weight " +
	                   "FROM eventdetail ed " +
	                   "JOIN leaderboard l ON ed.eventdetail_id = l.eventdetail_id " +
	                   "JOIN catch ca ON l.catch_id = ca.catch_id " +
	                   "WHERE ed.cust_id = ? AND ed.event_id = ?";
	    StringBuilder catchDetails = new StringBuilder();

	    try (PreparedStatement ps = con.prepareStatement(query)) {
	        ps.setInt(1, custId);
	        ps.setInt(2, eventId);
	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                String catchName = rs.getString("catch_name");
	                double catchWeight = rs.getDouble("catch_weight");
	                if (catchDetails.length() > 0) {
	                    catchDetails.append(", ");
	                }
	                catchDetails.append(catchName).append(" (").append(catchWeight).append(" kg)");
	            }
	        }
	    }

	    return catchDetails.toString();
	}

	
}
