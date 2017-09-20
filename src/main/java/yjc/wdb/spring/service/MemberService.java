package yjc.wdb.spring.service;

import java.util.List;

import yjc.wdb.spring.domain.GroupBean;
import yjc.wdb.spring.domain.MemberBean;
import yjc.wdb.spring.domain.PurchaseBean;
import yjc.wdb.spring.domain.SearchCriteria;
import yjc.wdb.spring.domain.TeamBean;

public interface MemberService {
	
	
	public void registm(MemberBean m);
	public boolean check(String userid, String pw);
	public List<MemberBean> listm() throws Exception;
	public List<MemberBean> listcd() throws Exception;
	public List<MemberBean> listcdd() throws Exception; 
	public void modifycd(MemberBean m);
	public void modifyge(MemberBean m);
	public void removecd(String userid);
	public void removege(String userid);
	public MemberBean readcd(String userid);
	public MemberBean readge(String userid);
	public void registcd(MemberBean m);
	public List<MemberBean> selectListkey(SearchCriteria cri);
	public int listSearchCount(SearchCriteria cri);
	public List<MemberBean> getsearchmember(String search);

	
	
	public void regist(TeamBean team) throws Exception;
	public List<TeamBean> teamAddList()throws Exception;
	
	public void pinsert(PurchaseBean pur);
	public void ginsert(GroupBean group);

	
	
}
