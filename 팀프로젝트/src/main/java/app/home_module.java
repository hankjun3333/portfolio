package app;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class home_module {

	SqlSession se = null;
	private home_dto dto;
	private home_dto data;
	
	public home_module(SqlSessionFactory sqlsessionfactory) {
		this.se = sqlsessionfactory.openSession();
	}
	
	public int home_insert(home_dto home_dto) {
		int a = 0;
		try {
			a = this.se.insert("adminDB.home_insert",home_dto);
			if(a>0) {
				System.out.println("정보가 잘입력되었음");
			}
		}
		catch(Exception e) {
			System.out.println(e);
			System.out.println("정보 입력잘안됫음");
		}
		
		return a;
	}
	
	public List<home_dto> home_select() {
		List<home_dto> data2 = new ArrayList<home_dto>(); 
		try {
			data2 = this.se.selectList("adminDB.selectall22");
			System.out.println(data2.get(0).getMidx());
			
			this.se.close();
			
		}
		catch(Exception e) {
			System.out.println(e);
			System.out.println("db연결실패");
		}
		
		return data2;
	}
	
	
}
