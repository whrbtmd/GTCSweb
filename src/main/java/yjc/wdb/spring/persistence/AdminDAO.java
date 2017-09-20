package yjc.wdb.spring.persistence;

import java.util.List;

import yjc.wdb.spring.domain.admVO;
import yjc.wdb.spring.domain.buyVO;
import yjc.wdb.spring.domain.recordVO;



public interface AdminDAO {

	public String goodcount();

	public String goodcountmon();

	public int count();

	public int countmon();

	public List<admVO> goodmon();

	public int newor();

	public void modify(buyVO buy);

	public int pal();

	public int il();

	public int lee();

	public int sa();

	public int oh();

	public int sam();

	public int youk();

	public int chil();

	public int sipil();

	public int sip();

	public int gu();

	public int siplee();

	public List<buyVO> toporder();

	public List<admVO> goodmonrank();

	public List<buyVO> toporderrank();

	public String lee1();

	public List<recordVO> list();

	public List<recordVO> list2();

	public List<recordVO> list3();

	public int cal();


}
