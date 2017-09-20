package yjc.wdb.spring.persistence;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.xml.bind.annotation.XmlRegistry;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.spring.domain.CartListBean;

@Repository
class CartListDAOImpl  implements CartListDAO {
	@Resource(name = "sqlSession")
	
	@Inject
	private SqlSession session;
	
	
	private static String namespace="yjc.wdb.mapper.cartMapper";

	@Override
	public void registc(CartListBean co) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("regi");

		session.insert(namespace+".registc", co);
		System.out.println("regi af");
	}

	@Override
	public CartListBean readc(int pnum) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("readc be2");
		System.out.println(pnum);
		return session.selectOne(namespace+".readc", pnum);
	}

	@Override
	public void modifyc(CartListBean co) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".modifyc", co);
	}

	@Override
	public void removec(int pnum) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".removec", pnum);
	}

	@Override
	public List<CartListBean> listAllc() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAllc");
	}
	
	

}
