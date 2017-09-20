package yjc.wdb.spring.persistence;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import yjc.wdb.spring.domain.BoardBean;
import yjc.wdb.spring.domain.SearchCriteria;
import yjc.wdb.spring.domain.TeamBean;

@Repository
public class TeamDAOImpl implements TeamDAO {
	@Resource(name = "sqlSession")
	
	@Inject
	private SqlSession session;
	
	private static String namespace="yjc.wdb.mapper.teamMapper";
	
	@Override
	public void regist(TeamBean team) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".regist", team);
	}
	
}