package com.accp.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.accp.biz.employeeBiz;
import com.accp.pojo.Employee;
import com.accp.vo.Login;

@Controller
/* @RequestMapping("/c/list") */
public class employeeAction {
	@Resource
	private employeeBiz biz;
	
	@PostMapping("login")
	public String login(HttpSession session,Integer employeeId,String password) {
		//System.out.println(employeeId);
		//System.out.println(password);
		Login l = biz.login(employeeId, password);
		if(l!=null) {
			session.setAttribute("login",l);
			return "HomePage";
		}else {
			return null;
		}
	} 
	
	
	
}
