package yjc.wdb.spring;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import yjc.wdb.spring.domain.BoardBean;
import yjc.wdb.spring.domain.MemberBean;
import yjc.wdb.spring.domain.PageMaker;
import yjc.wdb.spring.domain.ProductBean;
import yjc.wdb.spring.domain.SearchCriteria;
import yjc.wdb.spring.persistence.ProductDAO;
import yjc.wdb.spring.persistence.MemberDAO;
import yjc.wdb.spring.service.BoardService;
import yjc.wdb.spring.service.MemberService;
import yjc.wdb.spring.service.ProductService;

/**
 * Handles requests for the application home page.
 */

@SessionAttributes("userid")
@Controller
public class HomeController {

	@Inject
	private ProductDAO pdao;

	@Inject
	private MemberDAO mdao;

	@Inject
	private ProductService service;


	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value="GTCSMAIN")
	 public String GTCSMAIN(){
		 return "GTCSMAIN";
	 }
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	
	
	@RequestMapping(value = "/listPutters")
	public String putter(Model model) {
		model.addAttribute("list",service.listAll());
		return "/product/listPutters";
	}
	@RequestMapping(value = "/traffic")
	public String traffic() {
		return "/traffic";
	}
	
	@RequestMapping(value="/list")
	public String listPutters(@ModelAttribute("cri")SearchCriteria cri,Model model) throws Exception {
		
		/*List<ProductBean> list = service.selectListkey(cri);
		PageMaker pm = new PageMaker();
	      pm.setCri(cri);
	      pm.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pm);*/
		
		
		List<ProductBean> list = service.list(null);
		model.addAttribute("list", list);

		return "/product/listPutters";
	}
	

	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(@ModelAttribute("cri")SearchCriteria cri, Model model, HttpServletRequest request, @RequestParam(value="category", defaultValue="DRIVERS") String category) throws Exception {
		
		
		/*
		List<ProductBean> list = service.selectListkey(cri);
		PageMaker pm = new PageMaker();
	    pm.setCri(cri);
	    pm.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pm);*/
		
		
		
		List<ProductBean> list = pdao.list(category);
		logger.info(category);

		model.addAttribute("list", list);
		return "insert";
	}

	@RequestMapping(value = "newinsert", method = RequestMethod.POST)
	public String insertNewProduct(Model model, ProductBean p, @RequestParam("photo") MultipartFile file,
			HttpServletRequest req) {
		System.out.println(p.getId());
		if (file.isEmpty() == false) {
			/*
			 * Ŭ���̾�Ʈ�κ��� ���޹޾Ƽ� ���� ��ǻ�� ��򰡿� ����� ������ �츮�� ���ϴ� ��(resources/img)��
			 * ��������.
			 */
			try {
				// 1. file ��ü�κ��� ���� ������ ����Ʈ���� �����´�.
				byte[] bytes = file.getBytes();

				// 2. bytes �迭�� ������ ������ ���� ����(resources/img) ���� ��θ� ���Ѵ�.
				// String rootPath =
				// req.getSession().getServletContext().getRealPath("resources/img");
				String rootPath = "D:/spring/sts-bundle/sts-3.7.3.RELEASE/workspace/WDB1/src/main/webapp/resources/img";
				System.out.println("rootPath:" + rootPath);

				// 3. rootPath�� ������ ������ �����ϴ��� �˻��ϰ�, �������� ������ �� ������ �����Ѵ�.
				File folder = new File(rootPath);
				if (folder.exists() == false)
					folder.mkdir();

				// 4. �����ʿ� ����� �����̸��� Ŭ���̾�Ʈ ������ ������ ������ �����̸��� �����ϰ� �Ѵ�.
				String fileName = file.getOriginalFilename();

				// 5. rootPath �ؿ� fileName�� �ش��ϴ� ���Ͽ� ���޹��� ���ϳ���(bytes)��
				// ���� ���ؼ� BufferedOutputStream ��ü�� �����Ѵ�.
				File serverFile = new File(folder.getAbsolutePath() + "/" + fileName);
				BufferedOutputStream stream = null;
				stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("orgFileName:" + file.getOriginalFilename());
			System.out.println("���ϰ��:" + req.getSession().getServletContext().getRealPath("resources/img"));
			p.setPimage(file.getOriginalFilename());
			service.insertNewProduct(p);
		}

		return "redirect:insert?category="+p.getPcategory();

	}

	@RequestMapping(value = "/selectMenu")
	public String selectMenu() {
		return "/main/selectMenu";
	}

	/*@RequestMapping(value = "/productView")
	public String productView(@RequestParam("pnum") int pnum, Model model) {
		model.addAttribute("product", service.read(pnum));
		return "/product/productView";
	}*/

	@RequestMapping(value = "/observer")
	public String observer(HttpServletRequest request) {
		String userid = (String) request.getSession().getAttribute("userid");
		return "/main/observer";
	}

	@RequestMapping(value = "/readpro")
	public String readpro(@RequestParam("pnum") int pnum, Model model)throws Exception{
		
		ProductBean product = service.readpro(pnum);
		model.addAttribute("product", product );
		return "/product/productView";	
	}
	
	
	/*��ǰ����*/
	@RequestMapping(value="/modifypro")
	public String modifycd(ProductBean p) throws Exception {
		service.modifypro(p);
		String ma = p.getPmaker();
		System.out.println("ma:"+ma);
		return "redirect:insert";
		
	}
	
	/*��ǰ����*/
	 @RequestMapping(value="/removepro")
		public String removepro(@RequestParam("pnum") int pnum) throws Exception{
		
		 service.removepro(pnum);
			return "redirect:insert";
		}
	
	
	// ������������
		@RequestMapping(value = "/adminPage")
		public String admin(String userid, Model model) {
			
			return "/admin/adminPage";
		}
		
		@RequestMapping(value = "/member")
		public String adminMember(String userid, Model model) {
			
			return "/admin/member";
		}
		
		@RequestMapping(value = "/productRegister")
		public String productRegister() {
			
			return "/product/productRegister";
		}
		
}
