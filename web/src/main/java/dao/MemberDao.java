package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.MemberDto;

public class MemberDao {

	private Connection conn;
	private ResultSet rs;
	
	private static MemberDao instance = new MemberDao();
	public static MemberDao getInstance() {return instance;}
	
	
	public MemberDao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/web?serverTime=UTC","root","1234");
		}
		catch(Exception e) {
			
		}
	}
	
	public int login(String id, String password) {
		String SQL="select* from member where id=? and password=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,id);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 1;
			}
			else {
				return 2;
			}
			
		
		}
		catch(Exception e) {
			
		}
		return -1;
	}
	
	public int signup(MemberDto dto) {
		String SQL = "insert into member values(?,?,?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getBirth());
			pstmt.setString(6, dto.getMail());
			pstmt.setString(7, dto.getPhone());
			pstmt.setString(8, dto.getAddress());
			pstmt.setString(9, dto.getRegist_day());
			
			pstmt.executeUpdate();
			return 1;
			
		}
		catch(Exception e) {
			
		}
		return -1;
		
		
	}
	
	public MemberDto getMember(String logid) {
		String SQL = "select * from member where id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, logid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				MemberDto memberDto = new MemberDto();
				
				memberDto.setId(rs.getString(1));
				memberDto.setPassword(rs.getString(2));
				memberDto.setName(rs.getString(3));
				memberDto.setGender(rs.getString(4));
				memberDto.setBirth(rs.getString(5));
				memberDto.setMail(rs.getString(6));
				memberDto.setPhone(rs.getString(7));
				memberDto.setAddress(rs.getString(8));
				memberDto.setRegist_day(rs.getString(9));
				return memberDto;
			}
			
			
		}
		catch(Exception e) {
			
		}
		return null;
		
	}
	
	public int delete(String logid) {
		String sql = "delete from member where id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, logid);
			pstmt.executeUpdate();
			return 1;
			
			
		}
		catch(Exception e) {
			
		}
		return -1;
		
	}
	
	public int update(String logid, MemberDto dto){
		
		String SQL = "update member set password=?,name=?,gender=?,birth=?,mail=?,phone=?,address=? where id=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dto.getPassword());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getGender());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getMail());
			pstmt.setString(6, dto.getPhone());
			pstmt.setString(7, dto.getAddress());
			pstmt.setString(8, logid);
			
			pstmt.executeUpdate();
			
			return 1;
			
		}
		catch(Exception e) {
			
			
		}
		return -1;
	}
	
	
}
