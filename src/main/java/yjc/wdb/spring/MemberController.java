package yjc.wdb.spring;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import yjc.wdb.spring.domain.GroupBean;
import yjc.wdb.spring.domain.MemberBean;
import yjc.wdb.spring.domain.PageMaker;
import yjc.wdb.spring.domain.SearchCriteria;
import yjc.wdb.spring.domain.TeamBean;
import yjc.wdb.spring.service.MemberService;
import yjc.wdb.spring.service.TeamService;

@Controller
public class MemberController {

	@Inject
	private MemberService mser;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// ȸ������
	/*
	 * @RequestMapping(value="/joinForm") public String joinForm(){ return
	 * "/login/joinForm"; }
	 */

	/*
	 * @RequestMapping(value="join") public String join(MemberBean m) {
	 * 
	 * mser.registm(m); return "redirect:login/joinForm"; }
	 */

	@RequestMapping(value = "/caddieInsert", method = RequestMethod.GET)
	public String registmcaddie() {
		return "/admin/caddieInsert";

	}

	@RequestMapping(value = "/caddieInsert", method = RequestMethod.POST)
	public String registmcaddiePost(MemberBean m) {

		mser.registcd(m);
		return "redirect:caddieMember";

	}

	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public String registmGET() {
		return "/login/joinForm";

	}

	@RequestMapping(value = "/joinForm", method = RequestMethod.POST)
	public String registmPOST(MemberBean m) throws Exception {
		System.out.println("1");
		mser.registm(m);
		System.out.println("2");
		return "GTCSMAIN";
		/* return "/login/loginForm"; */
	}

	/*
	 * @RequestMapping(value="/loginForm", method=RequestMethod.GET) public
	 * String loginForm(){ return "login/loginForm"; }
	 */

	@RequestMapping(value = "/loginForm")
	public String A() {
		return "/login/loginForm";

	}

	// �Ϲ� �α���
	@RequestMapping(value = "loginProcess")
	public String loginProcess(@RequestParam("userid") String userid, @RequestParam("userpw") String userpw, Model model,
			HttpSession session) throws Exception {

		/*
		 * DAO�� �̿��� �����ͺ��̽��� ����ڰ� �Է��� ���̵�� ��ȣ�� ���� ����ڰ� �ִ��� �˻�, �ش� ����ڰ� ������ ���ǿ�
		 * �α����ߴٴ� ������ ����Ѵ�.
		 */

		boolean check = mser.check(userid, userpw);

		if (check) {
			// �α��� ����
			session.setAttribute("userid", userid);
			model.addAttribute("userid", userid);

			return "redirect:GTCSMAIN";
		} else
			// ����
			
			return "redirect:loginForm";
	}

