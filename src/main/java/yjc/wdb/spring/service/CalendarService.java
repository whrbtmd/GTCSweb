package yjc.wdb.spring.service;

import java.util.List;

import yjc.wdb.spring.domain.CalendarBean;
import yjc.wdb.spring.domain.GroupBean;
import yjc.wdb.spring.domain.MemberBean;
import yjc.wdb.spring.domain.PurchaseBean;
import yjc.wdb.spring.domain.SearchCriteria;


public interface CalendarService {
	
	//일정상세정보
	List<CalendarBean> calendardetail(int cno) throws Exception;
	
	public void delete(int cno) throws Exception;
	
	//검색
	public List<MemberBean> selectListkey(SearchCriteria cri);

	/*public void gmodify(GroupBean group);*/

	
}
