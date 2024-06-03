package mission01.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import mission01.model.Bookmark;
import mission01.api.*;

public class BookmarkService {
	
	private String sql = "";
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private ResultSet rs2 = null;
	static Connection conn = DBConnection.getConnection();
	
	public List<Bookmark> getBookmarkList(){
		List<Bookmark> bookmarkList = new ArrayList<>();
		
		try {
			sql = "select * from bookmark";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("id");
				String bookmarkName = rs.getString("bookmark_name");
				String wifiName = rs.getString("wifi_name");
				String addDate = rs.getString("add_date");

				
				Bookmark bookmark = new Bookmark();
				
				
				bookmark.setId(id);
				bookmark.setBookmarkName(bookmarkName);
				bookmark.setWifiName(wifiName);
				bookmark.setAddDate(addDate);
				
				

				bookmarkList.add(bookmark);
			}
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bookmarkList;

	}
	
	public void addBookmark(int bookmarkGroupId, String bookmarkName, String wifiName) {
		try {
			
//			ps = conn.prepareStatement("drop table bookmark");
//			ps.executeUpdate();
			
//			String sql2 = "create table bookmark("
//					+ "id INTEGER PRIMARY KEY autoincrement, "
//					+ "bookmarkgroup_id INTEGER, "
//					+ "bookmark_name varchar(10), "
//					+ "wifi_name varchar(10), "
//					+ "add_date DATE DEFAULT(datetime('now','localtime')), "
//					+ "FOREIGN KEY (bookmarkgroup_id) "
//					+ "REFERENCES bookmark_group(id) "
//					+ "ON DELETE CASCADE)";
//			
//			ps = conn.prepareStatement(sql2);
//			ps.executeUpdate();
			
			String sql = "insert into bookmark (bookmark_name, wifi_name, bookmarkgroup_id) values (? ,? ,?) " ;
			ps = conn.prepareStatement(sql);
			ps.setString(1, bookmarkName);
			ps.setString(2, wifiName);
			ps.setInt(3, bookmarkGroupId);
			int re = ps.executeUpdate();
			
			System.out.print(re);
		}catch(Exception e){
			e.printStackTrace();
		} 

		
	}
	
	public Bookmark getBookmark(int bookmarkId) {
		Bookmark bookmark = new Bookmark();

		
		try {
			
			
			String sql = "select * from bookmark where id=?; " ;
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bookmarkId);
			rs = ps.executeQuery();

			while (rs.next()) {
				

				int id = rs.getInt("id");
				String bookmarkName = rs.getString("bookmark_name");
				String wifiName = rs.getString("wifi_name");
				String addDate = rs.getString("add_date");

				
				bookmark.setId(id);
				bookmark.setWifiName(wifiName);
				bookmark.setBookmarkName(bookmarkName);
				bookmark.setAddDate(addDate);
				

			}
			
		}catch(Exception e){
			e.printStackTrace();
		} 
		
		return bookmark;

		
	}
	
	public void deleteBookmark(int id){

		try {
			sql = "delete from bookmark " 
					+ " where id=?;";
			
			ps = conn.prepareStatement(sql);

			ps.setInt(1, id);

			int re = ps.executeUpdate();
			System.out.print(re);
		} catch (Exception e) {
			e.printStackTrace();
		}


	}

}
