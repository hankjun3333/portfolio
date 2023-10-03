package portfolio;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		return "./idck"; //ajax - response
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
						+ "</script>");
			}
			else {
				System.out.println("어딘가 문제임");
			}
		}
		catch(Exception e) {
			System.out.println(e);
			System.out.println("여기도 어딘가 문제있겠지");
		}
		
		return null;
	}
	@PostMapping("/admin/loginok.do")
	public String loginok(HttpServletResponse res,@RequestParam String mid,@ModelAttribute("member") memberdto memberdto) {
		
		PrintWriter pw = null;
		res.setContentType("text/html;charset=utf-8");
		String musevalue = this.mm.musevalue(mid).intern();
		//해당 사용자 접속전 muse N이면 접근차단!
		if(musevalue == "N") {
			try {
				this.pw = res.getWriter();
				this.pw.write("<script>"
						+ "alert('해당 사용자는 로그인 실패 5회 이상으로 접근 차단입니다.');"
						+ "history.go(-1);"
						+ "</script>");
			}
			catch(Exception e) {
				System.out.println(e);
			}
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
			}
		}
		return null;
	}
}
