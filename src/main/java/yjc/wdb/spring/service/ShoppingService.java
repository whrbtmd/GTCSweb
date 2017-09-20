package yjc.wdb.spring.service;

import java.util.List;

import yjc.wdb.spring.domain.*;



public interface ShoppingService {

	public int selectCount(String userid) throws Exception;

	public List<ShopVO> selectList(String userid, String keyword) throws Exception;

	public int selectCount();

	public List<CartVO> cartList(String userid, int cno) throws Exception ;


	public ShopVO selectOne(int goodsNumber) throws Exception;

	public void write(ShopVO shop);

	public void insert(CartVO cart) throws Exception;

	public List<ShopVO> selectList(String category) throws Exception;

	public List<ShopVO> selectListkey(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public int goodlistSearchCount(GoodSearchCriteria cri);

	public void decrease(buyVO order) throws Exception;

	public void decrease(CartVO cartVO) throws Exception;

	public int cartDelete(int number);

	public void insert(buyVO order);

	public List<buyVO> selectListorder(String userid);

	public void select();

	public int insertmax(buyVO order);

	public List<ShopVO> selectList(GoodSearchCriteria cri) throws Exception;

	public int selectCountcate(String category);

	public List<buyVO> selectListorder();

	public List<buyVO> selectListorder2();



}
