package yjc.wdb.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.spring.domain.*;
import yjc.wdb.spring.persistence.*;


@Service
public class ShoppingServiceImpl implements ShoppingService {

	@Inject
	private ShoppingDAO dao;
	
	@Inject
	private CartDAO cartdao;
	
	@Override
	public int selectCount(String userid) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectCount(userid);
	}

	@Override
	public List<ShopVO> selectList(String userid, String keyword) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList(userid, keyword);
	}

//	@Override
//	public int write(ShopVO shop) throws Exception {
//		// TODO Auto-generated method stub
//		return dao.write(shop);
//	}

	@Override
	public ShopVO selectOne(int goodsNumber) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectOne(goodsNumber);
	}

	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return dao.selectCount();
	}

	@Override
	public List<CartVO> cartList(String userid, int cno)  throws Exception {
		// TODO Auto-generated method stub
		return cartdao.selectList(userid, cno);
	}



	@Override
	public void write(ShopVO shop) {
		// TODO Auto-generated method stub
		dao.write(shop);
	}

	@Override
	public void insert(CartVO cart) throws Exception {
		// TODO Auto-generated method stub
		cartdao.insert(cart);
	}

	@Override
	public List<ShopVO> selectList(String category) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList(category);
	}
	@Override
	public List<ShopVO> selectListkey(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectListkey(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri)  throws Exception {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);
	}

	@Override
	public int goodlistSearchCount(GoodSearchCriteria cri) {
		// TODO Auto-generated method stub
		return dao.goodcountPaging(cri);
	}

	@Override
	public void decrease(buyVO order) throws Exception {
		// TODO Auto-generated method stub
		dao.decrease(order);
	}

	@Override
	public void decrease(CartVO cartVO) throws Exception {
		// TODO Auto-generated method stub
		dao.decrease(cartVO);
	}

	@Override
	public int cartDelete(int number) {
		// TODO Auto-generated method stub
		return cartdao.delete(number);
	}

	@Override
	public void insert(buyVO order) {
		// TODO Auto-generated method stub
		dao.insert(order);
	}

	@Override
	public List<buyVO> selectListorder(String userid) {
		// TODO Auto-generated method stub
		return dao.selectListorder(userid);
	}

	@Override
	public void select() {
		// TODO Auto-generated method stub
		dao.select();
	}

	@Override
	public int insertmax(buyVO order) {
		// TODO Auto-generated method stub
		return dao.selectmax();
	}

	@Override
	public List<ShopVO> selectList(GoodSearchCriteria cri)  throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList(cri);
	}

	@Override
	public int selectCountcate(String category) {
		// TODO Auto-generated method stub
		return dao.selectCountcate(category);
	}

	@Override
	public List<buyVO> selectListorder() {
		// TODO Auto-generated method stub
		return dao.selectListorder();
	}

	@Override
	public List<buyVO> selectListorder2() {
		// TODO Auto-generated method stub
		return dao.selectListorder2();
	}







}
