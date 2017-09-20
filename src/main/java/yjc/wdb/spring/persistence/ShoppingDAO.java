package yjc.wdb.spring.persistence;

import java.util.List;
import java.util.Map;

import yjc.wdb.spring.domain.*;



public interface ShoppingDAO {

	public int selectCount(String userid) throws Exception;

	public List<ShopVO> selectList(String userid, String keyword) throws Exception;


	public ShopVO selectOne(int goodsNumber) throws Exception;

	public int selectCount();



	public void saveImage(Map<String, Object> hmap) throws Exception;

	public void write(ShopVO shop);

	public List<ShopVO> selectList(String category) throws Exception;

	public List<ShopVO> selectListkey(SearchCriteria cri) throws Exception;

	public int countPaging(SearchCriteria cri);

	public int goodcountPaging(GoodSearchCriteria cri);

	public void decrease(buyVO order);

	public void decrease(CartVO cartVO);

	public void insert(buyVO order);

	public List<buyVO> selectListorder(String userid);

	public void select();

	public int selectmax();

	public List<ShopVO> selectList(GoodSearchCriteria cri);

	public int selectCountcate(String category);

	public List<buyVO> selectListorder();

	public List<buyVO> selectListorder2();



}
