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
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/board?serverTimezone=UTC","root","1234");
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
	}
	
	public String getDate() {
		
		String SQL = "select now()";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}
		catch(Exception e) {
			
		}
		return ""; //db error
	}
	
	public int getNextNum() {
		String SQL = "select max(board_num) from Board"; //num = field
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1 //last post no. + 1
;			}
			return 1; //first post
			
		}
		catch(Exception e) {
			
		}
		return -1;
		
	}
	public int write(BoardDto dto) {
		String SQL = "insert into board values(?,?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNextNum());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContents());
			pstmt.setString(4, dto.getUserID());
			pstmt.setString(5, getDate());
			pstmt.setInt(6, dto.getAvailable());
			pstmt.setString(7, dto.getFile());
			pstmt.setInt(8, 0);
			
			pstmt.executeUpdate();
			return 1;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public ArrayList<BoardDto> getBoardList(int pagenumber){
			
		ArrayList<BoardDto> list = new ArrayList<>();
		String SQL = "select *from board where board_num<? order by board_num desc limit 10";
		
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNextNum()-(pagenumber-1)*10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BoardDto(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7)));
			}
			
			return list;
		}
		
		catch(Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}
	
	public BoardDto getBoard(int num) {
		String SQL = "select *from board where board_num=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				int count= rs.getInt(8)+1;
				String SQL2= "update board set board_count="+count+" where board_num="+num;
				PreparedStatement pstmt2 = conn.prepareStatement(SQL2);
				pstmt2.executeUpdate();
				
				BoardDto dto = new BoardDto(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7),count);
				return dto;
			}
			return null;
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		return null;
		
	}
	
	public int hideBoard(int num) {
//		String SQL="update board set board_available = 0 where board_num = ?";
		String SQL="delete from board where board_num = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			SQL = "update board set board_num=board_num-1 where board_num>?";
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			return 1;
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		
			return -1;
	}
	
	public int modifyBoard(int num, String title, String contents, String file) {
		String SQL = "update board set board_title=?, board_contents=?, board_file=? where board_num=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, contents);
			pstmt.setString(3, file);
			pstmt.setInt(4, num);
			pstmt.executeUpdate();
			
			return 1;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<BoardDto> getBoardSearch(String key,String keyword){
		
		ArrayList<BoardDto> list = new ArrayList<>();

//		String SQL = "select *from board where "+key+"='"+keyword+"'";
				String SQL = "select *from board where "+key+" like '%"+keyword+"%'";
		//String SQL = "select *from board where board_title like '%aaa%'";
		
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
		
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new BoardDto(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7)));
			}
			
			return list;
		}
		
		catch(Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}
	
	public boolean nextPage(int pagenumber) {
		
		String SQL = "select * from board where board_num <?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNextNum()-(pagenumber-1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
