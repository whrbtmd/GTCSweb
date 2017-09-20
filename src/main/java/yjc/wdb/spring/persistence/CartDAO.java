package yjc.wdb.spring.persistence;

import java.util.List;

import yjc.wdb.spring.domain.CartVO;


public interface CartDAO {

	public List<CartVO> selectList(String userid, int cno) throws Exception ;

	public void insert(CartVO cart) throws Exception ;

	public int delete(int number);


}
