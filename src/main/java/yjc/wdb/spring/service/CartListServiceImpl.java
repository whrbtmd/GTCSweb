package yjc.wdb.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.spring.domain.CartListBean;
import yjc.wdb.spring.persistence.CartListDAO;

@Service
public class CartListServiceImpl implements CartListService{

	
	@Inject
	private CartListDAO cdao;
	
	
	@Override
	public void registc(CartListBean co)throws Exception {
		// TODO Auto-generated method stub
		cdao.registc(co);
	}

	@Override
	public CartListBean readc(int pnum) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("readc be");
		return cdao.readc(pnum);
	}

	@Override
	public void removec(int pnum)throws Exception {
		// TODO Auto-generated method stub
		cdao.removec(pnum);
	}

	@Override
	public void modifyc(CartListBean co)throws Exception {
		// TODO Auto-generated method stub
		cdao.modifyc(co);
	}

	@Override
	public List<CartListBean> listAllc() throws Exception{
		// TODO Auto-generated method stub
		return cdao.listAllc();
	}

}