	/* �α׾ƿ� */
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:GTCSMAIN";
	}

	/*
	 * @RequestMapping(value="/modify") public String modify(BoardBean board)
	 * throws Exception { bser.modify(board);
	 * 
	 * return "redirect:notice";
	 * 
	 * }
	 */
	
	@RequestMapping(value = "/myPage")
	public String myPage(Model model, @RequestParam("userid") String userid, 
			HttpSession session) {
		
		session.setAttribute("userid", userid);
		model.addAttribute("userid", userid);
	
		
		return "/login/myPage";

	}

	/* ȸ������ */
	@RequestMapping(value = "/modifycd")
	public String modifycd(MemberBean m) throws Exception {
		mser.modifycd(m);

		return "redirect:caddieMember";

	}

	@RequestMapping(value = "/modifyge")
	public String modifyge(MemberBean m) throws Exception {
		mser.modifyge(m);

		return "redirect:generalMember";

	}
	
	/*@RequestMapping(value = "/modifyge")
	public String modifyge(MemberBean m) throws Exception {
		mser.modifyge(m);

		return "redirect:generalMember";

	}*/

	/* ȸ��Ż�� */
	@RequestMapping(value = "/removecd")
	public String removecd(@RequestParam("userid") String userid) throws Exception {

		mser.removecd(userid);
		return "redirect:caddieMember";
	}

	@RequestMapping(value = "/removege")
	public String removege(@RequestParam("userid") String userid) throws Exception {

		mser.removege(userid);
		return "redirect:GTCSMAIN";
	}
	
	/*@RequestMapping(value = "/removege")
	public String removege(@RequestParam("userid") String userid) throws Exception {

		mser.removege(userid);
		return "redirect:generalMember";
	}*/

	/* ��� ������ */
	@RequestMapping(value = "/readcd")
	public String readcd(@RequestParam("userid") String userid, Model model) throws Exception {

		MemberBean member = mser.readcd(userid);
		model.addAttribute("caddie", member);
		return "/admin/memberCDView";
	}

	@RequestMapping(value = "/readge")
	public String readge(@RequestParam("userid") String userid, Model model) throws Exception {

		MemberBean member = mser.readge(userid);
		model.addAttribute("gemember", member);
		return "/admin/myPage";
	}

	/* ȸ����� */
	@RequestMapping(value = "/generalMember")
	public String listm(Model model, MemberBean member) throws Exception {

		List<MemberBean> list = mser.listm();
		model.addAttribute("listm", list);

		return "/admin/generalMember";

	}

	@RequestMapping(value = "/caddieMember")
	public String listcd(Model model, MemberBean member) throws Exception {

		List<MemberBean> list = mser.listcd();
		model.addAttribute("listcd", list);

		return "/admin/caddieMember";

	}

	
	
	//////////////////////////////////////////�˻�////////////////////////////////////////////////
	@RequestMapping(value = "Member", method = RequestMethod.GET)
	public String MembersearchGET(Model model, @RequestParam(value = "start") String start,
			@RequestParam(value = "end") String end, @RequestParam(value = "time") String time) {
		System.out.println("Member Start " + start + " " + end + " " + time);

		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("time", time);

		return "/calendar/Membersearch";
	}

	// ����˻�
	@RequestMapping(value = "/Membersearch", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String Membersearch(@RequestParam(value = "search") String search) throws Exception {
		Gson gson = new Gson();
		List<MemberBean> membersearch = mser.getsearchmember(search);
		return gson.toJson(membersearch);
	}

	

	@RequestMapping(value = "/Teammemberadd", method = RequestMethod.GET)
	public String teammemberaddGET(Model model, TeamBean team, @RequestParam(value = "search") String search)throws Exception {

		List<MemberBean> membersearch = mser.getsearchmember(search);
		mser.regist(team);


		return "redirect:Membersearch";

	}

	@RequestMapping(value = "Teammemberadd", method = RequestMethod.POST)
	public String teammemberaddPOST(Model model, TeamBean team, @RequestParam("tname") String tname, @RequestParam(value = "start") String start,
			@RequestParam(value = "end") String end, @RequestParam(value = "time") String time)
			throws Exception {

		System.out.println("tname : " + tname);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		System.out.println("time : " + time);
		
		team.setTname(tname);
		mser.regist(team);
	
		return "redirect:MAList?start="+start+"&end="+end+"&time="+time;

	}
	
	@RequestMapping(value = "ADD", method = RequestMethod.POST)
	public String ADDPOST(Model model, TeamBean team, @RequestParam("tname") String tname, @RequestParam("tphone") String tphone, @RequestParam(value = "start") String start,
			@RequestParam(value = "end") String end, @RequestParam(value = "time") String time)
			throws Exception {

		System.out.println("tname : " + tname);
		System.out.println("tphone : " + tphone);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		System.out.println("time : " + time);
		
		team.setTname(tname);
		team.setTphone(tphone);
		mser.regist(team);
	
		return "redirect:MAList?start="+start+"&end="+end+"&time="+time;

	}

	@RequestMapping(value = "MAList", method = RequestMethod.GET)
	public String MemberAddList(Model model, TeamBean team, @RequestParam(value = "start") String start,
			@RequestParam(value = "end") String end, @RequestParam(value = "time") String time) throws Exception {
	
		List<TeamBean> talist = mser.teamAddList();
		model.addAttribute("teamAddList", talist);
		
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("time", time);
		

		return "/calendar/Membersearch";
	}

	@RequestMapping(value = "/addform", method = RequestMethod.GET)
	public String addform(Model model, TeamBean team) throws Exception {
	
		return "redirect:addform";
	}
	
	@RequestMapping(value = "addform", method = RequestMethod.POST)
	public String addformPOST(Model model, TeamBean team, @RequestParam(value = "start") String start,
			@RequestParam(value = "end") String end, @RequestParam(value = "time") String time) throws Exception {
	

		System.out.println("start : " + start);
		System.out.println("end : " + end);
		System.out.println("time : " + time);
		
		return "redirect:event_addform?start="+start+"&end="+end+"&time="+time;
	}
	
	
	
	
	
	////////////////////////////////////////�űԸ���߰�///////////////////////////////////////////
	
	@RequestMapping(value = "/memberadd", method = RequestMethod.GET)
	public String memberaddGET(Model model, GroupBean group, @RequestParam(value = "start") String start,
			@RequestParam(value = "end") String end, @RequestParam(value = "time") String time) throws Exception {
		System.out.println("Member Start " + start + " " + end + " " + time);

		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("time", time);

		return "/calendar/Memberadd";
	}
	
	/*@RequestMapping(value = "memberadd", method = RequestMethod.POST)
	public String memberadd(Model model, GroupBean group, @RequestParam(value = "start") String start,
			@RequestParam(value = "end") String end, @RequestParam(value = "time") String time) throws Exception {
		System.out.println("Member Start " + start + " " + end + " " + time);

		
		int cno = 1;
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("time", time);
		
		mser.registg(group);
		cno++;

		return "redirect:event_addform?start="+start+"&end="+end+"&time="+time;
	}*/
}
