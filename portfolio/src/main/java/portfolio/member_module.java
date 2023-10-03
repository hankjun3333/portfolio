package portfolio;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("member")
public class member_module {

	private memberdto dto;
	
	@Resource(name="sqlsession")
	private SqlSessionTemplate tm;
	
	public String id_check(String mid) {
		String idck = this.tm.selectOne("memberDB.id_ck",mid);
		System.out.println(idck);
		return idck;
	}
	
	public int member_join(memberdto memberdto) {
		int result = this.tm.insert("memberDB.member_insert",memberdto);
		//System.out.println(result);
		return result;
	}
	
	public memberdto member_login(memberdto memberdto) {
		this.dto  = this.tm.selectOne("memberDB.member_login",memberdto);
		//System.out.println(this.dto);
		return this.dto;
	}
	//실패시 카운트 차감하는 곳
	public int login_count(String mid) {
		int ct = this.tm.update("memberDB.login_count",mid);
		//System.out.println(ct);
		return ct;
	}
	//성공시 카운트 초기화 시켜주는 곳
	public int login_reset(String mid) {
		int ct = this.tm.update("memberDB.login_reset",mid);
		return ct;
	}
	public String mcount(String mid) {
		String mcount = this.tm.selectOne("memberDB.mcount",mid);
		//System.out.println(mcount);
		return mcount;
	}
	//muse -> no로 변경
	public int use_no(String mid) {
		int no = this.tm.update("memberDB.use_no",mid);
		return no;
	}
	public String musevalue(String mid) {
		String usevalue = this.tm.selectOne("memberDB.muse_value",mid);
		System.out.println(usevalue);
		return usevalue;
	}
	
			
}
