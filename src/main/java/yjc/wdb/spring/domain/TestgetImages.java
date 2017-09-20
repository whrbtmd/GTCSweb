package yjc.wdb.spring.domain;

public class TestgetImages {
    private byte[] imgFile;
    private String name;
	private String size;
	private String category;
	private String price;
	private String manufacturer;
	private String userid;
    public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	private int bno;
	public byte[] getImgFile() {
		return imgFile;
	}
	public void setImgFile(byte[] imgFile) {
		this.imgFile = imgFile;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
    
}
