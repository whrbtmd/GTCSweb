package yjc.wdb.spring.persistence;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.spring.domain.CalendarBean;
import yjc.wdb.spring.domain.GroupBean;
import yjc.wdb.spring.domain.MemberBean;
import yjc.wdb.spring.domain.PurchaseBean;
import yjc.wdb.spring.domain.SearchCriteria;

@Repository
public class CalendarDAOImpl implements CalendarDAO {
	@Resource(name = "sqlSession2")

	@Inject
	private SqlSession session;
	
	
	private final String namespace="yjc.wdb.mapper.CalendarMapper"; 
	@Override
	public List<CalendarBean> getEvents() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertcal(CalendarBean calendar) {
		// TODO Auto-generated method stub
		session.insert(namespace+".insertcal",calendar);
	}

	@Override
	public CalendarBean readcal(int cno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CalendarBean eventList(int cno) {
		return session.selectOne(namespace+".eventList",cno);
	}

	@Override
	public List<CalendarBean> getEvents(String id) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".getEvents",id);
	}

	@Override
	public List<CalendarBean> getadminEvents() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(CalendarBean calbean) {
		// TODO Auto-generated method stub
		session.update(namespace+".update", calbean);
	}

	@Override
	public List<CalendarBean> eventList2(String start) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".eventList2",start);
	}

	@Override
	public List<CalendarBean> calendardetail(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".calendardetail",cno);
	}

	@Override
	public void delete(int cno) {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete", cno);
	}

	//°Ë»ö
	@Override
	public List<MemberBean> selectListkey(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".selectListkey", cri);
	}

	@Override
	public List<CalendarBean> getEvents2() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".getEvents2");
	}

	/*@Override
	public void gmodify(GroupBean group) {
		// TODO Auto-generated method stub
		session.update(namespace+".gmodify", group);
	}*/


	
}
