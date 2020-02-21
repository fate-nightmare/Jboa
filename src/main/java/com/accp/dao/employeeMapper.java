package com.accp.dao;

import org.apache.ibatis.annotations.Param;

import com.accp.pojo.Employee;
import com.accp.vo.Login;

public interface employeeMapper {
	//登录
	Login login(@Param("employeeId") Integer employeeId,@Param("password") String password);

}