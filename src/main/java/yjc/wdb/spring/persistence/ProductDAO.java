package yjc.wdb.spring.persistence;

import java.util.List;

import yjc.wdb.spring.domain.ProductBean;
import yjc.wdb.spring.domain.SearchCriteria;

public interface ProductDAO {
	
	public void insertNewProduct(ProductBean p);
	public ProductBean view(String pname);
	
	public List<ProductBean> list(String category);

	public ProductBean read(int pnum);

	public List<ProductBean> listAll();
	public ProductBean readpro(int pnum);
	public void modifypro(ProductBean p);
	public void removepro(int pnum);
	public List<ProductBean> selectListkey(SearchCriteria cri);
	public int countPaging(SearchCriteria cri);
}
