package yjc.wdb.spring.domain;

public class PurchaseBean {
	
	private int cno;
	private String userid;
	private String startday;
	private int repur;
	private int fopur;
	private int total;
	
	
	
	
	public int getRepur() {
		return repur;
	}
	public void setRepur(int repur) {
		this.repur = repur;
	}
	public int getFopur() {
		return fopur;
	}
	public void setFopur(int fopur) {
		this.fopur = fopur;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}


}
