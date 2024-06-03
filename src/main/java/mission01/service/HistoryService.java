package mission01.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import mission01.api.*;

import mission01.model.History;

public class HistoryService {

	private String sql = "";
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private ResultSet rs2 = null;
	static Connection conn = DBConnection.getConnection();
	
	public List<History> getHistoryList(){
		List<History> historyList = new ArrayList<>();
		
		try {
			sql = "select * from history";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("id");
				String x = rs.getString("x");
				String y = rs.getString("y");
				String date = rs.getString("date");


				History history = new History();

				history.setId(id);
				history.setX(x);
				history.setY(y);
				history.setDate(date);
				
				
				

				historyList.add(history);
			}
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return historyList;
	}
	
	public void addHistory(String x, String y) {
		try {
			
//			ps = conn.prepareStatement("drop table history");
//			ps.executeUpdate();
//			
//			String sql2 = "create table history("
//					+ "id INTEGER PRIMARY KEY autoincrement, "
//					+ "x varchar(20), "
//					+ "y varchar(20), "
//					+ "date DATE DEFAULT(datetime('now','localtime'))"
//					+ ");"	;
//			ps = conn.prepareStatement(sql2);
//			ps.executeUpdate();
			
			String sql = "insert into history (x,y) values (? ,? ) " ;
			ps = conn.prepareStatement(sql);
			ps.setString(1, x);
			ps.setString(2, y);
			int re = ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		} 

		
	}
	
	
}














