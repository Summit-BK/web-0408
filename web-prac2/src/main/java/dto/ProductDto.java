package dto;

public class ProductDto {

	private int id;
	private String name;
	private int price;
	private String manufacturer;
	private String category;
	private int stock;
	private int condition;
	private String file;
	private int activation;
	private int soldcount1;
	
	public ProductDto() {
		
	}
	
	
	public ProductDto(String name, int price, String manufacturer, String category, int stock, int condition,
			String file, int activation, int soldcount1) {
		
	
		this.name = name;
		this.price = price;
		this.manufacturer = manufacturer;
		this.category = category;
		this.stock = stock;
		this.condition = condition;
		this.file = file;
		this.activation = activation;
		this.soldcount1 = soldcount1;
	}
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getCondition() {
		return condition;
	}
	public void setCondition(int condition) {
		this.condition = condition;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public int getActivation() {
		return activation;
	}
	public void setActivation(int activation) {
		this.activation = activation;
	}
	public int getSoldcount1() {
		return soldcount1;
	}
	public void setSoldcount1(int soldcount1) {
		this.soldcount1 = soldcount1;
	}
	
}
