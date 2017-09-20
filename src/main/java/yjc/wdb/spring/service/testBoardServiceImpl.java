package yjc.wdb.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yjc.wdb.spring.domain.TestgetImages;
import yjc.wdb.spring.persistence.TestBoardDao;

@Service
public class testBoardServiceImpl implements testBoardService {
    @Autowired
    private TestBoardDao testBoardDao;
 
   @Override
    public TestgetImages getImage(int bno) {
    TestgetImages getImages = testBoardDao.getImage(bno);
    return getImages;
    }

}
