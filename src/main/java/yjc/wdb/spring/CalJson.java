package yjc.wdb.spring;

import org.json.simple.JSONAware;
import org.json.simple.JSONObject;

public class CalJson implements JSONAware {
	private int cno;
	private int cid;
	private String title;
	private String start;
	private String end;
	private String color;

	
	public CalJson(int cno, int cid, String title, String start, String end, String color){
		this.cno=cno;
		this.cid=cid;
		this.title=title;
		this.start=start;
		this.end=end;
		this.color=color;
	}
	
	@Override
	public String toJSONString(){
	    JSONObject obj = new JSONObject();
	    obj.put("cno", cno);
	    obj.put("cid", cid);
	    obj.put("title", title);
	    obj.put("start", start);
	    obj.put("end", end);
	    obj.put("color", color);
	    return obj.toString();
	  }
}
