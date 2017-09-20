package yjc.wdb.spring.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import yjc.wdb.spring.domain.CalendarBean;
import yjc.wdb.spring.domain.GroupBean;
import yjc.wdb.spring.domain.MemberBean;
import yjc.wdb.spring.domain.PurchaseBean;
import yjc.wdb.spring.domain.SearchCriteria;


public interface CalendarDAO {
/*	public void insertCalendar(CalendarBean calendar);*/

	public List<CalendarBean> getEvents();

	 void insertcal(CalendarBean calendar);
	 public CalendarBean eventList(int cno);
	public CalendarBean readcal(int cno);

	public List<CalendarBean> getEvents(String id);

	public List<CalendarBean> getadminEvents();

	public void update(CalendarBean calbean);

	
	public List<CalendarBean> eventList2(String start);

	//일정상세정보
	List<CalendarBean> calendardetail(int cno) throws Exception;

	public void delete(int cno);
	
	//검색
	public List<MemberBean> selectListkey(SearchCriteria cri);

	public List<CalendarBean> getEvents2();

	/*public void gmodify(GroupBean group);*/


	
}
