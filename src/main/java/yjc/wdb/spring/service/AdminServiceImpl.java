package yjc.wdb.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.spring.domain.*;
import yjc.wdb.spring.persistence.AdminDAO;
import yjc.wdb.spring.persistence.CalendarDAO;
import yjc.wdb.spring.persistence.MemberDAO;

@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	private AdminDAO dao;
	private MemberDAO cdao;


	@Override
	public String goodcount() {
		// TODO Auto-generated method stub
		return dao.goodcount();
	}



	@Override
	public String goodcountmon() {
		// TODO Auto-generated method stub
		return dao.goodcountmon();
	}



	@Override
	public int count() {
		// TODO Auto-generated method stub
		
		return dao.count();
	}



	@Override
	public int countmon() {
		// TODO Auto-generated method stub
		return dao.countmon();
	}



	@Override
	public List<admVO> goodmon() {
		// TODO Auto-generated method stub
		return dao.goodmon();
	}



	@Override
	public int newor() {
		// TODO Auto-generated method stub
		return dao.newor();
	}



	@Override
	public void modify(buyVO buy) {
		// TODO Auto-generated method stub
		dao.modify(buy);
	}



	@Override
	public int pal() {
		// TODO Auto-generated method stub
		return dao.pal();
	}



	@Override
	public List<buyVO> toporder() {
		// TODO Auto-generated method stub
		return dao.toporder();
	}



	@Override
	public List<admVO> goodmonrank() {
		// TODO Auto-generated method stub
		return dao.goodmonrank();
	}



	@Override
	public List<buyVO> toporderrank() {
		// TODO Auto-generated method stub
		return dao.toporderrank();
	}



	@Override
	public int cal() {
		// TODO Auto-generated method stub
		return dao.cal();
	}





}
