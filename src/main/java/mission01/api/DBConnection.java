package mission01.api;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static Connection conn = null;
	
	public static void closeConnection() {
		if(conn != null) {
			try {
				conn.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static Connection getConnection() {
		if(conn==null) {
			String dbFileUrl = "jdbc:sqlite:wifi.db";

			try {
				Class.forName("org.sqlite.JDBC");
				conn = DriverManager.getConnection(dbFileUrl);
				
			}catch(Exception e) {
				System.out.println(e);
			}
			
		}
		return conn;

		
		
	}
}
