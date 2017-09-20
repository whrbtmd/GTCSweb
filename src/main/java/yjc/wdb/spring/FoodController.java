package yjc.wdb.spring;

import java.util.List;
import java.util.Locale;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import yjc.wdb.spring.domain.BoardBean;
import yjc.wdb.spring.domain.CartListBean;
import yjc.wdb.spring.domain.FoodBean;
import yjc.wdb.spring.domain.GroupBean;
import yjc.wdb.spring.domain.MemberBean;
import yjc.wdb.spring.domain.PageMaker;
import yjc.wdb.spring.domain.SearchCriteria;
import yjc.wdb.spring.domain.TeamBean;
import yjc.wdb.spring.persistence.ImgDAO;
import yjc.wdb.spring.service.FoodService;
import yjc.wdb.spring.service.MemberService;
import yjc.wdb.spring.service.TeamService;

@Controller
public class FoodController {
	@Autowired
	private ImgDAO dao;
	
	@Inject
	private FoodService fser;
	
	

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);


	@RequestMapping(value="foodInsertTest")
	public String foodInsertTest() {
		
		return "/food/foodInsertTest";
	}
	
	
	
	
	@RequestMapping(value="foodInsert", method=RequestMethod.GET)
	public String foodInsert() {
		
		return "/food/foodInsert";
	}
	
	@RequestMapping(value = "/getByteImage1")
	public ResponseEntity<byte[]> getByteImage(
			@RequestParam(value = "pid", required = true) Integer pid) {
		Map<String, Object> map = dao.getByteImage1(pid);
		System.out.println("이미지번호" + pid);
		byte[] imageContent = (byte[]) map.get("imgfile");
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/foodInsert", method=RequestMethod.POST)
	public String food(FoodBean food, String userid, Model model) throws Exception {
		
		fser.finsert(food);
		
		return "redirect:foodList";
	}
	
	
	
	//식사리스트
	@RequestMapping(value="/foodList")
	public String listfood(Model model, FoodBean food) throws Exception{
		
		List<FoodBean> list = fser.listf();
		
		model.addAttribute("listf", list);
		
		return "/food/foodList";
	}
	
	//음료리스트
	@RequestMapping(value="/drinkList")
	public String listdrink(Model model, FoodBean food) throws Exception{
		
		List<FoodBean> list = fser.listd();
		model.addAttribute("listd", list);
		
		return "/food/drinkList";
	}
	
	//디테일
	@RequestMapping(value="/Detail")
	public String readf(Model model, @RequestParam("pid") int pid){
			
			FoodBean food = fser.readf(pid);
			model.addAttribute("food", food);
		
		return "/food/Detail";
	}
	
	//삭제
	@RequestMapping(value="/removef")
	public String remove(@RequestParam("pid")int pid)throws Exception{
		System.out.println("삭제하러 오긴하니?");
		
		fser.removef(pid);
		return "redirect:foodList";
	}
	
	
	//수정
	@RequestMapping(value="/modifyf")
	public String modify(FoodBean food) throws Exception{
		
		fser.modifyf(food);
		
		return "redirect:foodList";
	}
	
	
	/*건협이오빠 그늘집*/
	@RequestMapping(value="menu_write")
	public String menu_write() {
		
		return "/food/menu_write";
	}
	
	@RequestMapping(value="order_charts")
	public String order_charts() {
		
		return "/food/order_charts";
	}
	
	@RequestMapping(value="order_show")
	public String order_show() {
		
		return "/food/order_show";
	}
	
	@RequestMapping(value="sell_charts_month")
	public String sell_charts_month() {
		
		return "/food/sell_charts_month";
	}
	
	@RequestMapping(value="sell_charts")
	public String sell_charts() {
		
		return "/food/sell_charts";
	}
	
	@RequestMapping(value="show_menu")
	public String show_menu() {
		
		return "/food/show_menu";
	}
	
}
