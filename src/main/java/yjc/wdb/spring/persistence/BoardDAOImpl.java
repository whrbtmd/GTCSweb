package yjc.wdb.spring.persistence;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import yjc.wdb.spring.domain.BoardBean;
import yjc.wdb.spring.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Resource(name = "sqlSession")
	@Inject
	private SqlSession session;
	
	private static String namespace="yjc.wdb.mapper.boardMapper";

	@Override
	public void create(BoardBean vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".create", vo);
	}

	@Override
	public BoardBean readn(int bno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".readn", bno);
	}

	@Override
	public void update(BoardBean vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update", vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete", bno);
	}

	@Override
	public List<BoardBean> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".listAll");
	}

	@Override
	public List<BoardBean> selectListkey(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".selectListkey", cri);
	}

	@Override
	public int countPaging(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".listSearchCount", cri);
	}


	
}