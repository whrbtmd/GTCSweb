package yjc.wdb.spring.persistence;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.spring.domain.MemberBean;


@Repository
public class ScoreImpl implements ScoreDAO {
	@Resource(name = "sqlSession2")
   @Inject
   private SqlSession session;
   private final static String nameSpace = "com.sjk.board.vo.ScoreVO";
   @Override
   public List<MemberBean> list() {
      // TODO Auto-generated method stub
      return session.selectList(nameSpace+".list");
   }

}