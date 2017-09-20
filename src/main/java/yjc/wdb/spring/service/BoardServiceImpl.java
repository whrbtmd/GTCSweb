package yjc.wdb.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.spring.domain.BoardBean;
import yjc.wdb.spring.domain.SearchCriteria;
import yjc.wdb.spring.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Override
	public void regist(BoardBean vo) throws Exception {
		// TODO Auto-generated method stub
		dao.create(vo);

	}

	@Override
	public BoardBean readn(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.readn(bno);
	}

	@Override
	public void modify(BoardBean vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);

	}

	@Override
	public void remove(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(bno);
	}

	@Override
	public List<BoardBean> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public List<BoardBean> selectListkey(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return dao.selectListkey(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return dao.countPaging(cri);
	}

	
		
}