package dto;

public class ReplyDto {

	private int reply_num;
	private int board_num;
	private String reply_userid;
	private String reply_contents;
	
	public ReplyDto() {
		
	}
	public ReplyDto(int board_num, String reply_userid,String reply_contents) {
		this.board_num=board_num;
		this.reply_userid=reply_userid;
		this.reply_contents=reply_contents;
	}
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getReply_userid() {
		return reply_userid;
	}
	public void setReply_userid(String reply_userid) {
		this.reply_userid = reply_userid;
	}
	public String getReply_contents() {
		return reply_contents;
	}
	public void setReply_contents(String reply_contents) {
		this.reply_contents = reply_contents;
	}
	
}
