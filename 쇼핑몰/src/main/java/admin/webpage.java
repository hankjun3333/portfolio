package admin;

import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



@Controller
public class webpage {
	
	@Inject
	private SqlSessionFactory sqlsessionfactory;
	
	@Resource
	private SqlSessionTemplate sqlsession;
	PrintWriter pw = null;
	HttpSession session = null;
	@PostMapping("/admin/admin_login.do")
	public String adlogin(HttpServletResponse res,
			HttpServletRequest req, 
			@RequestParam String aid,
			@RequestParam String apass) throws Exception{
		res.setContentType("text/html; charset=utf-8;");
		this.pw = res.getWriter();
		
		if(aid.intern() == "master" && apass.intern() == "shop_master123") {
			this.session = req.getSession();
			this.session.setAttribute("aid", "최고 관리자");
			this.pw.write("<script>"
					+ "alert('정상적으로 로그인 되셨습니다');"
					+ "location.href='./admin_mainok.do';"
					+ "</script>");
		}
		else {
			this.pw.write("<script>"
					+ "alert('계정이 틀립니다');"
					+ "history.go(-1);"
					+ "</script>");
		}
		this.pw.close();
		
		return "/admin/index"; 
	}
	
/*
 로그인 완료 후 회원리스트 출력하는 컨트롤러
 member 테이블 -> datadto에서 셋팅 -> selectList를 통한
 데이터를 list 에 저장 및 req.setAttribute를 통해 admin/admin_main.jsp 페이지에
 데이터 출력 + 해당 사용자 Y or N 여부 update 하는 부분! 
 */
	@GetMapping("admin/admin_mainok.do")
	public String member_lists(@RequestParam(required=false) String midx,
			@RequestParam(required=false) String use_ck,
			HttpServletRequest req,
			@ModelAttribute("member_list") datadto datadto) {
		
		List<datadto> list = null;
		try {
			SqlSession se = sqlsessionfactory.openSession();
			//System.out.println(se);
			int a = se.update("adminDB.member_use",datadto);
			list = se.selectList("adminDB.selectall",datadto);
			
			String ct = se.selectOne("adminDB.allcount7");
			req.setAttribute("datalist", list);
			req.setAttribute("ct", ct);
			//System.out.println(a);
			se.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return "admin/admin_main";
		
	}

	/*
	 회원가입 시 회원가입 버튼 누르면 datadto setter를 통해 데이터 삽입!
	 지금은 중복체크를 ajax 통해서 했기 때문에 else,catch 부분은 없어도 됨! 
	 */
	@PostMapping("joinok.do")
	public String join_insert(HttpServletResponse res, @ModelAttribute("member") datadto datadto) {
		res.setContentType("text/html; charset=utf-8;");
		PrintWriter pw = null;
		int ok = 0;
		try {
			pw = res.getWriter();
			SqlSession se = sqlsessionfactory.openSession();
			ok = se.insert("adminDB.member_insert",datadto);
			if(ok>0) {
				pw.write("<script>"
						+ "alert('정상적으로 회원가입이 완료되었습니다.');"
						+ "location.href='./index.do';"
						+ "</script>");
				
			}
			else {
				pw.write("<script>"
						+ "alert('아이디 중복입니다');"
						+ "history.go(-1);"
						+ "</script>");
			}
			pw.close();
			se.close();
		}
		catch(Exception e) {
			System.out.println(e);
			pw.write("<script>"
					+ "alert('아이디 중복입니다');"
					+ "history.go(-1);"
					+ "</script>");
		}

		return null;
	}
	
	
	
	/*메일 보안 코드 전송 파트*/
	@PostMapping("/popup_email.do")
	public String mail(HttpServletResponse res, HttpServletRequest req, Model m) {
		res.setContentType("text/html; charset=utf-8;");
		/* 프론트쪽 난수 생성 값을 받아옴 */
		String code = req.getParameter("code2");
		System.out.println(code);
		
		String mname = req.getParameter("mname");
		String memail = req.getParameter("memail");		
		
		/* 실제 메일 API 서버 정보! */
		/* 실제로는 사용자 입력값을 받아서 변수에 삽입하면 된다 */
		String host = "smtp.naver.com";
		String user = "hankjun3333@naver.com";
		String password = "qkrqudwns12@";
		String to_mail = memail;
		
		/*API 포트 번호 및 TLS 정보를 셋팅!*/
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.port", 587);
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		 
		//SMTP 서버에 로그인을 시키기 위한 작업! (암호화해야함)
		Session session = Session.getDefaultInstance(props,new javax.mail.Authenticator() {
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(user, password);
				
			}
		});
		PrintWriter pw = null;
		
		try {
			pw = res.getWriter();
			/*MimeMessage : okcall 발생하고 id랑 pw , 포트가 모두 맞을경우 okcall sign 뜸*/
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(user,mname));//사용자명(보낸이)
			//받는메일주소!
			msg.addRecipient(Message.RecipientType.TO,new InternetAddress(to_mail)); //회신메일
			msg.setSubject("회원님의 보안 코드 입니다!"); //제목

			
			msg.setText("보안코드는 "+ code +" 입니다"); //내용
			m.addAttribute("scode", code);
			req.setAttribute("scode2", code);			
			//System.out.println(sc2);
			Transport.send(msg); // 발송!
			pw.write("<script>"
					+ "alert('보안코드가 메일로 발송 되었음');"
					+ "history.go(-1);"
					+ "</script>");

		}
		catch(Exception e) {
			System.out.println(e);
			pw.write("<script>"
					+ "alert('메일 주소가 올바르지 않습니다');"
					+ "history.go(-1);"
					+ "</script>");
		}
		
