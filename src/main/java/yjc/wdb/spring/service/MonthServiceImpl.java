package yjc.wdb.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.spring.domain.recordVO;
import yjc.wdb.spring.persistence.AdminDAO;

@Service
public class MonthServiceImpl implements MonthService {
	@Inject
	private AdminDAO dao;
	@Override
	public int il() {
		// TODO Auto-generated method stub
		return dao.il();
	}

	@Override
	public int lee() {
		// TODO Auto-generated method stub
		return dao.lee();
	}

	@Override
	public int sa() {
		// TODO Auto-generated method stub
		return dao.sa();
	}

	@Override
	public int sam() {
		// TODO Auto-generated method stub
		return dao.sam();
	}

	@Override
	public int oh() {
		// TODO Auto-generated method stub
		return dao.oh();
	}

	@Override
	public int youk() {
		// TODO Auto-generated method stub
		return dao.youk();
	}

	@Override
	public int chil() {
		// TODO Auto-generated method stub
		return dao.chil();
	}

	@Override
	public int sip() {
		// TODO Auto-generated method stub
		return dao.sip();
	}

	@Override
	public int sipil() {
		// TODO Auto-generated method stub
		return dao.sipil();
	}

	@Override
	public int gu() {
		// TODO Auto-generated method stub
		return dao.gu();
	}

	@Override
	public int siplee() {
		// TODO Auto-generated method stub
		return dao.siplee();
	}

	@Override
	public String lee1() {
		// TODO Auto-generated method stub
		return dao.lee1();
	}

	@Override
	public List<recordVO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public List<recordVO> list2() {
		// TODO Auto-generated method stub
		return dao.list2();
	}

	@Override
	public List<recordVO> list3() {
		// TODO Auto-generated method stub
		return dao.list3();
	}

}
