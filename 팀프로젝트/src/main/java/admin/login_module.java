package admin;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("loginck")
public class login_module {

	@Resource(name="sqlsession")
	private SqlSessionTemplate tm;
	
	public datadto login_select(datadto datadto) {
		datadto dto = this.tm.selectOne("adminDB.login_select",datadto);
		//System.out.println(dto.getMid());
		
		return dto;
	}
	
	public datadto login_ck(String userid) {
		datadto dto = this.tm.selectOne("adminDB.id_ck",userid);
		return dto;
	}
	
	public String login_use(String mid) {
		String use = this.tm.selectOne("adminDB.login_use",mid);
		
		return use;
	}
	
}
