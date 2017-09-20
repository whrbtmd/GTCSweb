package yjc.wdb.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.spring.domain.CalendarBean;
import yjc.wdb.spring.domain.GroupBean;
import yjc.wdb.spring.domain.MemberBean;
import yjc.wdb.spring.domain.PurchaseBean;
import yjc.wdb.spring.domain.SearchCriteria;
import yjc.wdb.spring.persistence.CalendarDAO;

@Service
public class CalendarServiceImpls implements CalendarService {

	@Inject
	private CalendarDAO caldao;
	@Override
	public List<CalendarBean> calendardetail(int cno) throws Exception {
		// TODO Auto-generated method stub
		return caldao.calendardetail(cno);
	}
	@Override
	public void delete(int cno) throws Exception {
		// TODO Auto-generated method stub
		caldao.delete(cno);
	}
	
	//°Ë»ö
	@Override
	public List<MemberBean> selectListkey(SearchCriteria cri) {
		return caldao.selectListkey(cri);
	}
	/*@Override
	public void gmodify(GroupBean group) {
		// TODO Auto-generated method stub
		caldao.gmodify(group);
	}
*/
	
}
