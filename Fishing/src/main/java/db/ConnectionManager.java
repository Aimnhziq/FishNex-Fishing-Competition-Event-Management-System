package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectionManager {

	 static Connection con;
	  private static final String DB_DRIVER= "org.postgresql.Driver";
	  private static final String DB_CONNECTION = "jdbc:postgresql://localhost:5432/fishing";
	  private static final String DB_USER = "postgres";
	  private static final String DB_PASSWORD = "2021898778";
	  
	  public static Connection getConnection() {
	  Connection con = null;
	    try {
	      //1. load the driver
	      Class.forName(DB_DRIVER);
	      
	      try {
	        //2. create connection
	        con = DriverManager.getConnection(DB_CONNECTION,DB_USER,DB_PASSWORD);
	        System.out.println("Connected");
	      }catch(SQLException e) {
	        e.printStackTrace();
	      }
	    }catch(ClassNotFoundException e) {
	      e.printStackTrace();
	    }    
	    return con;
	    
	  }

	public static void closeResultSet(ResultSet rs) {
		// TODO Auto-generated method stub
		
	}

	public static void closeStatement(PreparedStatement stmt) {
		// TODO Auto-generated method stub
		
	}

	public static void closeConnection(Connection con2) {
		// TODO Auto-generated method stub
		
	}
	}

