package app;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

//모듈에선 @Inject를 핸들링하지 못함 안먹음
//사이트 정보 config 테이블을 활용한 모듈 부분
public class site_module {
	SqlSession se = null;
	
	private site_dto dto; //dto 클래스를 로드하여 사용 //config.xml에서 정의해놨기때매 가져옴
	
	//즉시 실행 -> Controller 에서 @Inject 값을 받아서 SqlSession 에 주입시킴 
	public site_module(SqlSessionFactory sqlsessionfactory) {
		this.se = sqlsessionfactory.openSession();
	}
	
	/*insert*/
	//
	public int site_insert() {
		
		return 0;
	}
	
	public site_dto check() { // 중요한건 자료형이 중요함 클래스를 넘겨야 함
		try {
			//setter에 해당 database 1개의 정보를 입력시킴
			 this.dto = this.se.selectOne("adminDB.site_info");
			// System.out.println(dto.getTitle());
			 this.se.close(); //session 종료
			
		}
		catch(Exception e) {
			System.out.println("db 연결실패");
		}
		return this.dto; //getter에 대한 정보를 컨트롤에 dto를 넘겨줌
	}
}
