package portfolio;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPClientConfig;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
@Controller
public class webpage {

	PrintWriter pw = null;
	@Resource(name="member")
	private member_module mm;
	
	private memberdto dto;
	
	/*아이디중복체크 - ajax통신*/
	@PostMapping("/admin/idck.do")
	public String idck(Model m,@RequestParam String mid) {
		String userid = this.mm.id_check(mid);
		if(userid == null) {
			m.addAttribute("userid","no"); //아이디 사용가능
		}
		else {
			m.addAttribute("userid","yes"); //아이디존재
		}
		return "/admin/idck"; //ajax - response
	}
	/* 회원가입 시 db 저장파트 */
	@PostMapping("/admin/adminok.do")
	public String member_join(
			@ModelAttribute("member") memberdto memberdto,
			@RequestParam String mtel1,
			@RequestParam String mtel2,
			@RequestParam String mtel3,
			HttpServletResponse res
			) {
		res.setContentType("text/html; charset=utf-8");
		String mtel = mtel1+mtel2+mtel3;
		memberdto.setMtel(mtel);
		int result = this.mm.member_join(memberdto);
		
		try {
			this.pw = res.getWriter();
			if(result>0) {
				this.pw.write("<script>"
						+ "alert('회원가입이 정상적으로 되었습니다.');"
						+ "location.href='./index.jsp';"
						+ "</script>");
			}
			else {
				pw.write("<script>"
						+ "alert('계정이 틀립니다.');"
						+ "history.go(-1);"
						+ "</script>");
			}
		}
		catch(Exception e) {
			System.out.println(e);
			System.out.println("여기도 어딘가 문제있겠지");
		}
		
		return null;
	}
	@PostMapping("/admin/loginok.do")
	public String loginok(HttpServletRequest req,HttpServletResponse res,@RequestParam String mid,@ModelAttribute("member") memberdto memberdto) {
		
		PrintWriter pw = null;
		res.setContentType("text/html;charset=utf-8");
		String musevalue = this.mm.musevalue(mid).intern();
		//해당 사용자 접속전 muse N이면 접근차단!
		try {
			this.pw = res.getWriter();
			if(musevalue == "N") {
				this.pw.write("<script>"
						+ "alert('해당 사용자는 접근차단되었습니다 관리자에게 문의바랍니다.');"
						+ "history.go(-1);"
						+ "</script>");
			}
			else {
				this.dto = this.mm.member_login(memberdto);
				if(this.dto == null) {
					//로그인 정보가 틀렸다는 곳
					int countck = this.mm.login_count(mid);
					//해당 사용자 로그인 갯수 세기
					String countnum = this.mm.mcount(mid);
					//mcount 값이 0보다 작거나 같으면 해당 사용자 muse 칼럼 N로 변경
					if(Integer.parseInt(countnum) <=0) {
						int use = this.mm.use_no(mid);
					}
				}
				else { //성공시 카운트 리셋해주는 곳
					int count_reset = this.mm.login_reset(mid);
					HttpSession hs = req.getSession();
					hs.setAttribute("mid", mid);
					this.pw.write("<script>"
							+ "alert('정상적으로 로그인 되었습니다.');"
							+ "location.href='./admin_main.do';"
							+ "</script>");
				}
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	@RequestMapping("/admin/admin_main.do")
	public String ad_main(Model m) {
		List<reservedto> reserve_lists = this.rm.admain_reserve_list();
		m.addAttribute("lists",reserve_lists);
		List<userdto> user_lists = this.um.all_user_list();
		m.addAttribute("user_lists",user_lists);
		return "/admin/admin_main";
	}
	
	//config_main.do 관리자 리스트 출력 페이지
	@RequestMapping("admin/config_main.do")
	public String config_main(Model m,
			@RequestParam(required=false) String page,
			@RequestParam(required=false) String area,
			@RequestParam(required=false) String search_part,
			@RequestParam(required=false) String usertext
			) {
				//System.out.println(search_part);
				//System.out.println(usertext);
		int vpage = 0;
		if(page==null || page == "null" || Integer.parseInt(page)<=1 || page == "") {
			vpage =0;
		}
		else {
			vpage = (Integer.parseInt(page)*10) -10;
		}

		Map<String, Object> listmap =new HashMap<String, Object>();
		listmap.put("vpage", vpage);
		listmap.put("area", area);
		
	//소속이 없는경우
		if(area == null || area.equals("null") || area.equals("all")) {
			if(search_part == null || search_part.equals("") || search_part.equals("null")) {
				List<memberdto> lists = this.mm.memberlist(vpage);
				String count = this.mm.totalcount();
				m.addAttribute("lists",lists);
				m.addAttribute("totalcount",count);
			}
			else { //이부분다시해보자!
				List<memberdto> partlists = this.mm.memberlist_part(search_part,usertext,vpage);
				String count3 = this.mm.totalcount3(search_part,usertext);
				m.addAttribute("lists",partlists);
				m.addAttribute("totalcount",count3);
			}
		}
		else{ //소속을 선택한 경우
			List<memberdto> lists2 = this.mm.memberlist(listmap);
			String count2 = this.mm.totalcount2(listmap);
			m.addAttribute("lists",lists2);
			m.addAttribute("totalcount",count2);
			//System.out.println(lists2);
		}
		
		 //lists /lists2 카운트 다르게잡아야됨
		return "/admin/config_main";
	}
	
	@GetMapping("/admin/useok")
	@ResponseBody //일반 텍스트로 반환해줌!
	public String useok(@RequestParam("muse") String muse,@RequestParam("midx") String midx) {
		Map<String, Object> useck = new HashMap<String, Object>();
		useck.put("midx", midx);
		useck.put("muse", muse);
		int result = this.mm.useok(useck);
		return muse;
	}
	//notice 게시판 출력 부분
	@Resource(name="notice")
	private notice_module nm; 

	private String host;
	private String user;
	private String pass;
	private int port;
	@PostMapping("/admin/notice_writeok.do")
	public String notice_write(HttpServletResponse res,
			noticedto noticedto,
			MultipartFile nfile2,
			Model m,
			HttpServletRequest req
			
			) throws Exception{
		
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();
		String filename = nfile2.getOriginalFilename();
		long maxfilesize = 2 * 1024 * 1024;
		long filesize = nfile2.getSize();
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
					//ftp.makeDirectory("files");	// 디렉토리 생성.
					
					/* ftp 파일 업로드 코드 (storeFile) PART */
					boolean result = ftp.storeFile("/www/files/"+filename, nfile2.getInputStream());
					//System.out.println(result);
					//ftp.removeDirectory("files2"); 
					if(result) {
						// 이경로로 DB에 저장.
						String url = "http://hankjun333.cafe24.com/www/files/"+filename;
						noticedto.setNfile(url);
						int oksign = this.nm.noticeok(noticedto);
						if(oksign>0) {
							pw.write("<script>"
									+ "alert('정상적으로 저장되었습니다.');"
									+ "location.href='./notice_main.do';"
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
					else {
						int oksign = this.nm.noticeok(noticedto);
						System.out.println(oksign);
						pw.write("<script>"
								+ "alert('정상적으로 저장되었습니다.');"
								+ "location.href='./notice_main.do';"
								+ "</script>");
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
	//클릭시 파일 다운로드 하는 곳!
	@RequestMapping("/admin/notice_load")
	public String notice_load(@RequestParam String nidx,HttpServletResponse res,HttpServletRequest req) {
		//System.out.println(nidx);
		//dbfilename 은 웹경로 까지 포함되어있음
		
		String dbfilename = this.nm.filename(nidx);
		System.out.println(dbfilename);
		
		String parts[] = dbfilename.split("/");
		String rename = parts[parts.length-1];
		String ftppath = "/www/files/"+rename;
		System.out.println(req.getServletContext().getRealPath(rename));
		FTPClient ftp = new FTPClient();
		ftp.setControlEncoding("utf-8");	// 한글 깨짐 방지.
		FTPClientConfig cf = new FTPClientConfig();
		//System.out.println(req.getServletContext().getRealPath(dbfilename));
			try {
				this.host ="iup.cdn1.cafe24.com";
				this.user = "hankjun333";
				this.pass = "Qkrqudwns12@";
				this.port = 21;
				ftp.configure(cf);
				ftp.connect(this.host,this.port);
				ftp.login(this.user, this.pass);
				ftp.setFileType(FTP.BINARY_FILE_TYPE);
				ftp.enterLocalPassiveMode();
				res.setContentType("application/octet-stream");
	            res.setHeader("Content-Disposition", "attachment; filename=" + rename);

	            boolean success = false;
	            //PrintWriter pw = res.getWriter();
	            try (OutputStream os = res.getOutputStream()) {
	            	success = ftp.retrieveFile(ftppath, os);
	            	os.close();
	            }
	            System.out.println(success);          
	            
			}	
			catch(Exception e) {
				System.out.println(e);
			}
			finally {
				try {
					if(ftp.isConnected()) {
						ftp.logout();
						ftp.disconnect();
					}
					
				}
				catch(Exception e) {
					System.out.println(e);
					
				}
			}
		return "/admin/notice_write";
	}
	
	
	@RequestMapping("admin/notice_main.do")
	public String notice_main(Model m,
			@RequestParam(required=false) String ntitle,
			@RequestParam(required=false) String page
			) {
		//System.out.println(vpage);
		//System.out.println(ntitle);
		List<noticedto> lists = null;
		String notice_cnt = null;
		int vpage = 0;
		if(page == null || page=="" || Integer.parseInt(page)<=1) {
			vpage = 0;
		}
		else {
			vpage = (Integer.parseInt(page)*10)-10;
		}
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("ntitle", ntitle);
		param.put("vpage", vpage);
		
		if(ntitle == null || ntitle == "") {
			lists = this.nm.notice_lists(vpage);
			notice_cnt = this.nm.notice_cnt();				
		}
		else {
			lists = this.nm.notice_list_map(param);
			notice_cnt = this.nm.notice_cnt_map(param);
		}
		
		m.addAttribute("cnt",notice_cnt);
		m.addAttribute("lists",lists);
		return "/admin/notice_main";
	}
	
	@GetMapping("/admin/notice_view.do")
	public String notice_view(Model m,@RequestParam(required=false) String nidx) {
		//System.out.println(nidx);
		List<noticedto> lists = this.nm.notice_view(nidx);
		int result = this.nm.view_count(nidx);
		System.out.println(result);
		m.addAttribute("lists",lists);
		return "/admin/notice_view";
	}
	
	@GetMapping("/admin/notice_delok.do")
	public void notice_delete(HttpServletResponse res,@RequestParam(required=false) String nidx) throws Exception{
		//System.out.println(nidx);
		res.setContentType("text/html; charset=utf-8");
		pw = res.getWriter();
		
		int result = this.nm.notice_delete(nidx);
		if(result>0) {
			pw.write("<script>"
					+ "alert('정상적으로 삭제되었음');"
					+ "location.href='./notice_main.do';"
					+ "</script>");
		}
		else {
			System.out.println("sql 오류");
		}

	}
	@Resource(name="faq")
	private faq_module fm;
	@RequestMapping("admin/faq_main.do")
	public String faq_list(HttpServletResponse res,Model m,
			@RequestParam(required=false) String f_question,
			@RequestParam(required=false) String page
			) 
			throws Exception{
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();
		
		int vpage = 0;
		if(page==null || page == "null" || Integer.parseInt(page)<=1 || page == "") {
			vpage =0;
		}
		else {
			vpage = (Integer.parseInt(page)*10) -10;
		}
		
		List<faqdto> lists= null;
		String ct = null;
		
		if(f_question == null || f_question =="") {
			lists = this.fm.faq_lists(vpage);
			ct = this.fm.count();
		}
		else {
			lists = this.fm.faq_lists2(f_question,vpage);
			ct = this.fm.count(f_question); //여기가 null
		}
		m.addAttribute("lists",lists);
		m.addAttribute("ct",ct);
		return "/admin/faq_main";
	}
	
	
	@GetMapping("admin/faq_delete")
	public void faq_delete(HttpServletResponse res,@RequestParam String fidx) throws Exception{
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();
		int result = this.fm.faq_delete(fidx);
		if(result>0) {
			pw.write("<script>"
					+ "alert('정상적으로 삭제되었음');"
					+ "location.href='./faq_main.do';"
					+ "</script>");
		}
		else {
			pw.write("<script>"
					+ "alert('삭제오류');"
					+ "history.go(-1);"
					+ "</script>");
		}
	}
	
	@PostMapping("/admin/faq_write")
	public void faq_write(@RequestParam String f_question,
			@RequestParam String mid,
			@RequestParam String f_answer,
			HttpServletResponse res
			) throws Exception{
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();
		int result = this.fm.faq_write(f_question,mid,f_answer);
		if(result>0) {
			//System.out.println("정상저장됨");
			pw.write("<script>"
					+ "alert('정보가 정상저장됨');"
					+ "location.href='./faq_main.do';"
					+ "</script>");
		}
		else {
			//System.out.println("비정상저장됨");
			pw.write("<script>"
					+ "alert('정보가 정상저장됨');"
					+ "history.go(-1);"
					+ "</script>");
		}
		
		
	}
	@Resource(name="config")
	private config_module cm;
	
	@RequestMapping("admin/info_main.do")
	public String info_main(HttpServletResponse res,
			Model m,
			@RequestParam(required=false) String search,
			@RequestParam(required=false) String page
			) {
		System.out.println(search);
		System.out.println(page);
		res.setContentType("text/html;charset=utf-8");
		List<configdto> lists = null;
		int vpage = 0;
		int cnt = 0;
		if(page==null || page=="" || Integer.parseInt(page)<=1) {
			vpage =0;
		}
		else {
			vpage = (Integer.parseInt(page)*4)-4;
		}
		
		if(search == null || search =="" || search == "null") {
			lists = this.cm.config_list(vpage);
			cnt = this.cm.config_list_count();
		}
		else {
			lists = this.cm.config_list(search,vpage);
			cnt = this.cm.config_list_count(search);
			
		}
		m.addAttribute("lists",lists);
		m.addAttribute("cnt",cnt);
		
		return "/admin/info_main";
	}
	
	@PostMapping("/admin/writeok.do")
	public void writeok(
			HttpServletResponse res,
			@ModelAttribute("config") configdto configdto
			)throws Exception {
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();
		int result = this.cm.info_write(configdto);
		if(result>0) {
			pw.write("<script>"
					+ "alert('정상저장되었음');"
					+ "location.href='./info_main.do';"
					+ "</script>");
		}
		else {
			pw.write("<script>"
					+ "alert('저장이 안됨');"
					+ "history.go(-1);"
					+ "</script>");
		}
	}

	@RequestMapping("/admin/delete")
	public void config_delete(HttpServletResponse res,@RequestParam String cidx) throws Exception{
		res.setContentType("text/html;charset=utf-8;");
		PrintWriter pw =res.getWriter();
		int result = this.cm.config_delete(cidx);
		if(result>0) {
			pw.write("<script>"
					+ "alert('정상적으로 삭제되었습니다.');"
					+ "location.href='./info_main.do';"
					+ "</script>");
		}
		else {
			pw.write("<script>"
					+ "alert('삭제 오류');"
					+ "history.go(-1);"
					+ "</script>");
		}
	}
	
	@RequestMapping("admin/member_main.do")
	public String member_main(Model m,
			@RequestParam(required=false) String part,
			@RequestParam(required=false) String data,
			@RequestParam(required=false) String page
			) {
		int vpage=0;
		if(page==null||page==""||Integer.parseInt(page)<=1) {
			vpage=0;
		}
		else {
			vpage= (Integer.parseInt(page)*20) -20;
		}
		System.out.println(data);
		System.out.println(part);
		List<userdto> lists = this.um.user_list(part,data,vpage);
		String count = this.um.user_count(part,data);
		System.out.println(count);
		m.addAttribute("lists",lists);
		m.addAttribute("count",count);
		m.addAttribute("part",part);
		return "/admin/member_main";
	}
	/*여기는 아마 main에 인자값을 같이 태워줘야 할것같다!-- 고민좀해보자!!*/
	@GetMapping("admin/user_delete")
	public String user_delete(@RequestParam(required=false) String uidx,
			HttpServletResponse res
			) throws Exception{
		System.out.println(uidx);
		res.setContentType("text/html; charset=utf-8");
		PrintWriter pw = res.getWriter();
		int result = this.um.user_dont(uidx);
		System.out.println("---");
		System.out.println(result);
		System.out.println("---");
		if(result>0) {
			pw.write("<script>"
					+ "alert('해당 회원은 로그인 정지 처리 되었습니다.');"
					+ "location.href='./member_main.do';"
					+ "</script>");
		}
		return null;
	}
	@RequestMapping("admin/reserve_main.do")
	public String reserve_main(Model m,
			@RequestParam(required=false) String part,
			@RequestParam(required=false) String data,
			@RequestParam(required=false) String page) {
		//System.out.println("test");
		int vpage=0;
		if(page==null||page==""||Integer.parseInt(page)<=1) {
			vpage=0;
		}
		else {
			vpage= (Integer.parseInt(page)*20) -20;
		}
		
		List<reservedto> lists = this.rm.reserve_list(part,data,vpage);
		String count = this.rm.reserve_count(part,data);
		System.out.println(count);
		m.addAttribute("lists",lists);
		m.addAttribute("count",count);
		m.addAttribute("part",part);
		
		return "/admin/reserve_main";
	}

	
	/*여기서 부터 메인페이지*/
	
	
	@RequestMapping("/index.do")
	public String main_index(Model m) {
		List<configdto> lists = this.cm.config_display();
		m.addAttribute("lists",lists);
		return "/index";
	}
	
	@Resource(name="user")
	private user_module um;
	
	//private userdto userdto;
	
	@PostMapping("/join_memberok.do")
	public String join_memberok(@ModelAttribute("userdto") userdto userdto,
			HttpServletResponse res
			) throws Exception{
		res.setContentType("text/html;charset=utf-8");
		
		if(userdto.getMarket_email() == null || userdto.getMarket_email()=="") {
			userdto.setMarket_email("N");
		}
		if(userdto.getMarket_tel() == null || userdto.getMarket_tel()=="") {
			userdto.setMarket_tel("N");
		}
		if(userdto.getMarket_post() == null || userdto.getMarket_post() =="") {
			userdto.setMarket_post("N");
		}
		if(userdto.getMarket_sms() == null || userdto.getMarket_sms() =="") {
			userdto.setMarket_sms("N");
		}
		
		System.out.println("---------------");
		System.out.println(userdto.getMarket_email());
		System.out.println(userdto.getMarket_tel());
		
		int result = this.um.join_user(userdto);
		PrintWriter pw = res.getWriter();
		if(result>0) {
			pw.write("<script>"
					+ "alert('정상적으로 회원 가입이 완료되었습니다.');"
					+ "location.href='login.do';"
					+ "</script>");
		}
		else {
			pw.write("<script>"
					+ "alert('비정상적인 접근입니다.');"
					+ "history.go(-1);"
					+ "</script>");
		}
		return null;
	}
	
	@RequestMapping("/login.do")
	public String login() {
		
		return "/login";
	}
	@PostMapping("/loginok.do")
	public String loginok(@RequestParam String uid,
			@RequestParam String upass,
			HttpServletResponse res,
			HttpSession session 
			) throws Exception{
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();
		String result = this.um.login_ok(uid, upass);
		if(result==null || result=="" || result=="null") {
			pw.write("<script>"
					+ "alert('올바른 정보를 확인해 주시길 바랍니다.');"
					+ "history.go(-1);"
					+ "</script>");
		}
		else {
			userdto dto = this.um.user_lists(uid,upass);
			session.setAttribute("userdto", dto);
			pw.write("<script>"
					+ "alert('정상적으로 로그인 되셨습니다.');"
					+ "location.href='./index.do';"
					+ "</script>");
		}
		return null;
	}
	
	
	@GetMapping("/idck")
	public String idck(@RequestParam String uid,Model m) {
		//System.out.println("test");
		//System.out.println(uid);
		String userid = this.um.useridck(uid);
		if(userid==null || userid=="") {
			m.addAttribute("userid","yes");
		}
		else {
			m.addAttribute("userid","no");
		}
		return "./idck";
	}
	@Resource(name="reserve")
	private reserve_module rm;
	
	@PostMapping("scode.do")
	public void sequrity_code(
			@RequestParam(required=false) String usertel,
			@RequestParam(required=false) String scode,
			HttpServletResponse res
			) {
		
		try {
			PrintWriter pw = res.getWriter();
			int result = this.rm.code_oksing(usertel, scode);
			if(result>0) {
				pw.write("ok");
			}
			else {
				pw.write("error");
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	
	
	
	@PostMapping("/reservationok.do")
	public void reservation(
			@ModelAttribute("reserve") reservedto reservedto,
			@RequestParam(required =false) String uid,
			HttpServletResponse res,
			HttpSession session
			) throws Exception{
		int ck = this.rm.user_ck(uid);
		res.setContentType("text/html;charset=utf-8");
		PrintWriter pw = res.getWriter();
		
		if(ck !=0) {
			pw.write("<script>"
					+ "alert('이미 예약이 등록 된 아이디 입니다. 메인페이지로 이동합니다.');"
					+ "location.href='./index.do';"
					+ "</script>");
		}
		else {
			int result = this.rm.reserve_ok(reservedto);
			if(result>0) {
				
				pw.write("<script>"
						+ "alert('정상적으로 저장 되었습니다. 메인페이지로 이동합니다.');"
						+ "location.href='./index.do';"
						+ "</script>");
			}
		}
		
	}
	
	@RequestMapping("reservation_in.do")
	public String reserve() {
		return "./reservation_in";
	}
	

	@RequestMapping("reservation_ck.do")
	public String reserve_ck(@RequestParam(required=false) String userid,
			Model m
			) {
		//System.out.println(userid);
		reservedto rdto = this.rm.reserve_ck(userid);
		System.out.println(rdto);
		m.addAttribute("rdto",rdto);
		return "./reservation_ck";
	}
	@PostMapping("reserve_ck")
	public void reserve_ck_ok(
			@ModelAttribute("reserve") reservedto reservedto,
			HttpServletResponse res
			) throws Exception{
		res.setContentType("text/html;charset=utf-8");
		int result = this.rm.reserve_update(reservedto);
		PrintWriter pw = res.getWriter();
		if(result>0) {
			int count = this.rm.reserve_count(reservedto);
			pw.write("<script>"
					+ "alert('정상 반영되었습니다. 메인 페이지로 이동합니다.');"
					+ "location.href='./index.do';"
					+ "</script>");
		}
		else {
			pw.write("<script>"
					+ "alert('수정오류');"
					+ "history.go(-1);"
					+ "</script>");
		}
		
	}
	@GetMapping("admin/reserve_delete")
	public String reserve_delete(@RequestParam(required=false) String ridx,
			HttpServletResponse res
			) throws Exception{
	
		res.setContentType("text/html; charset=utf-8");
		PrintWriter pw = res.getWriter();
		int result = this.rm.reserve_dont(ridx);
		System.out.println("---");
		System.out.println(result);
		System.out.println("---");
		if(result>0) {
			pw.write("<script>"
					+ "alert('해당 회원은 로그인 정지 처리 되었습니다.');"
					+ "location.href='./reserve_main.do';"
					+ "</script>");
		}
		return null;
	}
	@RequestMapping("reservation_cancel.do")
	public String reserve_cancel(@RequestParam(required=false) String userid,
			Model m) {
		//System.out.println(userid);
		reservedto rdto = this.rm.reserve_ck(userid);
		//System.out.println(rdto.getReserve_date());
		m.addAttribute("rdto",rdto);		
		return "./reservation_cancel";
	}
	/*밥먹고 취소하는 부분 해보자!!*/
	@GetMapping("client_reserve_cancelok.do")	
	public String client_cancel(@RequestParam(required=false) String userid,
			HttpServletResponse res
			) throws Exception{
		
		int result = this.rm.reserve_dont_id(userid);
		PrintWriter pw = res.getWriter();
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		if(result>0) {
			pw.write("<script>"
					+ "location.href='./index.do';"
					+ "</script>");
		}
		else {
			pw.write("<script>"
					+ "alert('삭제오류');"
					+ "history.go(-1)"
					+ "</script>");
		}
		return null;
	}
	
	
	
	
	@RequestMapping("client_notice.do")
	public String notice_main(
			@RequestParam(required=false) String ntitle,
			@RequestParam(required=false) String page,
			Model m 
			) {
		System.out.println(ntitle+page);
		int vpage = 0;
		if(page == null || page=="" || Integer.parseInt(page)<=1) {
			vpage = 0;
		}
		else {
			vpage = (Integer.parseInt(page)*10)-10;
		}
		List<noticedto> lists = this.nm.main_notice_lists(ntitle,vpage);
		String main_notice_cnt = this.nm.notice_cnt(ntitle);
		m.addAttribute("lists",lists);
		m.addAttribute("cnt",main_notice_cnt);
		return "./notice";
	}
	
	@RequestMapping("client_faq.do")
	public String client_faq(Model m) {
		List<faqdto> lists= null;
		String ct = null;
		lists = this.fm.faq_lists_client();
		//System.out.println(lists);
		m.addAttribute("lists",lists);
		return "./faq";
	}
	
	
	
	
	
	
	
	
	
	
	
}
