package mission01.model;
import java.sql.Timestamp;
import java.util.Date;
public class BookmarkGroup {
	
	private int id;
	private String name;
	private int rank;
	private String addDate;
	private Timestamp updateDate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getAddDate() {
		return addDate;
	}
	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}
	public Timestamp getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Timestamp updateDate) {
		System.out.println("0 "+updateDate);
		this.updateDate = updateDate;
	}
	
}
