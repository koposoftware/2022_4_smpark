package kr.ac.kopo;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class PleaseApplication {
	
	@Autowired
	private static SqlSessionTemplate sqlSessionTemplate;
	
	
	public static void main(String[] args) {
		SpringApplication.run(PleaseApplication.class, args);
		
		List<Map<String,Object>> list = sqlSessionTemplate.selectList("kr.ac.kopo.dao.MemberDAO.test",8);
		
		for(Map<String,Object> data: list) {
			Set<String> keys =data.keySet();
			for(String key : keys) {
				System.out.println(key+":"+ data.get(key));
			}
		}
		
	}

}
