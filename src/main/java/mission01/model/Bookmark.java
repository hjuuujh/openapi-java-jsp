package mission01.model;


public class Bookmark {
	
	private int id;
	private int bookmarkGroupId;
	private String bookmarkName;
	private String wifiName;
	private String addDate;
	
	public int getBookmarkGroupId() {
		return bookmarkGroupId;
	}
	public void setBookmarkGroupId(int bookmarkGroupId) {
		this.bookmarkGroupId = bookmarkGroupId;
	}
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBookmarkName() {
		return bookmarkName;
	}
	public void setBookmarkName(String bookmarkName) {
		this.bookmarkName = bookmarkName;
	}
	public String getWifiName() {
		return wifiName;
	}
	public void setWifiName(String wifiName) {
		this.wifiName = wifiName;
	}
	public String getAddDate() {
		return addDate;
	}
	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

}
