package yjc.wdb.spring;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import yjc.wdb.spring.domain.BoardBean;
import yjc.wdb.spring.domain.PageMaker;
import yjc.wdb.spring.domain.SearchCriteria;
import yjc.wdb.spring.service.BoardService;

@Controller
public class BoardController {
	@Inject
	private BoardService bser;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	//°øÁö»çÇ×
		@RequestMapping(value="/notice")
		public String notice(Model model,HttpServletRequest request)throws Exception{

		    String userid =(String)request.getSession().getAttribute("userid");
			model.addAttribute("userid", userid);
			
			List<BoardBean> list = bser.listAll();
			model.addAttribute("list", list);

			return "/main/notice";
		}
		
		@RequestMapping(value="/register", method=RequestMethod.GET)
		public String registerGET() {
			
			return "/main/register";
		}
		
		@RequestMapping(value="/register", method=RequestMethod.POST) 
		public String registerPOST(BoardBean board) throws Exception{
			
			bser.regist(board);
			
			return "redirect:notice";
		}
		
		@RequestMapping(value="/readn")
		public String read(@RequestParam("bno") int bno, Model model)throws Exception{
			
			BoardBean board = bser.readn(bno);
			model.addAttribute("board",board );
			return "/main/view";	
		}
		
		@RequestMapping(value="/remove")
		public String remove(@RequestParam("bno") int bno) throws Exception{
		
			bser.remove(bno);
			return "redirect:notice";
		}
		
		@RequestMapping(value="/modify")
		public String modify(BoardBean board) throws Exception {
			bser.modify(board);
			
			return "redirect:notice";
			
		}
		
		/* °Ô½ÃÆÇ ÆäÀÌÂ¡*/

		@RequestMapping(value="/notice", method = RequestMethod.GET)
		public String listAll(@ModelAttribute("cri")SearchCriteria cri, Model model,BoardBean board) throws Exception {
			
			List<BoardBean> list = bser.selectListkey(cri);
			PageMaker pm = new PageMaker();
		      pm.setCri(cri);
		      pm.setTotalCount(bser.listSearchCount(cri));
			
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", pm);
			return "/main/notice";
			
		}
		
		/* ¼îÇÎ¸ô ÆäÀÌÂ¡*/
		/*@RequestMapping(value="/notice", method = RequestMethod.GET)
		public String listShop(@ModelAttribute("cri")SearchCriteria cri, Model model,BoardBean board) throws Exception {
			
			List<BoardBean> list = bser.selectListkey(cri);
			PageMaker pm = new PageMaker();
		      pm.setCri(cri);
		      pm.setTotalCount(bser.listSearchCount(cri));
			
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", pm);
			return "/main/notice";
			
		}*/

}