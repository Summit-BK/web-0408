package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.BoardDto;

public class BoardDao {

	private Connection conn;
	private ResultSet rs;
	private static BoardDao instance = new BoardDao();
	public static BoardDao getInstance() {
		return instance;
	}
	
	public BoardDao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/board?serverTime=UTC","root","1234");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
			
	}
	
	public int boardSave(BoardDto dto) {
		String SQL = "insert into board(title,contents,author) values(?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,dto.getTitle());
			pstmt.setString(2, dto.getContents());
			pstmt.setString(3, dto.getAuthor());
			pstmt.executeUpdate();
			return 1;
		}
		
		catch(Exception e) {
			
		}
		return -1;
	}
	
	public ArrayList<BoardDto> boardList(){
		
		ArrayList<BoardDto> list = new ArrayList<>();
		String SQL = "select* from board";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDto temp = new BoardDto(rs.getInt("num"),rs.getString("title"),rs.getString("contents"),rs.getString("author"));
				list.add(temp);
				
			}
			
			return list;
		}
		catch(Exception e) {
			
		}
		return list;
	}
	
	public int deletePost(int num) {
		String SQL = "delete from board where num = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			return 1;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
public BoardDto getPost(int num){
		
		
		String SQL = "select* from board where num = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				BoardDto temp = new BoardDto(rs.getInt("num"),rs.getString("title"),rs.getString("contents"),rs.getString("author"));
				
				return temp;
				
			}
			
			
		}
		catch(Exception e) {
			
		}
		return null;
	}
	
	
}
