package portfolio;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("faq")
public class faq_module {

	@Resource(name="sqlsession")
	private SqlSessionTemplate tm;
	
	public List<faqdto> faq_lists(int vpage){
		List<faqdto> lists = this.tm.selectList("memberDB.faq_list",vpage);
		//System.out.println(lists);
		return lists;
	}
	public List<faqdto> faq_lists2(String data,int vpage){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", data);
		map.put("vpage", vpage);
		List<faqdto> lists = this.tm.selectList("memberDB.faq_list2",map);
		System.out.println(lists);
		return lists;
	}
	
	public List<faqdto> faq_lists_client(){
		List<faqdto> lists = this.tm.selectList("memberDB.faq_list_client");
		//System.out.println(lists);
		return lists;
	}	
	
	
	
	
	
	
	public String count() {
		String ct = this.tm.selectOne("memberDB.faq_count");
		System.out.println(ct);
		return ct;
	}
	public String count(String data) {
		String ct = this.tm.selectOne("memberDB.faq_count2",data);
		return ct;
	}
	public int faq_delete(String fidx) {
		int result = this.tm.delete("memberDB.faq_delete",fidx);
		return result;
	}
	public int faq_write(String f_question,String mid, String f_answer) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("f_question", f_question);
		map.put("mid", mid);
		map.put("f_answer", f_answer);
		int result = this.tm.insert("memberDB.faq_write",map);
		return result;
	}
}
