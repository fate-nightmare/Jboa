package test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.accp.biz.employeeBiz;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/spring-ctx.xml" })
public class employeeBizTest {
	@Resource
	private employeeBiz biz;
	
	/**
	 * 登录
	 */
	@Test
	public void testlogin() {
		System.out.println(biz.login(1001, "aaa12345"));
	}
	
	
	
}
