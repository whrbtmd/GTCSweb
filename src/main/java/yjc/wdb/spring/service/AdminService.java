package yjc.wdb.spring.service;

import java.util.List;

import yjc.wdb.spring.domain.*;



public interface AdminService {

	public String goodcount();

	public String goodcountmon();

	public int count();

	public int countmon();

	public List<admVO> goodmon();

	public int newor();

	public void modify(buyVO buy);

	public int pal();

	public List<buyVO> toporder();

	public List<admVO> goodmonrank();

	public List<buyVO> toporderrank();

	public int cal();



}
