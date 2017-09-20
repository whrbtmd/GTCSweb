package yjc.wdb.spring.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.spring.domain.*;

@Repository
public class ShoppingDAOImpl implements ShoppingDAO {
	@Resource(name = "sqlSession")
	@Inject
	private SqlSession session;

	private final static String namespace = "com.sjk.board.vo.ShopVO";

	@Override
	public int selectCount(String userid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".selectCount", userid);
	}

	@Override
	public List<ShopVO> selectList(String userid, String keyword) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("keyword", keyword);
		return session.selectList(namespace + ".selectListmap", map);
	}

	@Override
	public ShopVO selectOne(int goodsNumber) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".selectOne", goodsNumber);
	}

	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".selectCount1");
	}



	@Override
	public void saveImage(Map<String, Object> hmap) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".saveImage", hmap);

	}

	@Override
	public void write(ShopVO shop) {
		// TODO Auto-generated method stub
		session.insert(namespace + ".write", shop);
	}

	@Override
	public List<ShopVO> selectList(String category) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".selectList", category);
	}

	@Override
	public List<ShopVO> selectListkey(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".selectListkey", cri);
	}

	@Override
	public int countPaging(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".listSearchCount", cri);
	}

	@Override
	public int goodcountPaging(GoodSearchCriteria cri) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".goodlistSearchCount", cri);
	}

	@Override
	public void decrease(buyVO order) {
		// TODO Auto-generated method stub
		session.update(namespace+".decrease1", order);
	}

	@Override
	public void decrease(CartVO cartVO) {
		// TODO Auto-generated method stub
		session.update(namespace+".decrease", cartVO);
	}

	@Override
	public void insert(buyVO order) {
		// TODO Auto-generated method stub
		session.insert(namespace + ".insertorder", order);
	}

	@Override
	public List<buyVO> selectListorder(String userid) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".selectListorder", userid);
	}

	@Override
	public void select() {
		// TODO Auto-generated method stub
		session.selectOne(namespace + ".selectMax");
	}

	@Override
	public int selectmax() {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".selectMax1");
	}

	@Override
	public List<ShopVO> selectList(GoodSearchCriteria cri) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".goodselectList", cri);
	}

	@Override
	public int selectCountcate(String category) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".selectCountcate");
	}

	@Override
	public List<buyVO> selectListorder() {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".selectListorder1");
	}

	@Override
	public List<buyVO> selectListorder2() {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".selectListorder2");
	}





}
