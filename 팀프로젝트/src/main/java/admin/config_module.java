package admin;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("config")
public class config_module {

	@Resource(name="sqlsession")
	private SqlSessionTemplate tm;
	
	public List<configdto> all_list() {
		List<configdto> dtolist = this.tm.selectList("adminDB.site_list");
		return dtolist;
	}
	
	public int site_insert(configdto configdto) {
		int result = this.tm.insert("adminDB.site_insert",configdto);
		System.out.println(result);
		return result;
	}
	
	
}
