package yjc.wdb.spring;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import yjc.wdb.spring.domain.*;
import yjc.wdb.spring.persistence.*;
import yjc.wdb.spring.service.*;



@SessionAttributes("userid")
@Controller
@RequestMapping(value = "/shop")
public class ShopController {
	@Autowired
	private ImgDAO dao;

	@Inject
	private ShoppingService ShoppingService;
	@Autowired
	private MemberDAO memdao;
	@Inject
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);



	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(
//			@RequestParam(value = "orderby", required = false, defaultValue = "def") String orderby,
			@ModelAttribute("cri")SearchCriteria cri, HttpSession session) throws Exception {
		
		int totalCount = ShoppingService.selectCount();
		ModelAndView modelAndView = new ModelAndView();
		if (totalCount == 0) {

			modelAndView.addObject("goodsVOList", Collections.<ShopVO> emptyList());
			modelAndView.addObject("hasGoods", false);
			return modelAndView;
		}
//		logger.info(cri.toString());
		List<ShopVO> goodsVOList = ShoppingService.selectListkey(cri);
		System.out.print("끝:" + totalCount);
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(ShoppingService.listSearchCount(cri));
		String searchType = cri.getSearchType();
		String keyword = cri.getKeyword();
		modelAndView.addObject("goodsVOList", goodsVOList);
		
		modelAndView.addObject("hasGoods", true);
		modelAndView.addObject("pageMaker",pm);
		modelAndView.addObject("searchType", searchType);
		modelAndView.addObject("keyword",keyword);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/goodlist", method = RequestMethod.GET)
	public ModelAndView goodlist(
			@ModelAttribute("cri")GoodSearchCriteria cri,
			HttpSession session,
			@RequestParam(value = "category", required = false, defaultValue = "club") String category) throws Exception {
		
		int totalCount = ShoppingService.selectCountcate(category);
		ModelAndView modelAndView = new ModelAndView();

		List<ShopVO> goodsVOList = ShoppingService.selectList(cri);
		PageMakercate pm = new PageMakercate();
		pm.setCri(cri);
		pm.setTotalCount(ShoppingService.goodlistSearchCount(cri));
		String searchType = cri.getSearchType();
		String keyword = cri.getKeyword();
		modelAndView.addObject("goodsVOList", goodsVOList);
		modelAndView.addObject("category", category);
		modelAndView.addObject("pageMaker",pm);
		modelAndView.addObject("searchType", searchType);
		modelAndView.addObject("keyword", keyword);
		modelAndView.addObject("hasGoods", true);
		return modelAndView;
	}

	@RequestMapping(value = "/write")
	public String goodsWrite( HttpSession session) throws Exception {
		return "/shop/writeForm";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String goodsWrite(ShopVO shop,HttpSession session) throws Exception {
		ShoppingService.write(shop);
		return "redirect:/shop/list";
	}

	@RequestMapping(value = "/formFile")
	public String formFile() {
		return "formFile";
	}

	@RequestMapping(value = "/view")
	public String view() {
		return "view";
	}

	@RequestMapping(value = "/read")
	public ModelAndView goodsRead(@RequestParam(value = "goodsNumber", required = true) Integer goodsNumber,
			 HttpSession session)
			throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		ShopVO shop = ShoppingService.selectOne(goodsNumber);
		System.out.println("읽는번호" + goodsNumber);
		modelAndView.addObject("goodsVO", shop);
		modelAndView.setViewName("/shop/read");

		return modelAndView;
	}

	@RequestMapping(value = "/read", method = RequestMethod.POST)
	public String cartinsert(CartVO cart,@RequestParam(value = "userid") String userid, HttpSession session) throws Exception {
		session.setAttribute("userid", userid);
		cart.setUserid(userid);
		System.out.println("s:"+userid);
		
		ShoppingService.insert(cart);
		System.out.println("id"+userid);
		return "redirect:/shop/cart";
	}
	
	@RequestMapping(value = "/buy")
	public String buy(buyVO order,ShopVO vo,@RequestParam(value = "userid") String userid,
			@RequestParam("address")String address,
  			@RequestParam("quantity")int quantity,
  			@RequestParam("name")String receiver,HttpSession session) throws Exception {
		System.out.println("receiver:"+receiver);
		session.setAttribute("userid", userid);
		order.setReceiver(receiver);
		System.out.println("sfasf"+receiver);
		ShoppingService.insert(order);
		int selectOrder = ShoppingService.insertmax(order);
		
		
		
		
		order.setNo(selectOrder);
		

		
		
		System.out.println("no:"+selectOrder);
		int bno = order.getBno();
		System.out.println("bno:"+bno);
		ShoppingService.decrease(order);

		
		
		return "redirect:/shop/order";
	}

	@RequestMapping(value = "/order")
	public ModelAndView order(buyVO order,@RequestParam(value = "userid") String userid,
			HttpSession session) throws Exception {
		session.setAttribute("userid", userid);
		ModelAndView modelAndView = new ModelAndView();
		List<buyVO> buyVOList = ShoppingService.selectListorder(userid);
		modelAndView.addObject("buyVOList", buyVOList);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/getByteImage")
	public ResponseEntity<byte[]> getByteImage(
			@RequestParam(value = "goodsNumber", required = true) Integer goodsNumber) {
		Map<String, Object> map = dao.getByteImage(goodsNumber);
		System.out.println("이미지번호" + goodsNumber);
		byte[] imageContent = (byte[]) map.get("imgfile");
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
	}

	@RequestMapping("/cart")
	public ModelAndView cartList(HttpServletRequest request,
			@RequestParam(value = "cno", required = false, defaultValue = "0") int cno,
			@RequestParam(value = "userid") String userid, HttpSession session)
			throws Exception {
		session.setAttribute("userid", userid);
		ModelAndView modelandview = new ModelAndView();
		List<CartVO> lists = ShoppingService.cartList(userid, cno);
		if (lists.isEmpty()) {
			request.setAttribute("hasUser", false);
			return modelandview;
		}
		MemberBean Member = memdao.selectOne(userid);
		modelandview.addObject("cartlist", lists);
		System.out.println("확인: "+cno);
		request.setAttribute("hasUser", true);
		modelandview.addObject("user", Member);
		modelandview.setViewName("/shop/cart");
		

		return modelandview;
	}

	@RequestMapping(value="/delCart")
  	public String delCart(@RequestParam("no")int number,
  			HttpServletRequest request, Model model) throws Exception{
		ShoppingService.cartDelete(number);
		
//  		if(choice == null || choice.isEmpty()){
//  			model.addAttribute("say", "Wrong Input");
//  			model.addAttribute("url", "/shop/cart.do");
//  			return "/error/alert";
//  		}
//  		
//  		if(choice.compareTo("true") != 0){
//  			return "redirect:/goods/cart.do";
//  		}
//  		
//  		if(ShoppingService.cartDelete(number) == 0){
//			model.addAttribute("say", "Wrong already deleted");
//			model.addAttribute("url", "/shop/cart.do");
//			return "/error/alert";
//		}
  		return "redirect:/shop/cart";	
  	}

	@RequestMapping("/Cartlist")
	public ModelAndView CartList() throws Exception {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("/shop/cartlist");

		return mav;
	}
	
/*	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(value = "userid") String userid,
			@ModelAttribute("cri")SearchCriteria cri, HttpSession session) throws Exception {
		System.out.println("유저 아이디 확인 전: " + userid);
		session.setAttribute("userid", userid);
		int totalCount = ShoppingService.selectCount();
		ModelAndView modelAndView = new ModelAndView();
		if (totalCount == 0) {

			modelAndView.addObject("goodsVOList", Collections.<ShopVO> emptyList());
			modelAndView.addObject("hasGoods", false);
			return modelAndView;
		}
//		logger.info(cri.toString());
		List<ShopVO> goodsVOList = ShoppingService.selectListkey(cri);
		System.out.print("끝:" + totalCount);
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(ShoppingService.listSearchCount(cri));
		String searchType = cri.getSearchType();
		String keyword = cri.getKeyword();
		modelAndView.addObject("goodsVOList", goodsVOList);
		modelAndView.addObject("userid", userid);
		System.out.println("유저아이디:"+userid);
		modelAndView.addObject("hasGoods", true);
		modelAndView.addObject("pageMaker",pm);
		modelAndView.addObject("searchType", searchType);
		modelAndView.addObject("keyword",keyword);
		
		return modelAndView;
	}*/


	
	/*@RequestMapping(value = "/goodlist", method = RequestMethod.GET)
	public ModelAndView goodlist(@RequestParam(value = "userid") String userid,
			@ModelAttribute("cri")GoodSearchCriteria cri,
			HttpSession session,
			@RequestParam(value = "category", required = false, defaultValue = "club") String category) throws Exception {
		System.out.println("유저 아이디 확인 전: " + userid);
		session.setAttribute("userid", userid);
		int totalCount = ShoppingService.selectCountcate(category);
		ModelAndView modelAndView = new ModelAndView();

		List<ShopVO> goodsVOList = ShoppingService.selectList(cri);
		PageMakercate pm = new PageMakercate();
		pm.setCri(cri);
		pm.setTotalCount(ShoppingService.goodlistSearchCount(cri));
		String searchType = cri.getSearchType();
		String keyword = cri.getKeyword();
		modelAndView.addObject("goodsVOList", goodsVOList);
		modelAndView.addObject("category", category);
		modelAndView.addObject("userid", userid);
		modelAndView.addObject("pageMaker",pm);
		modelAndView.addObject("searchType", searchType);
		modelAndView.addObject("keyword", keyword);
		modelAndView.addObject("hasGoods", true);
		return modelAndView;
	}

	@RequestMapping(value = "/write")
	public String goodsWrite(@RequestParam(value = "userid") String userid, HttpSession session) throws Exception {
		session.setAttribute("userid", userid);
		return "/shop/writeForm";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String goodsWrite(ShopVO shop,@RequestParam(value = "userid") String userid, HttpSession session) throws Exception {
		session.setAttribute("userid", userid);
		ShoppingService.write(shop);
		return "redirect:/shop/list";
	}

	@RequestMapping(value = "/formFile")
	public String formFile() {
		return "formFile";
	}

	@RequestMapping(value = "/view")
	public String view() {
		return "view";
	}

	@RequestMapping(value = "/read")
	public ModelAndView goodsRead(@RequestParam(value = "goodsNumber", required = true) Integer goodsNumber,
			@RequestParam(value = "userid") String userid, HttpSession session)
			throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		session.setAttribute("userid", userid);
		ShopVO shop = ShoppingService.selectOne(goodsNumber);
		System.out.println("읽는번호" + goodsNumber);
		modelAndView.addObject("goodsVO", shop);
		MemberBean Member = memdao.selectOne(userid);
		modelAndView.addObject("user", Member);
		modelAndView.addObject("userid", userid);
		modelAndView.setViewName("/shop/read");

		return modelAndView;
	}

	@RequestMapping(value = "/read", method = RequestMethod.POST)
	public String cartinsert(CartVO cart,@RequestParam(value = "userid") String userid, HttpSession session) throws Exception {
		session.setAttribute("userid", userid);
		cart.setUserid(userid);
		System.out.println("s:"+userid);
		
		ShoppingService.insert(cart);
		System.out.println("id"+userid);
		return "redirect:/shop/cart";
	}
	
	@RequestMapping(value = "/buy")
	public String buy(buyVO order,ShopVO vo,@RequestParam(value = "userid") String userid,
			@RequestParam("address")String address,
  			@RequestParam("quantity")int quantity,
  			@RequestParam("name")String receiver,HttpSession session) throws Exception {
		System.out.println("receiver:"+receiver);
		session.setAttribute("userid", userid);
		order.setReceiver(receiver);
		System.out.println("sfasf"+receiver);
		ShoppingService.insert(order);
		int selectOrder = ShoppingService.insertmax(order);
		
		
		
		
		order.setNo(selectOrder);
		

		
		
		System.out.println("no:"+selectOrder);
		int bno = order.getBno();
		System.out.println("bno:"+bno);
		ShoppingService.decrease(order);

		
		
		return "redirect:/shop/order";
	}

	@RequestMapping(value = "/order")
	public ModelAndView order(buyVO order,@RequestParam(value = "userid") String userid,
			HttpSession session) throws Exception {
		session.setAttribute("userid", userid);
		ModelAndView modelAndView = new ModelAndView();
		List<buyVO> buyVOList = ShoppingService.selectListorder(userid);
		modelAndView.addObject("buyVOList", buyVOList);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/getByteImage")
	public ResponseEntity<byte[]> getByteImage(
			@RequestParam(value = "goodsNumber", required = true) Integer goodsNumber) {
		Map<String, Object> map = dao.getByteImage(goodsNumber);
		System.out.println("이미지번호" + goodsNumber);
		byte[] imageContent = (byte[]) map.get("imgfile");
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
	}

	@RequestMapping("/cart")
	public ModelAndView cartList(HttpServletRequest request,
			@RequestParam(value = "cno", required = false, defaultValue = "0") int cno,
			@RequestParam(value = "userid") String userid, HttpSession session)
			throws Exception {
		session.setAttribute("userid", userid);
		ModelAndView modelandview = new ModelAndView();
		List<CartVO> lists = ShoppingService.cartList(userid, cno);
		if (lists.isEmpty()) {
			request.setAttribute("hasUser", false);
			return modelandview;
		}
		MemberBean Member = memdao.selectOne(userid);
		modelandview.addObject("cartlist", lists);
		System.out.println("확인: "+cno);
		request.setAttribute("hasUser", true);
		modelandview.addObject("user", Member);
		modelandview.setViewName("/shop/cart");
		

		return modelandview;
	}

	@RequestMapping(value="/delCart")
  	public String delCart(@RequestParam("no")int number,
  			HttpServletRequest request, Model model) throws Exception{
		ShoppingService.cartDelete(number);
		
//  		if(choice == null || choice.isEmpty()){
//  			model.addAttribute("say", "Wrong Input");
//  			model.addAttribute("url", "/shop/cart.do");
//  			return "/error/alert";
//  		}
//  		
//  		if(choice.compareTo("true") != 0){
//  			return "redirect:/goods/cart.do";
//  		}
//  		
//  		if(ShoppingService.cartDelete(number) == 0){
//			model.addAttribute("say", "Wrong already deleted");
//			model.addAttribute("url", "/shop/cart.do");
//			return "/error/alert";
//		}
  		return "redirect:/shop/cart";	
  	}

	@RequestMapping("/Cartlist")
	public ModelAndView CartList() throws Exception {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("/shop/cartlist");

		return mav;
	}*/
}
