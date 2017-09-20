package yjc.wdb.spring.persistence;

import java.util.List;


import yjc.wdb.spring.domain.BoardBean;
import yjc.wdb.spring.domain.SearchCriteria;

public interface BoardDAO {
	// 게시글 등록
	public void create(BoardBean vo) throws Exception;
	
	// 게시글 번호를 가지고 하나의 게시글을 읽어오기
	public BoardBean readn(int bno) throws Exception;
	
	// 기존 게시글을 수정
	public void update(BoardBean vo) throws Exception;
	
	// 게시글 삭제
	public void delete(int bno) throws Exception;
	
	// 게시글 전체 인출 
	public List<BoardBean> listAll() throws Exception;

	public List<BoardBean> selectListkey(SearchCriteria cri);

	public int countPaging(SearchCriteria cri);


	
	

}