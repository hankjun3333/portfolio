package app;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("address")
public class address_module {

	@Resource(name="sqlsession")
	private SqlSessionTemplate session;
	
	int a = 0;
	public int address_insert(address_dto address_dto) {
		this.a = session.insert("adminDB.address_insert",address_dto);
		System.out.println(a);
		return this.a;
	}
}
