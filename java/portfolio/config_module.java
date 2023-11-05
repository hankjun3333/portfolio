package portfolio;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("config")
public class config_module {

	@Resource(name="sqlsession")
	private SqlSessionTemplate tm;
	
	public int info_write(configdto configdto) {
		int result = this.tm.insert("memberDB.config_insert",configdto);

		return result;
	}
	
	public List<configdto> config_list(int vpage){
		List<configdto> lists = this.tm.selectList("memberDB.config_lists",vpage);
		return lists;
	}
	public List<configdto> config_list(String search,int vpage){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("vpage", vpage);
		List<configdto> lists = this.tm.selectList("memberDB.config_lists2",map);
		if(lists == null) {
			lists = new ArrayList<configdto>();
		}
		
		return lists;
	}
	public int config_list_count() {
		int cnt = this.tm.selectOne("memberDB.config_cnt");
		return cnt;
	}
	public int config_list_count(String search) {
		int cnt = this.tm.selectOne("memberDB.config_cnt2",search);
		return cnt;
	}	
	public List<configdto> config_display(){
		List<configdto> lists = this.tm.selectList("memberDB.config_display");
		return lists;
	}
	
	
	public int config_delete(String cidx) {
		int result = this.tm.delete("memberDB.config_delete",cidx);
		return result;
	}
	
}
