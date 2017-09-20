package yjc.wdb.spring.service;

import javax.inject.Inject;

import yjc.wdb.spring.domain.TeamBean;
import yjc.wdb.spring.persistence.TeamDAO;

public class TeamServiceImpl implements TeamService{
	
	@Inject
	private TeamDAO tdao;

	@Override
	public void regist(TeamBean team) throws Exception {
		// TODO Auto-generated method stub
		
		tdao.regist(team);
	}

}
