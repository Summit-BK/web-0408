package dao;

import dto.ReplyDto;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReplyDao {

	private Connection conn;
	private ResultSet rs;
	
	private static ReplyDao instance = new ReplyDao();
	public static ReplyDao getInstance() {
		return instance;
	}
	
	public ReplyDao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/board?serverTime=UTC","root","1234");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int re_write(ReplyDto replydto) {
		
		String SQL = "insert into reply(board_num, reply_userid,reply_contents) values(?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, replydto.getBoard_num());
			pstmt.setString(2, replydto.getReply_userid());
			pstmt.setString(3, replydto.getReply_contents());
			
			pstmt.executeUpdate();
			return 1;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
	
	public ArrayList<ReplyDto> getReplyList(int board_num){
		String SQL = "select * from reply where board_num=? order by reply_num desc";
		ArrayList<ReplyDto> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReplyDto replyDto = new ReplyDto(rs.getInt(2),rs.getString(3),rs.getString(4));
				list.add(replyDto);
			}
			return list;
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}
	
	
}
