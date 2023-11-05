package app;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

//두번째 방식 Resource 방식의 모듈 + 컨트롤러 !!!!!
/*컨트롤러의 @Resource랑 관련있는 어노테이션임 모듈 입장에서는 class로드 아닌 @Repository를 사용 */
@Repository("data1") //이름은 맘대로 지으면됨
public class site_module2 {

	@Resource(name="sqlsession") //dbconfig.xml에 있는 Template의 id를 로드하게 됨
	private SqlSessionTemplate session; //객체를 로드함
	private site_dto dto; //dto 클래스 로드!
	
	public site_dto select() {
		//Template으로 해당 select 후 setter로 값을 전송
		this.dto = session.selectOne("adminDB.site_info");
		return this.dto;
	}
	
	
}
