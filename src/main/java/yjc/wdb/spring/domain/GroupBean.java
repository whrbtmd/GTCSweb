package yjc.wdb.spring.domain;

public class GroupBean{
	

	private int cid;
	private String cname;
	private String gname1;
	private String gname2;
	private String gname3;
	private String gname4;
	private int play;
	private int cdnum;
	
	private String startday;
	private String time;
	private String userid;
	
	
	


	public int getCdnum() {
		return cdnum;
	}
	public void setCdnum(int cdnum) {
		this.cdnum = cdnum;
	}
	public int getPlay() {
		return play;
	}
	public void setPlay(int play) {
		this.play = play;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getGname1() {
		return gname1;
	}
	public void setGname1(String gname1) {
		this.gname1 = gname1;
	}
	public String getGname2() {
		return gname2;
	}
	public void setGname2(String gname2) {
		this.gname2 = gname2;
	}
	public String getGname3() {
		return gname3;
	}
	public void setGname3(String gname3) {
		this.gname3 = gname3;
	}
	public String getGname4() {
		return gname4;
	}
	public void setGname4(String gname4) {
		this.gname4 = gname4;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "GroupBean [cid=" + cid + ", cname=" + cname + ", gname1=" + gname1 + ", gname2=" + gname2 + ", gname3="
				+ gname3 + ", gname4=" + gname4 + ", play=" + play + ", cdnum=" + cdnum + ", startday=" + startday
				+ ", time=" + time + ", userid=" + userid + "]";
	}
	
	
}