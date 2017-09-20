package yjc.wdb.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.spring.domain.FoodBean;
import yjc.wdb.spring.persistence.FoodDAO;

@Service
public class FoodServiceImpl implements FoodService{

	@Inject
	private FoodDAO fdao;
	
	@Override
	public void finsert(FoodBean food) throws Exception {
		// TODO Auto-generated method stub
		
		fdao.finsert(food);
	}

	@Override
	public List<FoodBean> listf() {
		// TODO Auto-generated method stub
		return fdao.listf();
	}

	@Override
	public List<FoodBean> listd() {
		// TODO Auto-generated method stub
		return fdao.listd();
	}

	@Override
	public FoodBean readf(int pid) {
		// TODO Auto-generated method stub
		return fdao.readf(pid);
	}

	@Override
	public void removef(int pid) {
		// TODO Auto-generated method stub
		fdao.deletef(pid);
	}

	@Override
	public void modifyf(FoodBean food) {
		// TODO Auto-generated method stub
		fdao.updatef(food);
	}




}
