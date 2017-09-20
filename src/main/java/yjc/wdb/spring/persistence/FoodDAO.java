package yjc.wdb.spring.persistence;

import java.util.List;

import yjc.wdb.spring.domain.FoodBean;

public interface FoodDAO {

	public void finsert(FoodBean food);

	public List<FoodBean> listf();

	public List<FoodBean> listd();

	public FoodBean readf(int pid);

	public void deletef(int pid);

	public void updatef(FoodBean food);


}
