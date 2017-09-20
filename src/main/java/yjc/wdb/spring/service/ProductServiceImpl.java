package yjc.wdb.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.spring.domain.ProductBean;
import yjc.wdb.spring.domain.SearchCriteria;
import yjc.wdb.spring.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {

	   
	@Inject
	private ProductDAO pdao;
	
	@Override
	public void insertNewProduct(ProductBean p){
		// TODO Auto-generated method stub
		pdao.insertNewProduct(p);
	}

	@Override
	public ProductBean view(String pname) {
		// TODO Auto-generated method stub
		return pdao.view(pname);
	}

	@Override
	public ProductBean read(int pnum) {
		// TODO Auto-generated method stub
		return pdao.read(pnum);
	}

	@Override
	public List<ProductBean> list(String category) {
		// TODO Auto-generated method stub
		return pdao.list(category);
	}

	@Override
	public List<ProductBean> listAll() {
		// TODO Auto-generated method stub
		return pdao.listAll();
	}

	@Override
	public ProductBean readpro(int pnum) {
		// TODO Auto-generated method stub
		return pdao.readpro(pnum);
	}

	@Override
	public void modifypro(ProductBean p) {
		pdao.modifypro(p);
		
	}

	@Override
	public void removepro(int pnum) {
		pdao.removepro(pnum);
		
	}

	@Override
	public List<ProductBean> selectListkey(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return pdao.selectListkey(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return pdao.countPaging(cri);
	}
}
