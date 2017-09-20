package yjc.wdb.spring.persistence;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.spring.domain.CartVO;

@Repository
public class CartDAOImpl implements CartDAO {
	@Resource(name = "sqlSession")
	@Inject
	private SqlSession session;

	private final static String namespace = "yjc.wdb.mapper.cartMapper";

	@Override
	public List<CartVO> selectList(String userid, int cno) throws Exception  {
		// TODO Auto-generated method stub
		 HashMap<String, Object> map = new HashMap<String, Object>();
	        map.put("userid", userid);
	        map.put("cno", cno);
		return session.selectList(namespace + ".selectList", map);
	}

	@Override
	public void insert(CartVO cart) throws Exception  {
		// TODO Auto-generated method stub
		session.insert(namespace + ".write", cart);
	}

	@Override
	public int delete(int number) {
		// TODO Auto-generated method stub
		return session.delete(namespace +".delete", number);
	}


}
