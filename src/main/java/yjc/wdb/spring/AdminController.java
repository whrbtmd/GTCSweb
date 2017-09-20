package yjc.wdb.spring;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import yjc.wdb.spring.domain.*;
import yjc.wdb.spring.persistence.MemberDAO;
import yjc.wdb.spring.service.*;



@RequestMapping(value = "/adm")
@SessionAttributes("userid")
@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private MemberService mser;
	@Inject
	private ShoppingService ShoppingService;
	@Inject
	private AdminService AdmService;
	@Inject
	private MonthService monService;
	@Autowired
	MemberDAO mdao;
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, CartVO cartVO,
			@RequestParam(value = "userid", required = false) String userid,
			@RequestParam(value = "f", required = false) String category, HttpSession session) throws Exception {
		ShoppingService.decrease(cartVO);
		session.setAttribute("userid", userid);
		List<ShopVO> goodsVOList = ShoppingService.selectList(category);
		model.addAttribute("list", goodsVOList);
		model.addAttribute("userid", userid);
		return "/adm/list";
	}
	
	@RequestMapping(value = "/order")
	public ModelAndView order(Model model) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		List<buyVO> buyVOList = ShoppingService.selectListorder();
		List<buyVO> buyVOList2 = ShoppingService.selectListorder2();
		modelAndView.addObject("buyVOList", buyVOList);
		modelAndView.addObject("buyVOList2", buyVOList2);
		String goodcountmon = AdmService.goodcountmon();
		int newor = AdmService.newor();
		model.addAttribute("newor", newor);
		model.addAttribute("goodcountmon", goodcountmon);
		return modelAndView;
	}

	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String orderstate(Model model, buyVO buy) {
		AdmService.modify(buy);
		int a = buy.getNo();
		System.out.print("a"+a);
		return "/adm/main";
	}
	
	@RequestMapping(value = "/home")
	public String main(@RequestParam(value = "userid", required = false) String userid,Model model, MemberBean member,
			HttpSession session) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		session.setAttribute("userid", userid);
		modelAndView.addObject("userid", userid);
		String goodcount = AdmService.goodcount();
		List<admVO> list = AdmService.goodmon();
//		List<admVO> list1 = AdmService.goodmonrank();
		String goodcountmon = AdmService.goodcountmon();
		int newor = AdmService.newor();
		System.out.println("cal: ");
		int cal = mdao.cal();
		model.addAttribute("cal", cal);
		System.out.println("cal: "+ cal);
		int count = AdmService.count();
		int countmon = AdmService.countmon();
		int aa = (countmon/count)*100;
//		
		List<MemberBean> mlist = mser.listm();
		
		model.addAttribute("mlist", mlist);
		
		List<MemberBean> listcd = mser.listcd();
		model.addAttribute("listcd", listcd);
		
		List<buyVO> toporder = AdmService.toporder();
		List<buyVO> toporderrank = AdmService.toporderrank();
		
//		String a = toporderrank.getName();
		modelAndView.addObject("toporderrank", toporderrank);
		modelAndView.addObject("toporder", toporder);	
		
		System.out.println("goodcount: "+ countmon/count);
		model.addAttribute("newor", newor);
		model.addAttribute("goodcount", goodcount);
		model.addAttribute("list", list);
		model.addAttribute("toporder", toporder);
		model.addAttribute("goodcountmon", goodcountmon);
		model.addAttribute("count", count);
		model.addAttribute("countmon", countmon);
		model.addAttribute("aa", aa);
		
		List<recordVO> list1 = monService.list();
		List<recordVO> list2 = monService.list2();
		List<recordVO> list3 = monService.list3();
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
//		int il = monService.il();
//		String lee1 = monService.lee1();
//		int sam = monService.sam();
//		int sa = monService.sa();
//		int oh = monService.oh();
//		int youk = monService.youk();
//		int chil = monService.chil();
//		int pal = AdmService.pal();
//		int gu = monService.gu();
//		int sip= monService.sip();
//		int sipil = monService.sipil();
//		int siplee = monService.siplee();
//		List<RecordVO> list2 = rdao.list2();
//		if (isEmpty(lee)) {}
//		int lee2 = Integer.parseInt(lee1);
		
//		model.addAttribute("pal", pal);
//		model.addAttribute("il", il);
//		model.addAttribute("lee1", lee2);
//		model.addAttribute("sam", sam);
//		model.addAttribute("sa", sa);
//		model.addAttribute("oh", oh);
//		model.addAttribute("youk", youk);
//		model.addAttribute("chil", chil);
//		model.addAttribute("gu", gu);
//		model.addAttribute("sip", sip);
//		model.addAttribute("sipil", sipil);
//		model.addAttribute("siplee", siplee);
		
		return "/adm/main";
	}


	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET() {
		System.out.println("register get.....");

		return "/board/register";
	}
	

	@RequestMapping(value = "/traffic")
		public String traffic() {
			
			return "/admin/traffic";
		}

	@RequestMapping(value = "/mainDegin")
	public String mainDegin() {
		
		return "mainDegin";
	}

	@RequestMapping(value = "/adminTraffic")
	public String adminTraffic() {
		return "/adm/admin";
	}
	
}
