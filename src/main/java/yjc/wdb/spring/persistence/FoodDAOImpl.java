package yjc.wdb.spring.persistence;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.spring.domain.FoodBean;

@Repository
public class FoodDAOImpl implements FoodDAO{
	@Resource(name = "sqlSession2")
	
	@Inject
	private SqlSession sqlSession;
	
	private final String namespace = "yjc.wdb.mapper.foodMapper";

	@Override
	public void finsert(FoodBean food) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".finsert", food);
	}

	@Override
	public List<FoodBean> listf() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listf");
	}

	@Override
	public List<FoodBean> listd() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listd");
	}

	@Override
	public FoodBean readf(int pid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".readf", pid);
	}

	@Override
	public void deletef(int pid) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".deletef", pid);
	}

	@Override
	public void updatef(FoodBean food) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".updatef", food);
	}

	

}
