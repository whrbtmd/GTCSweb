package yjc.wdb.spring.service;

import java.util.List;

import yjc.wdb.spring.domain.CartListBean;

public interface CartListService {

	public void registc(CartListBean cart) throws Exception;

	public CartListBean readc(int pnum)throws Exception;

	public void removec(int pnum)throws Exception;

	public void modifyc(CartListBean cart)throws Exception;

	public List<CartListBean> listAllc()throws Exception;

}
