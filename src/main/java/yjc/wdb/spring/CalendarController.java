package yjc.wdb.spring;

import java.text.DateFormat;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.json.simple.JSONArray;

import yjc.wdb.spring.domain.BoardBean;
import yjc.wdb.spring.domain.CalendarBean;
import yjc.wdb.spring.domain.GroupBean;
import yjc.wdb.spring.domain.MemberBean;
import yjc.wdb.spring.domain.PageMaker;
import yjc.wdb.spring.domain.PurchaseBean;
import yjc.wdb.spring.domain.SearchCriteria;
import yjc.wdb.spring.persistence.CalendarDAO;
import yjc.wdb.spring.persistence.MemberDAO;
import yjc.wdb.spring.service.CalendarService;
import yjc.wdb.spring.service.MemberService;

/**
 * Handles requests for the application home page.
 * @param <E>
 */
@SessionAttributes("userid")
@Controller
public class CalendarController<E> {

	@Autowired
	CalendarDAO caldao;

	@Autowired
	MemberDAO mdao;
	
	@Inject
	private CalendarService calservice;
	
	

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) {
		String userid =(String)request.getSession().getAttribute("userid");
		model.addAttribute("userid", userid);
		System.out.println("userid="+userid);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "calendar/home";
	}
	
	/*@RequestMapping(value = "calendar", method = RequestMethod.GET)
	public String homet(Locale locale, Model model,HttpServletRequest request) {
		String id =(String)request.getSession().getAttribute("id");
		model.addAttribute("id", id);
		
		return "calendar/home";
	}*/
	
	@RequestMapping(value = "calendar", method = RequestMethod.POST)
	public String homet(Locale locale, Model model,HttpServletRequest request) {
		String userid =(String)request.getSession().getAttribute("userid");
		model.addAttribute("userid", userid);
		
		return "calendar/home";
	}
	
	
	@RequestMapping(value = "event_addform", method = RequestMethod.GET)
	public String eventForm(Locale locale, HttpServletRequest request, Model model, @RequestParam("start") String start, @RequestParam("end") String end,@RequestParam("time") String time) {
		String userid =(String)request.getSession().getAttribute("userid");
		System.out.println("event_addForm + "+start+" "+end);
		model.addAttribute("userid", userid);
		model.addAttribute("start",start);
		model.addAttribute("end",end);
		model.addAttribute("time",time);
		
		
		
		
		return "calendar/event_addform";
	}

	@RequestMapping(value = "/addEvent", method = RequestMethod.POST)
	public String info(@ModelAttribute CalendarBean calendar, ModelMap model,PurchaseBean pur, GroupBean group) throws Exception {
		
		String title;
		String start;
		String end;
		String color;
		
		try {
			System.out.println("캘린더 인서트 전");
			start = calendar.getStartday();
			end = calendar.getEndday();
			start = start.replace('/', '-');
			end = start.replace('/', '-');
			calendar.setStartday(start);
			calendar.setEndday(end);
			
			mdao.ginsert(group);
			calendar.setCid(mdao.selectCid());
			System.out.println("--------------------------------" + mdao.selectCid());
			caldao.insertcal(calendar);
			mdao.pinsert(pur);
			
			/*mdao.ginsert(group);*/

			System.out.println("캘린더 인서트 후");

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:home";
		
	}

	@RequestMapping(value = "events")
	public String events(Locale locale, Model model,HttpSession session) {
		List<CalendarBean> calendar = new ArrayList<CalendarBean>();
		String userid = (String) session.getAttribute("userid");
		if (userid.equals("admin")){
			calendar = caldao.getEvents2();
			System.out.println("aso;hdfasdof");
		}else{
			calendar = caldao.getEvents(userid);
		}
		
		JSONArray ja = new JSONArray();
		for (int i = 0; i < calendar.size(); i++) {
			CalendarBean calbean = calendar.get(i);

			ja.add(new CalJson(calbean.getCno(), calbean.getCid(), calbean.getTitle(), calbean.getStartday(), calbean.getEndday(),
					calbean.getColor()));
		}

		model.addAttribute("calendar", ja);
		System.out.println(ja);
		return "calendar/events";
	}
	
	
	@RequestMapping(value = "/event_addform", method = RequestMethod.POST)
	public String event_addform(Locale locale, Model model, @RequestParam("start") String start, @RequestParam("end") String end,@RequestParam("time") String time) {
		
		model.addAttribute("start",start);
		model.addAttribute("end",end);
		model.addAttribute("time",time);
		
		return "calendar/event_addform";
	}

	@RequestMapping(value = "/eventDetail", method = RequestMethod.GET)
	public String eventDetail(Locale locale, Model model,HttpServletRequest request, @RequestParam("cno") int cno, @RequestParam("cid") int cid) throws Exception {
		
		String userid =(String)request.getSession().getAttribute("userid");
		model.addAttribute("userid", userid);
		
		List<CalendarBean> calendardetail = calservice.calendardetail(cno);
		model.addAttribute("calendardetail",calendardetail);
		
		System.out.println(calendardetail);
		return "calendar/eventDetail";
	}
	
	@RequestMapping(value = "/eventList", method = RequestMethod.GET)
	public String eventList(Locale locale, Model model, @RequestParam("start") String start, @RequestParam("end") String end) {
		
		caldao.eventList2(start);
	
		
		System.out.println(caldao.eventList2(start));
		List<CalendarBean> list = caldao.eventList2(start);
		//CalendarBean calend[] = new CalendarBean[11];

		ArrayList<CalendarBean> list1 = new ArrayList<CalendarBean>();

		if(list != null){
			for(int i = 0 ; i<11;i++){
				CalendarBean a = new CalendarBean();
				a.setCno(i+1);
				list1.add(a);
			}
			for(int i = 0 ; i < list.size(); i++){
				String time = list.get(i).getTime();
				int hour = Integer.parseInt(time.substring(0, time.indexOf(":")));
				System.out.println("hour : "+hour);
				int num = hour-7;
				list1.get(num-1).setStatus("예약완료");;
			}
			
		}else{
			System.out.println("list null!");
			for(int i = 0 ; i<11;i++){
				CalendarBean a = new CalendarBean();
				a.setCno(i+1);
				list1.add(a);
			}
		}
		
		
		model.addAttribute("list", list1);
		model.addAttribute("start",start);
		model.addAttribute("end",end);
		
		return "calendar/eventList";
	}
	
	
	@RequestMapping(value = "/eventListAll", method = RequestMethod.POST)
	public String eventListAll() {
				
		return "calendar/home";
	}
	
	@RequestMapping(value = "/eventListAll", method = RequestMethod.GET)
	public String eventListAll2() {
				
		return "calendar/home";
	}
	
	@RequestMapping(value="/datetimepicker", method = RequestMethod.GET)
	public String datetimepicker(){

		return "calendar/datetimepicker";
	}
	
	@RequestMapping(value="/datetimepicker", method = RequestMethod.POST)
	public String datetimepickeR(){

		return "calendar/datetimepicker";
	}
	
	/*@RequestMapping(value="/GTCSMAIN", method = RequestMethod.GET)
	public String GTCSMAIN(){

		return "GTCSMAIN";
	}*/
	
	@RequestMapping(value="/mainpage", method = RequestMethod.GET)
	public String mainpage(){

		return "mainpage";
	}
	
	@RequestMapping(value="/delete")
	public String delete(@RequestParam(value="cno") int cno) throws Exception{
	
		caldao.delete(cno);
		return "redirect:home";
	}
	
	@RequestMapping(value="searchMem", method=RequestMethod.GET)
	 public String searchMemGet(@ModelAttribute("cri")SearchCriteria cri, Model model, MemberBean member, @RequestParam("start") String start, @RequestParam("end") String end,@RequestParam("time") String time)throws Exception{
		System.out.println("abcd");
		List<MemberBean> mlist = calservice.selectListkey(cri);
		System.out.println("ㅇㅁㄹㄴㅇㄻㄴㄻㄴㄻㄴㄻㄴㄹ");
		PageMaker pm = new PageMaker();
	      pm.setCri(cri);
	      model.addAttribute("start",start);
			model.addAttribute("end",end);
			model.addAttribute("time",time);
		model.addAttribute("list", mlist);
		model.addAttribute("pageMaker", pm);
		
		return "calendar/searchMem";
	
	 }
	
	@RequestMapping(value="/searchMem", method=RequestMethod.POST)
	 public String searchMemPost(@ModelAttribute("cri")SearchCriteria cri, Model model, MemberBean member, @RequestParam("start") String start, @RequestParam("end") String end,@RequestParam("time") String time)throws Exception{
		
		List<MemberBean> list = calservice.selectListkey(cri);
		PageMaker pm = new PageMaker();
	      pm.setCri(cri);
	      model.addAttribute("start",start);
			model.addAttribute("end",end);
			model.addAttribute("time",time);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pm);
		
		return "calendar/searchMem";
	
	 }
	
	
	
	
	
	
	/*@RequestMapping(value = "/event_addform", method = RequestMethod.POST)
	public String eventAdd(@RequestParam("id") String id, @RequestParam("name") String name,@RequestParam("phone") String phone) {
				
		return "calendar/event_addform";
	}*/
	
	@RequestMapping(value = "group_ad")
	public String group_ad() {
				
		return "calendar/group_ad";
	}
	
	@RequestMapping(value = "info")
	public String info() {
				
		return "calendar/info";
	}
	
	@RequestMapping(value = "adminReser")
	public String adminReser(Model model) {
		
		List<MemberBean> listcdd = mdao.listcdd();
		model.addAttribute("listcdd", listcdd);
		List<GroupBean> glist = mdao.glist();
		model.addAttribute("glist", glist);
		
		return "calendar/adminReser";
	}
	/*구매*/
	/*@RequestMapping(value = "purchase")
	public String purchase(PurchaseBean pur) {
		
		calservice.pinsert(pur);
				
		return "calendar/info";
	}*/
	
	/*@RequestMapping(value="/readn")
	public String read(@RequestParam("bno") int bno, Model model)throws Exception{
		
		BoardBean board = bser.readn(bno);
		model.addAttribute("board",board );
		return "/main/view";	
	}*/
	
	@RequestMapping(value = "adminReserDetail")
	public String adminReserDetail(Model model, @RequestParam("cid")int cid) {
		
		List<MemberBean> listcd = mdao.listcdd();
		model.addAttribute("listcd", listcd);
		List<GroupBean> groupdetail = mdao.groupdetail(cid);
		model.addAttribute("groupdetail",groupdetail);
		model.addAttribute("cid",cid);		
		return "calendar/adminReserDetail";
	}
	
	@RequestMapping(value = "gmodify")
	public String gmodify(GroupBean group, @RequestParam("cid")int cid) {
	/*public String gmodify(GroupBean group) {*/
		
		/*mdao.ginsert(group);*/
		System.out.println("수정전");
		
		mdao.gmodify(group);
		System.out.println("수정후");		
		return "redirect:adminReser";
	}
}
