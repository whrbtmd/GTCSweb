package yjc.wdb.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.spring.domain.GroupBean;
import yjc.wdb.spring.domain.MemberBean;
import yjc.wdb.spring.domain.PurchaseBean;
import yjc.wdb.spring.domain.SearchCriteria;
import yjc.wdb.spring.domain.TeamBean;
import yjc.wdb.spring.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO mdao;
	
	@Override
	public void regist(TeamBean team) throws Exception {
		// TODO Auto-generated method stub
		
		mdao.regist(team);
	}
	
	@Override
	public void registm(MemberBean m) {
		// TODO Auto-generated method stub
		mdao.registm(m);

	}

	@Override
	public boolean check(String userid, String pw) {
		String dpw =  mdao.check(userid);
		
		if(pw.equals(dpw)){
			//로그인 성공
			return true;
		}else{
			//로그인 실패
			return false;
		}
		
	}

	
	
	@Override
	public List<MemberBean> listm() throws Exception {
		// TODO Auto-generated method stub
		return mdao.listm();
	}
	
	@Override
	public List<MemberBean> listcd() throws Exception {
		// TODO Auto-generated method stub
		return mdao.listcd();
	}
	@Override
	public List<MemberBean> listcdd() throws Exception {
		// TODO Auto-generated method stub
		return mdao.listcdd();
	}
	@Override
	public void modifycd(MemberBean m) {
		mdao.modifycd(m);
		
	}

	@Override
	public void modifyge(MemberBean m) {
		mdao.modifyge(m);
		
	}

	@Override
	public void removecd(String userid) {
		mdao.removecd(userid);
		
	}

	@Override
	public void removege(String userid) {
		mdao.removege(userid);
		
	}

	@Override
	public MemberBean readcd(String userid) {
		// TODO Auto-generated method stub
		return mdao.readcd(userid);
	}

	@Override
	public MemberBean readge(String userid) {
		// TODO Auto-generated method stub
		return mdao.readge(userid);
	}

	@Override
	public void registcd(MemberBean m) {
		// TODO Auto-generated method stub
		mdao.registcd(m);
	}

	@Override
	public List<MemberBean> selectListkey(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return mdao.selectListkey(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return mdao.countPaging(cri);
	}

	@Override
	public List<MemberBean> getsearchmember(String search) {
		// TODO Auto-generated method stub
		return mdao.getsearchmember(search);
	}

	@Override
	public List<TeamBean> teamAddList() throws Exception {
		// TODO Auto-generated method stub
		return mdao.teamAddList();
	}


	@Override
	public void pinsert(PurchaseBean pur) {
		// TODO Auto-generated method stub
		mdao.pinsert(pur);
	}

	@Override
	public void ginsert(GroupBean group) {
		// TODO Auto-generated method stub
		mdao.ginsert(group);
	}

}
