package portfolio;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("user")
public class user_module {

	
	
	@Resource(name="sqlsession")
	private SqlSessionTemplate tm;
	
	public int join_user(userdto userdto) {
		int result = this.tm.insert("memberDB.user_join",userdto);
		System.out.println(result);
		return result;
	}
	
	public String useridck(String uid) {
		String userid = this.tm.selectOne("memberDB.userid_ck",uid);
		//System.out.println(userid);
		return userid;
	}
	public String login_ok(String uid, String upass) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("upass", upass);
		String login = this.tm.selectOne("memberDB.loginok",map);
		return login;
	}
	// part null처리 -----------------------1017 해야함!! //
	public List<userdto> user_list(String part, String data,int vpage){
		List<userdto> lists = null;
		if(data==null || data=="") {
			part=null;
			lists=this.tm.selectList("memberDB.config_userlist",vpage);
		}
		else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("part", part);
			map.put("data", data);
			map.put("vpage", vpage);
			lists = this.tm.selectList("memberDB.config_userlist_map",map);
		}
		//List<userdto> lists = this.tm.selectList("memberDB.user_list");
		//System.out.println(lists);
		return lists;
	}
	
	
	public List<userdto> all_user_list(){
		
		List<userdto> lists = this.tm.selectList("memberDB.all_userlist");
		
		return lists;
	}
	
	
	
	
	
	
	
	
	
	public userdto user_lists(String uid, String upass){
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("upass", upass);
		userdto dto = this.tm.selectOne("memberDB.user_list_login",map);
		return dto;
	}
	
	
	
	
	public String user_count(String part, String data) {
		String count="";
		if(data == null || data=="") {
			part =null;
			count = this.tm.selectOne("memberDB.config_user_count");
		}
		else {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("part", part);
			map.put("data", data);
			count = this.tm.selectOne("memberDB.config_user_countmap",map);
		}
		
		return count;
	}
	
	public int user_dont(String uidx) {
		int result = this.tm.update("memberDB.user_not",uidx);
		//System.out.println(result);
		return result;
	}
}
