package yjc.wdb.spring.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.spring.domain.GroupBean;
import yjc.wdb.spring.domain.MemberBean;
import yjc.wdb.spring.domain.PurchaseBean;
import yjc.wdb.spring.domain.SearchCriteria;
import yjc.wdb.spring.domain.TeamBean;


@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource(name = "sqlSession2")
	
	@Inject
	private SqlSession sqlSession;
	
	private final String namespace = "yjc.wdb.mapper.memberMapper";
	
	
	@Override
	public void registm(MemberBean m) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".registm", m);

	}
	
	
	@Override
	public String check(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".check", userid);
	}



	@Override
	public List<MemberBean> listm() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listm");
	}


	@Override
	public List<MemberBean> listcd() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listcd");
	}
	@Override
	public List<MemberBean> listcdd() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listcdd");
	}

	@Override
	public void modifycd(MemberBean m) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".modifycd", m);
	}


	@Override
	public void modifyge(MemberBean m) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".modifyge", m);
	}


	@Override
	public void removecd(String userid) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".removecd", userid);
	}


	@Override
	public void removege(String userid) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".removege", userid);
	}


	@Override
	public MemberBean readcd(String userid) {
		System.out.println(userid);
		return sqlSession.selectOne(namespace+".readcd", userid);
	}


	@Override
	public MemberBean readge(String userid) {
		System.out.println(userid);
		return sqlSession.selectOne(namespace+".readge", userid);
	}


	@Override
	public void registcd(MemberBean m) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".registcd", m);
	}

	
	//°Ë»ö
	@Override
	public List<MemberBean> selectListkey(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".selectListkey", cri);
	}


	@Override
	public int countPaging(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".listSearchCount", cri);
	}


	@Override
	public List<MemberBean> getsearchmember(String search) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getsearchmember", search);
	}

	
	
	
	
	

	@Override
	public void regist(TeamBean team) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".regist", team);
	}


	@Override
	public List<TeamBean> teamAddList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".teamAddList");
	}


	
	
	

	@Override
	public MemberBean selectOne(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectOne",userid);
	}


	@Override
	public void pinsert(PurchaseBean pur) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".pinsert", pur);
	}
	
	@Override
	public void ginsert(GroupBean group) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".ginsert", group);
	}


	@Override
	public List<GroupBean> glist() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".glist");
	}
	
	@Override
	public int selectCid() {
		// TODO Auto-generated method stub
		System.out.println("selectCid - MemberDao Im");
		return sqlSession.selectOne(namespace+".selectCid");
	}

	@Override
	public int cal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".cal");
	}



	@Override
	public List<GroupBean> groupdetail(int cid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".selectOne",cid);
	}



	@Override
	public void gmodify(GroupBean group) {
		// TODO Auto-generated method stub
		System.out.println("~~~~~~~"+group);
		sqlSession.update(namespace+".gmodify",group);
	}

	
	
}
