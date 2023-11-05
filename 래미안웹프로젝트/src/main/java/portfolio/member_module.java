package portfolio;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return idck;
	}
	
	public int member_join(memberdto memberdto) {
		int result = this.tm.insert("memberDB.member_insert",memberdto);
		return result;
	}
	
	public memberdto member_login(memberdto memberdto) {
		this.dto  = this.tm.selectOne("memberDB.member_login",memberdto);
		return this.dto;
	}
	//실패시 카운트 차감하는 곳
	public int login_count(String mid) {
		int ct = this.tm.update("memberDB.login_count",mid);
		return ct;
	}
	//성공시 카운트 초기화 시켜주는 곳
	public int login_reset(String mid) {
		int ct = this.tm.update("memberDB.login_reset",mid);
		return ct;
	}
	//해당 사용자 mcount 갯수 조회!
	public String mcount(String mid) {
		String mcount = this.tm.selectOne("memberDB.mcount",mid);
		return mcount;
	}
	//muse -> no로 변경
	public int use_no(String mid) {
		int no = this.tm.update("memberDB.use_no",mid);
		return no;
	}
	//해당 사용자가 muse 값이 N인지 Y인지 조회
	public String musevalue(String mid) {
		String usevalue = this.tm.selectOne("memberDB.muse_value",mid);
		return usevalue;
	}
	//가입자들 리스트 전체 출력!
	public List<memberdto> memberlist(){
		List<memberdto> lists = this.tm.selectList("memberDB.member_alllist");
		return lists;
	}
	//10명씩 출력!
	public List<memberdto> memberlist(int page){
		List<memberdto> lists = this.tm.selectList("memberDB.member_lists",page);
		return lists;
	}
	public List<memberdto> memberlist(Map<String, Object> mb){
		List<memberdto> lists2 = this.tm.selectList("memberDB.member_area_search",mb);
		return lists2;
	}	
	public List<memberdto> memberlist_part(String search_part ,String usertext,int vpage){
		Map<String, Object> lists = new HashMap<String, Object>();
		lists.put("search_part", search_part);
		lists.put("usertext", usertext);
		lists.put("vpage", vpage);
		List<memberdto> lists2 = this.tm.selectList("memberDB.member_search_part",lists);
		return lists2;
	}	
	

	public String totalcount() {
		String total = this.tm.selectOne("memberDB.member_allcount");
		return total;
	}
	public String totalcount2(Map<String, Object> mb) {
		String total = this.tm.selectOne("memberDB.member_allcount2",mb);
		return total;
	}	
	public String totalcount3(String search_part,String usertext) {
		Map<String, Object> mb = new HashMap<String, Object>();
		mb.put("search_part", search_part);
		mb.put("usertext", usertext);
		String total = this.tm.selectOne("memberDB.member_allcount3",mb);
		return total;
	}		
	
	
	public int useok(Map<String, Object> mb) {
		int result = this.tm.update("memberDB.muse_ok",mb);
		return result;
	}
	public List<memberdto> member_area_search(String area){
		List<memberdto> lists = this.tm.selectList("memberDB.member_area_search",area);
		return lists;
	}
	
}
