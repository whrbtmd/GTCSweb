package yjc.wdb.spring.persistence;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import yjc.wdb.spring.domain.admVO;
import yjc.wdb.spring.domain.buyVO;
import yjc.wdb.spring.domain.recordVO;


@Repository
public class AdminDAOImpl implements AdminDAO {
	@Resource(name = "sqlSession")
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.sjk.board.adm";


	@Override
	public String goodcount() {
		return session.selectOne(namespace+".selectCount");
		// TODO Auto-generated method stub
		
	}


	@Override
	public String goodcountmon() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".selectCountmon");
	}


	@Override
	public int count() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".selectCount1");
	}


	@Override
	public int countmon() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".selectCountmon1");
	}


	@Override
	public List<admVO> goodmon() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".goodmon");
	}


	@Override
	public int newor() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".newor");
	}


	@Override
	public void modify(buyVO buy) {
		// TODO Auto-generated method stub
		 session.update(namespace+".modify", buy);
	}


	@Override
	public int pal() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".pal");
	}


	@Override
	public int il() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".il");
	}


	@Override
	public int lee() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".lee");
	}


	@Override
	public int sa() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".sa");
	}


	@Override
	public int oh() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".oh");
	}


	@Override
	public int sam() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".sam");
	}


	@Override
	public int youk() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".youk");
	}


	@Override
	public int chil() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".chil");
	}


	@Override
	public int sipil() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".sipil");
	}


	@Override
	public int sip() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".sip");
	}


	@Override
	public int gu() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".gu");
	}


	@Override
	public int siplee() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".siplee");
	}


	@Override
	public List<buyVO> toporder() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".toporder");
	}


	@Override
	public List<admVO> goodmonrank() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".goodmonrank");
	}


	@Override
	public List<buyVO> toporderrank() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".toporderrank");
	}


	@Override
	public String lee1() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".lee1");
	}


	@Override
	public List<recordVO> list() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".list");
	}


	@Override
	public List<recordVO> list2() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".list2");
	}


	@Override
	public List<recordVO> list3() {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".list3");
	}


	@Override
	public int cal() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".cal");
	}










}
