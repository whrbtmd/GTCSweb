package yjc.wdb.spring.persistence;

import java.util.List;

import yjc.wdb.spring.domain.MemberBean;


public interface ScoreDAO {

   public List<MemberBean> list();

}