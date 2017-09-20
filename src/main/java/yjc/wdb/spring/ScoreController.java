package yjc.wdb.spring;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import yjc.wdb.spring.domain.MemberBean;
import yjc.wdb.spring.persistence.ScoreDAO;






@SessionAttributes("loginID")
@Controller
public class ScoreController {
   private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
   @Inject
   public ScoreDAO dao; 
   
   @RequestMapping(value="/score", method = RequestMethod.GET)
   public String score(Model model) throws Exception{
      
      List<MemberBean> score = dao.list();
      
      model.addAttribute("score",score);
      
      return "/score1";
            
   }   

}