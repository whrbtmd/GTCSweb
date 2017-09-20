package yjc.wdb.spring.persistence;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yjc.wdb.spring.domain.TestgetImages;

@Repository
public class testBoardDaoImpl implements TestBoardDao {
	@Resource(name = "sqlSession")
    @Autowired
    private SqlSession session;
	private final static String namespace = "com.sjk.board.vo.ShopVO";
   @Override
    public TestgetImages getImage(int bno) {
        TestgetImages getImage = session.selectOne(namespace + ".getImages", bno);
        return getImage;
    }
}
