package yjc.wdb.spring.persistence;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.spring.domain.ProductBean;
import yjc.wdb.spring.domain.SearchCriteria;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Resource(name = "sqlSession")
	@Inject
	private SqlSession session;
	
	private final String namespace = "yjc.wdb.persistence.ProductDAO";

	@Override
	public List<ProductBean> list(String category) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".list", category);
	}

	@Override
	public ProductBean read(int pnum) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".read", pnum);
	}

	@Override
	public void insertNewProduct(ProductBean p) {
		session.insert(namespace+".insertNewProduct", p);
		
	}

	@Override
	public ProductBean view(String pname) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".view", pname);
	}

	@Override
	public List<ProductBean> listAll() {
		return session.selectList(namespace+".listAll");
	}

	@Override
	public ProductBean readpro(int pnum) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".readpro", pnum);
	}

	@Override
	public void modifypro(ProductBean p) {
		// TODO Auto-generated method stub
		session.update(namespace+".modifypro", p);
	}

	@Override
	public void removepro(int pnum) {
		// TODO Auto-generated method stub
		session.update(namespace+".removepro", pnum);
	}

	@Override
	public List<ProductBean> selectListkey(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".selectListkey", cri);
	}

	@Override
	public int countPaging(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".listSearchCount", cri);
	}

}
