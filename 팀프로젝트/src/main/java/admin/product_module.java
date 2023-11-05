package admin;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("product")
public class product_module {

	@Resource(name="sqlsession")
	private SqlSessionTemplate tm;
	
	private productdto dto;
	public int product_data(productdto productdto) {
		int result = this.tm.insert("adminDB.product_insert",productdto);
		//System.out.println(result);
		return result;
	}
	
	public String product_codeck(String pid) {
		String codeck = this.tm.selectOne("adminDB.code_ck",pid);
		//System.out.println(codeck);
		return codeck;
	}
	public List<productdto> product_lists(){
		List<productdto> lists = this.tm.selectList("adminDB.product_alldata");
		
		return lists;
	}
	
	
	public List<productdto> product_lists(int vpage){
		List<productdto> lists = this.tm.selectList("adminDB.product_alldata2",vpage);
		return lists;
	}
	
	public List<productdto> product_lists(int vpage,String search,String part){
		if(part == null || part =="") {
			part = "pname";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vpage", vpage);
		map.put("search", search);
		map.put("part", part);
		List<productdto>lists = this.tm.selectList("adminDB.product_alldata_map",map);
		
		return lists;
	}
	public String product_count() {
		String ct = this.tm.selectOne("adminDB.product_total");
		return ct;
	}
	
	public String product_count(String search,String part) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("part", part);
		String ct = null;
		if(part.intern()=="pname") {
			ct = this.tm.selectOne("adminDB.product_totalmap",map);
		}
		else if(part.intern() == "pcode") {
			ct = this.tm.selectOne("adminDB.product_totalmap2",map);
		}
		return ct;
	}
	
	public int product_delete(List<Integer> pidx) {
		int result = this.tm.delete("adminDB.product_delete",pidx);
		System.out.println(result);
		return result;
	}
	
	
}
