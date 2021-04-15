package dto;

public class BoardDto {

	private int num;
	private String title;
	private String contents;
	
	private String userID;
	private String date;
	private int available;
	private String file;
	private int count;
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public BoardDto(int num, String title, String contents, String userID, String date, int available, String file) {
		this.num=num;
		this.title=title;
		this.contents=contents;
		this.userID=userID;
		this.date=date;
		this.available=available;
		this.file=file;
		
	}
	
	public BoardDto(int num, String title, String contents, String userID, String date, int available, String file, int count) {
		this.num=num;
		this.title=title;
		this.contents=contents;
		this.userID=userID;
		this.date=date;
		this.available=available;
		this.file=file;
		this.count=count;
		
	}
	
	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getAvailable() {
		return available;
	}

	public void setAvailable(int available) {
		this.available = available;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public BoardDto() {
		
	}
	
	public BoardDto(int num, String title, String contents) {
		this.num = num;
		this.title = title;
		this.contents = contents;
		
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	

	
	
	
}
