package yjc.wdb.spring.persistence;

import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ImgDAOImpl implements ImgDAO {
	@Resource(name = "sqlSession")
	@Inject
	private SqlSession session;

	private final static String namespace = "com.sjk.board.vo.ShopVO";

	@Override
	public void saveImage(Map<String, Object> hmap) {
		// TODO Auto-generated method stub
		session.insert(namespace+".saveImage",hmap);
	}

	@Override
	public Map<String, Object> getByteImage(int goodsNumber) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getByteImage", goodsNumber);
	}

	@Override
	public Map<String, Object> getByteImage1(int pid) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getByteImage1", pid);
	}



}
