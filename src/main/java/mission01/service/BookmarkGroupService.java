package mission01.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import mission01.model.BookmarkGroup;
import mission01.api.*;

public class BookmarkGroupService {
	
	private String sql = "";
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	static Connection conn = DBConnection.getConnection();
	
	public List<BookmarkGroup> getBookmarkGroupList(){
		List<BookmarkGroup> bookmarkGroupList = new ArrayList<>();
		
		try {
			sql = "select * from bookmark_group";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("id");
				String name = rs.getString("name");
				int rank = rs.getInt("rank");
				String addDate = rs.getString("add_date");
				Timestamp updateDate = rs.getTimestamp("update_date");

				
				BookmarkGroup bookmarkGroup = new BookmarkGroup();
				
				
				bookmarkGroup.setId(id);
				bookmarkGroup.setName(name);
				bookmarkGroup.setRank(rank);
				bookmarkGroup.setAddDate(addDate);
				bookmarkGroup.setUpdateDate(updateDate);
				

				bookmarkGroupList.add(bookmarkGroup);
			}
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bookmarkGroupList.stream()
				.sorted(Comparator.comparing(BookmarkGroup::getRank))
				.collect(Collectors.toList());

	}
	
	public void addBookmarkGroup(String name, int rank) {
		try {
			
//			ps = conn.prepareStatement("drop table bookmark_group");
//			ps.executeUpdate();
//			
//			String sql2 = "create table bookmark_group("
//					+ "id INTEGER PRIMARY KEY autoincrement, "
//					+ "name varchar(10), "
//					+ "rank INTEGER, "
//					+ "add_date DATE DEFAULT(datetime('now','localtime')), "
//					+ "update_date timestamp)" ;
//			
//			ps = conn.prepareStatement(sql2);
//			ps.executeUpdate();
			
			String sql = "insert into bookmark_group (name, rank) values (? ,? ) " ;
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setInt(2, rank);
			int re = ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		} 

		
	}
	
	
	public BookmarkGroup getBookmarkGroup(int bookmarkGroutId){
		BookmarkGroup bookmarkGroup = new BookmarkGroup();

		try {
			sql = "select id, name, rank from bookmark_group where id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bookmarkGroutId);
			rs = ps.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("id");
				String name = rs.getString("name");
				int rank = rs.getInt("rank");

				
				bookmarkGroup.setId(id);
				bookmarkGroup.setName(name);
				bookmarkGroup.setRank(rank);
				

			}
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bookmarkGroup;

	}
	
	public void updateBookmarkGroup(int id, String newName, int newRank){
		System.out.println(id);
		try {
			sql = "update bookmark_group set name=?, rank=?,  update_date=?" 
					+ " where id=?;";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, newName);
			ps.setInt(2, newRank);
			
		
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");


			String today = null;
			today = formatter.format(cal.getTimeInMillis());
			Timestamp ts = Timestamp.valueOf(today);


			ps.setTimestamp(3, ts);

			ps.setInt(4, id);

			int re = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}


	}
	
	
	public void deleteBookmarkGroup(int id){
		System.out.println(id);
		try {
			sql = "PRAGMA foreign_keys = ON; ";
			
			ps = conn.prepareStatement(sql);

			sql = "delete from bookmark_group " 
					+ " where id=?;";
			
			ps = conn.prepareStatement(sql);

			
			ps.setInt(1, id);

			int re = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}


	}
	

}
