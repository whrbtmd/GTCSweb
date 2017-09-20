package yjc.wdb.spring.service;

import java.util.List;

import yjc.wdb.spring.domain.FoodBean;

public interface FoodService {
	
	public void finsert(FoodBean food) throws Exception;

	public List<FoodBean> listf();

	public List<FoodBean> listd();

	public FoodBean readf(int pid);

	public void removef(int pid);

	public void modifyf(FoodBean food);



}
