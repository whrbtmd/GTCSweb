package yjc.wdb.spring.persistence;

import java.util.List;

import yjc.wdb.spring.domain.CartListBean;


public interface CartListDAO {
	
	// �Խñ� ���
		public void registc(CartListBean co) throws Exception;
		
		// �Խñ� ��ȣ�� ������ �ϳ��� �Խñ��� �о����
		public CartListBean readc(int pnum) throws Exception;
		
		// ���� �Խñ��� ����
		public void modifyc(CartListBean co) throws Exception;
		
		// �Խñ� ����
		public void removec(int pnum) throws Exception;
		
		// �Խñ� ��ü ���� 
		public List<CartListBean> listAllc() throws Exception;


}
