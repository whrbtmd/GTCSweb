package yjc.wdb.spring.service;

import java.util.List;

import yjc.wdb.spring.domain.BoardBean;
import yjc.wdb.spring.domain.SearchCriteria;


public interface BoardService {
	public void regist(BoardBean vo) throws Exception;
	public BoardBean readn(int bno) throws Exception;
	public void modify(BoardBean vo) throws Exception;
	public void remove(int bno) throws Exception;
	public List<BoardBean> listAll() throws Exception;
	
	
	public List<BoardBean> selectListkey(SearchCriteria cri);
	public int listSearchCount(SearchCriteria cri);
	
	


}