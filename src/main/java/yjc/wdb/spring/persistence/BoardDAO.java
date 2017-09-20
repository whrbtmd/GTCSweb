package yjc.wdb.spring.persistence;

import java.util.List;


import yjc.wdb.spring.domain.BoardBean;
import yjc.wdb.spring.domain.SearchCriteria;

public interface BoardDAO {
	// �Խñ� ���
	public void create(BoardBean vo) throws Exception;
	
	// �Խñ� ��ȣ�� ������ �ϳ��� �Խñ��� �о����
	public BoardBean readn(int bno) throws Exception;
	
	// ���� �Խñ��� ����
	public void update(BoardBean vo) throws Exception;
	
	// �Խñ� ����
	public void delete(int bno) throws Exception;
	
	// �Խñ� ��ü ���� 
	public List<BoardBean> listAll() throws Exception;

	public List<BoardBean> selectListkey(SearchCriteria cri);

	public int countPaging(SearchCriteria cri);


	
	

}