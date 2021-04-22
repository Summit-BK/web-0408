package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.ProductDto;

public class ProductDao {

	private Connection conn;
	private ResultSet rs;
	
	private static ProductDao instance = new ProductDao();
	public static ProductDao getInstance() {
		return instance;
	}
	
	public ProductDao() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/board?serverTime=UTC","root","1234");
			
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("DB Connection Error");
		}
		
	}
	
	public int productadd(ProductDto dto) {
		String SQL = "insert into product(product_name,product_price,product_manufacturer,product_category,product_stock,"
				+ "product_condition,product_file,product_activation,product_soldcount1) values(?,?,?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getPrice());
			pstmt.setString(3, dto.getManufacturer());
			pstmt.setString(4, dto.getCategory());
			pstmt.setInt(5, dto.getStock());
			pstmt.setInt(6, dto.getCondition());
			pstmt.setString(7, dto.getFile());
			pstmt.setInt(8, dto.getActivation());
			pstmt.setInt(9, dto.getSoldcount1());
			
			pstmt.executeUpdate();
			
			return 1;
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	
}