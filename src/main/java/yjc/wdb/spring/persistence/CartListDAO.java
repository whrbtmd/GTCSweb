package yjc.wdb.spring.persistence;

import java.util.List;

import yjc.wdb.spring.domain.CartListBean;


public interface CartListDAO {
	
	// 게시글 등록
		public void registc(CartListBean co) throws Exception;
		
		// 게시글 번호를 가지고 하나의 게시글을 읽어오기
		public CartListBean readc(int pnum) throws Exception;
		
		// 기존 게시글을 수정
		public void modifyc(CartListBean co) throws Exception;
		
		// 게시글 삭제
		public void removec(int pnum) throws Exception;
		
		// 게시글 전체 인출 
		public List<CartListBean> listAllc() throws Exception;


}
