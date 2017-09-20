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
			 * 클라이언트로부터 전달받아서 서버 컴퓨터 어딘가에 저장된 파일을 우리가 원하는 곳(resources/img)에
			 * 복사하자.
			 */
			try {
				// 1. file 객체로부터 파일 내용의 바이트들을 가져온다.
				byte[] bytes = file.getBytes();

				// 2. bytes 배열을 저장할 파일이 속할 폴더(resources/img) 절대 경로를 구한다.
				// String rootPath =
				// req.getSession().getServletContext().getRealPath("resources/img");
				String rootPath = "D:/spring/sts-bundle/sts-3.7.3.RELEASE/workspace/WDB1/src/main/webapp/resources/img";
				System.out.println("rootPath:" + rootPath);

				// 3. rootPath의 폴더가 실제로 존재하는지 검사하고, 존재하지 않으면 그 폴더를 생성한다.
				File folder = new File(rootPath);
				if (folder.exists() == false)
					folder.mkdir();

				// 4. 서버쪽에 저장될 파일이름은 클라이언트 측에서 전달한 원래의 파일이름과 동일하게 한다.
				String fileName = file.getOriginalFilename();

				// 5. rootPath 밑에 fileName에 해당하는 파일에 전달받은 파일내용(bytes)을
				// 쓰기 위해서 BufferedOutputStream 객체를 생성한다.
				File serverFile = new File(folder.getAbsolutePath() + "/" + fileName);
				BufferedOutputStream stream = null;
				stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("orgFileName:" + file.getOriginalFilename());
			System.out.println("파일경로:" + req.getSession().getServletContext().getRealPath("resources/img"));
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
	
	
	/*상품수정*/
	@RequestMapping(value="/modifypro")
	public String modifycd(ProductBean p) throws Exception {
		service.modifypro(p);
		String ma = p.getPmaker();
		System.out.println("ma:"+ma);
		return "redirect:insert";
		
	}
	
	/*상품삭제*/
	 @RequestMapping(value="/removepro")
		public String removepro(@RequestParam("pnum") int pnum) throws Exception{
		
		 service.removepro(pnum);
			return "redirect:insert";
		}
	
	
	// 관리자페이지
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
