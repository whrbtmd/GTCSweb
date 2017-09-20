package yjc.wdb.spring.persistence;

import java.util.Map;


public interface ImgDAO {

	public void saveImage(Map<String, Object> hmap);


	public Map<String, Object> getByteImage(int goodsNumber);

	public Map<String, Object> getByteImage1(int pid);
}
