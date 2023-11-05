package app;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;
//mybatis + mvc 합쳐서 씀
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class web {
	
	@Inject SqlSessionFactory sqlsessionfactory;

	
	@RequestMapping("/test.do")
	public String test(Model m) {
	//모듈 클래스에 @Inject 값을 이관시킴!!!!!!
		site_module sm = new site_module(sqlsessionfactory);
		site_dto dto =  sm.check(); //return 된 값을 dto로 받아서 처리  
		
		m.addAttribute("dto",dto); //view 로 전달!
		
		return "/app/test";
	}
	
	/*컨트롤러 에서의 Resource는 모듈 @Repository를 말함*/
	/*
	@Resource(name="data1") //모듈 클래스 싹다 들고온다는 것
	private site_module2 sm; //클래스 로드한거임 이게
	
	@RequestMapping("/test.do") //Resource 방식임!
	public String test(Model m) {
		site_dto dto =this.sm.select();
		m.addAttribute("dto",dto);
		return "app/test";
	}*/
	
	@Resource(name="address")
	private address_module ad;
	
	@PostMapping("/addressok.do")
	public String addressok(@ModelAttribute("address") address_dto address_dto) {
		
		int result =this.ad.address_insert(address_dto);
		//System.out.println(result);
		return null;
	}

	@RequestMapping("/home.do")
	public String home(Model m) {
		//System.out.println("test");
		home_module hm = new home_module(sqlsessionfactory);
		List<home_dto> dto = hm.home_select();
		
		m.addAttribute("dto2",dto);
		return "/app/home";
	}
	
	PrintWriter pw = null;
	@PostMapping("/homeok.do")
	public String home_select(HttpServletResponse res, @ModelAttribute("home") home_dto home_dto) throws IOException {
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8;");
		this.pw = res.getWriter();
		
		home_module hm = new home_module(sqlsessionfactory);
		int a = hm.home_insert(home_dto);
		if(a>0) {
			this.pw.write("<script>"
					+ "alert('정보가 잘 저장되었음');"
					+ "location.href='./home.do';"
					+ "</script>");
		}
		else {
			System.out.println("데이터 입력안됨!!!!!");
		}
		return null;
	}
	
	
}
