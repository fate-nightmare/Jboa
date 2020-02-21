package test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.accp.biz.LeaveListBiz;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/spring-ctx.xml" })
public class leaveBizTest {
	@Resource
	private LeaveListBiz biz;
	
	@Test
	public void testqueryById() {
		//System.out.println(biz.queryByLeaveList(1005, 1, 3));
	}
	
}
