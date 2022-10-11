package com.wooridoori.app.mail;

import javax.annotation.Resource;
import java.util.Map;
import org.springframework.stereotype.Repository;

@Repository("emailDao")
public class EmailDAO implements EmailService {
	
	@Resource(name="template")
	SqlSessionTemplate template;
	
	@Override
	public String getPw(Map<String, Object> paramMap) {
		return template.selectOne("passEquals",paramMap);
	}
}
