package yjc.wdb.spring.persistence;


import java.util.List;


import yjc.wdb.spring.domain.GroupBean;
import yjc.wdb.spring.domain.MemberBean;
import yjc.wdb.spring.domain.PurchaseBean;
import yjc.wdb.spring.domain.SearchCriteria;
import yjc.wdb.spring.domain.TeamBean;

public interface MemberDAO {
	public void registm(MemberBean m);
	public String check(String id);
	
	public List<MemberBean> listm() throws Exception;
	public List<MemberBean> listcd();
	public List<MemberBean> listcdd();
	public void modifycd(MemberBean m);
	public void modifyge(MemberBean m);
	public void removecd(String id);
	public void removege(String id);
	public MemberBean readcd(String id);
	public MemberBean readge(String id);
	public void registcd(MemberBean m);
	//°Ë»ö
	public List<MemberBean> selectListkey(SearchCriteria cri);
	public int countPaging(SearchCriteria cri);
	public List<MemberBean> getsearchmember(String search);
	public void regist(TeamBean team) throws Exception;
	public List<TeamBean> teamAddList();
	public MemberBean selectOne(String userid);

	public void pinsert(PurchaseBean pur);
	
	public void ginsert(GroupBean group);
	public List<GroupBean> glist();
	public int cal();
	public List<GroupBean> groupdetail(int cid);
	public void gmodify(GroupBean group);
	public int selectCid();
	
	
}
