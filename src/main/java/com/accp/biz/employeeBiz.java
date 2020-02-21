package com.accp.biz;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.accp.dao.employeeMapper;
import com.accp.pojo.Employee;
import com.accp.vo.Login;

@Service("employeeBiz")
public class employeeBiz {
	@Autowired
	private employeeMapper dao;
	
	//登录
	public Login login(Integer employeeId,String password) {
		return dao.login(employeeId, password);
	}
	
	
	
}
