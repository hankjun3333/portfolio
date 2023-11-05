package portfolio;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository("notice")
public class notice_module {

	@Resource(name="sqlsession")
	private SqlSessionTemplate tm;
	
	public int noticeok(noticedto noticedto) {
		
		int result = this.tm.insert("memberDB.notice_insert",noticedto);
		//System.out.println(result);
		return result;
	}
	
	public List<noticedto> notice_lists(int vpage){
		List<noticedto> lists = this.tm.selectList("memberDB.notice_lists",vpage);
		return lists;
	}
	public List<noticedto> notice_list_map(Map<String,Object> param){
		List<noticedto> lists = this.tm.selectList("memberDB.notice_lists2",param);
		return lists;
	}
	
	public String notice_cnt() {
		String cnt = this.tm.selectOne("memberDB.notice_cnt");
		return cnt;
	}
	public String notice_cnt_map(Map <String,Object> param) {
		String cnt = this.tm.selectOne("memberDB.notice_cnt2",param);
		System.out.println(cnt);
		return cnt;
	}
	public List<noticedto> notice_view(String nidx){
		List<noticedto> lists = this.tm.selectList("memberDB.notice_view",nidx);
		System.out.println(lists);
		return lists;
	}
	
	public int view_count(String nidx) {
		int num  = Integer.parseInt(nidx);
		int view = this.tm.update("memberDB.view_count",num);
		return view;
	}
	
	public int notice_delete(String nidx) {
		int result = this.tm.delete("memberDB.notice_delete",nidx);
		return result;
	}
	public String filename(String nidx) {
		String dbfilename = this.tm.selectOne("memberDB.notice_filename",nidx);
		return dbfilename;
	}
	
	public List<noticedto> main_notice_lists(String ntitle, int vpage){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ntitle", ntitle);
		map.put("vpage", vpage);
		
		List<noticedto> lists = null;
		if(ntitle == null || ntitle == "" || ntitle == "null") {
			lists = this.tm.selectList("memberDB.notice_lists",vpage);
		}
		else {
			lists = this.tm.selectList("memberDB.notice_lists2",map);
		}
		
		return lists;
	}
	public String notice_cnt(String ntitle) {
		String cnt = "";
		if(ntitle == null || ntitle =="" || ntitle =="null") {
			 cnt = this.tm.selectOne("memberDB.notice_cnt");
		}
		else {
			cnt = this.tm.selectOne("memberDB.notice_cnt_ntitle",ntitle);
		}
		return cnt;
	}
	
}