		pw.close();
		return null;
	}
	
	/*회원가입 후 로그인 할때 로직*/
	@Resource(name="loginck")
	private login_module lm;
	
	@PostMapping("/loginok.do")
	public String loginok(HttpServletRequest req,HttpServletResponse res,
			@ModelAttribute("login") datadto datadto,
			@RequestParam String mid
			
			) throws Exception{
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8;");
		this.pw = res.getWriter();
		/*로그인 할때 해당 정보를 db와 비교시 
		 selectOne을 하게되면 데이터 비교 시 값이 없으면 null이 뜸 있으면 무슨값이뜸*/
		datadto dto = this.lm.login_select(datadto);
		String use = this.lm.login_use(mid);
		if(use.intern() == "N") {
			this.pw.write("<script>"
					+ "alert('해당 계정은 사용 정지되었습니다. 관리자에게 문의바랍니다.');"
					+ "history.go(-1);"
					+ "</script>");
		}
		else {
			if(dto ==null) { 
				this.pw.write("<script>"
						+ "alert('계정이 틀립니다.');"
						+ "history.go(-1);"
						+ "</script>");
			}
			else {
				this.session = req.getSession();
				this.session.setAttribute("mid", mid);
				this.pw.write("<script>"
						+ "alert('로그인 되셨습니다.');"
						+ "location.href='./index.do';"
						+ "</script>");
			}
		}
		return null;
	}
	
	/*회원가입 아이디 중복체크 ajax를 통해서 joinid.do 컨트롤러로 받음!!*/
	@PostMapping("/joinid.do")
	public String joinid(Model m, @RequestParam(required=false) String userid) {
		datadto dto = this.lm.login_ck(userid);
		//System.out.println(dto);
			try {
			if(dto==null) {
				m.addAttribute("userid","yes");
			}
			else {
				m.addAttribute("userid","no");
			}
		}
		catch(Exception e) {
			System.out.println(e);
			m.addAttribute("userid","err");
			
		}
		return "./idcheck";
	}
	
	/*사이트 정보 파트
	 1.해당 페이지로 왔을때 데이터 기존 저장된 것이 먼저 출력이 되어야 하므로 .do로 출력!
	 2.그리고 데이터 저장시 ok.do로 가서 처리 후 다시 do로 반환하는 로직으로 구성 
	 */
	@Resource(name="config")
	private config_module cm;
	
	/*config 파트 우선 셀렉트!*/
	@RequestMapping("admin/admin_config.do")
	public String admin_list(Model m,HttpServletResponse res) throws Exception{
		List<configdto> sitelist = this.cm.all_list();

			m.addAttribute("sitelist",sitelist);

		return "/admin/admin_config";
	}
	
	@PostMapping("/admin/admin_configok.do")
	public String admin_insert(HttpServletResponse res,@ModelAttribute("site") configdto configdto) {
		res.setContentType("text/html;charset=utf-8;");
		res.setCharacterEncoding("utf-8");
		try {
			this.pw = res.getWriter();
			int result = this.cm.site_insert(configdto);
			if(result >0) {
				this.pw.write("<script>"
						+ "alert('정보가 올바르게 수정되었습니다.');"
						+ "location.href='./admin_config.do';"
						+ "</script>");
			}
			else {
				this.pw.write("<script>"
						+ "alert('정보가 수정되지 않았습니다.!');"
						+ "history.go(-1);"
						+ "</script>");
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		this.pw.close();
		return null;
	}
	/* 메인 페이지 상품,footer 사이트 정보 출력하는 파트임
	 데이터 출력하는 부분이니까 당연히 .do로 실행되도록 해야함 
	 */
	@RequestMapping("/index.do")
	public String site_info(Model m) {
		// product 정보 출력!
		List<productdto> product = this.pm.product_lists();
		m.addAttribute("product",product);
		
		// site 정보 출력!
		List<configdto> site = this.cm.all_list();
		m.addAttribute("site",site);
		return "./index";
	}
	
	/*상품 쓰기 및 출력 컨트롤러
	 form 내부 나머지 데이터들은 productdto setter를 통해 데이터 삽입하도록 하고
	 img 파일은 pimg1을 통해 MultipartFile로 받게끔 하고 나서
	 filename,realPath,url 설정 후 실제 경로에 복사도 하게끔 하는 부분 
	 */
	private String host;
	private String user;
	private String pass;
	private int port;
	
	@RequestMapping("admin/p_insert.do")
	public String p_insert(@ModelAttribute productdto productdto,
			MultipartFile pimg1,
			HttpServletRequest req,
			HttpServletResponse res
			) throws Exception {
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();
		String filename = pimg1.getOriginalFilename();
		System.out.println(filename);
		long maxfilesize = 2 * 1024 * 1024;
		long filesize = pimg1.getSize();
		if(filesize>maxfilesize) {
			pw.write("<script>"
					+ "alert('파일의 사이즈가 너무 큽니다 2MB이하로 업로드해주세요');"
					+ "history.go(-1);"
					+ "</script>");
		}
		else {
			
			FTPClient ftp = new FTPClient();
			ftp.setControlEncoding("utf-8");	// 한글 깨짐 방지.
			FTPClientConfig cf = new FTPClientConfig();
			try {
				
				this.host ="iup.cdn1.cafe24.com";
				this.user = "hankjun333";
				this.pass = "Qkrqudwns12@";
				this.port = 21;
				ftp.configure(cf);	
				ftp.connect(this.host,this.port);	
				if(ftp.login(this.user, this.pass)) {	
					ftp.setFileType(FTP.BINARY_FILE_TYPE);	
					int rp = ftp.getReplyCode();	
					//ftp.makeDirectory("team");	// 디렉토리 생성.
					
					/* ftp 파일 업로드 코드 (storeFile) PART */
					boolean result = ftp.storeFile("/www/team/"+filename, pimg1.getInputStream());
					//System.out.println(result);
					//ftp.removeDirectory("files2"); 
					if(result) {
						// 이경로로 DB에 저장.
						String url = "http://hankjun333.cdn1.cafe24.com/team/"+filename;
						productdto.setPimg(url);
						int oksign = this.pm.product_data(productdto);
						if(oksign>0) {
							pw.write("<script>"
									+ "alert('정상적으로 저장되었습니다.');"
									+ "location.href='./admin_product.do';"
									+ "</script>");
						}
						else {
							System.out.println("저장 오류");
						}
						//m.addAttribute("imgsrc",url);
						System.out.println("정상적으로 업로드 되었습니다.");
						
						/* 삭제 (deleteFile)*/
						//boolean delok = ftp.deleteFile("/www/img/SKU-02-Matte Black.jpg");
						//System.out.println(delok);
						
					}

				}
				else{
					System.out.println("FTP 정보가 올바르지 않습니다.");
				}
				ftp.logout();
				ftp.disconnect();	// ftp 접속종료.
			}
			
			catch(Exception e) {
				System.out.println("FTP 접속 정보 오류 및 접속 사용자 ");
				e.printStackTrace();
			}
			finally {
				try {
					ftp.disconnect();
				}
				catch(Exception e) {
					System.out.println("접속종료 중 오류발생");
				}
			}
		}
		
		return null;
	}
	/*상품 쓰기 끝*/
	@Resource(name="product")
	private product_module pdm;
	
	/*상품 리스트 출력하는부분 -시작*/
	@RequestMapping("admin/admin_product.do")
	public String review_list(
			@RequestParam(required = false)String search,
			@RequestParam(required = false)String page,
			@RequestParam(required = false)String part,
			Model m,
			HttpServletRequest req,
			HttpServletResponse res) {
		int vpage = 0;
		if(page==null || page=="" || Integer.parseInt(page)<=1) {
			vpage = 0;
		}
		else {
			vpage = Integer.parseInt(page)*5 - 5;
		} 
		List<productdto> lists = null;
		String ct = null;
		if(search == null || search == "") {
			lists = this.pdm.product_lists(vpage);
			ct = this.pdm.product_count();
		}
		else {
			lists = this.pdm.product_lists(vpage,search,part);
			ct = this.pdm.product_count(search,part);
		}
		
		m.addAttribute("lists",lists);
		m.addAttribute("ct",ct);
		
		return "/admin/admin_product";
	}
	
	
	/*상품 리스트 출력하는부분 -끝*/
	
	
	/*상품 삭제하는 곳!! -- 시작*/
	@RequestMapping("admin/deleteok")
	public String review_del(HttpServletResponse res,
			@RequestBody List<Integer> pidx
			) throws Exception{
		res.setContentType("text/html; charset=utf-8");
		PrintWriter pw = res.getWriter();
		int result = this.pdm.product_delete(pidx);
		if(result>0) {
			pw.write("ok");
		}
		else {
			pw.write("no");
		}
		pw.close();
		
		
		return null;
	}
		
	/*상품 삭제하는 곳!! -- 끝*/
	
	@Resource(name = "product")
	private product_module pm;
	
	@PostMapping("/admin/codeck.do")
	public String codeck(Model m,HttpServletResponse res,@RequestParam String pid) {
			
		
		try {
			String codeck = this.pm.product_codeck(pid);
			if(codeck == null || codeck =="") {
				m.addAttribute("codeck","no"); //사용가능
			}
			else {
				m.addAttribute("codeck","yes"); // 값이 존재함 사용불가
			}
		}
		catch(Exception e) {
			System.out.println(e);
			m.addAttribute("codeck","err"); // 에러임
		}
		
		
		return "/admin/codeckok";
	}
	
	
	
}