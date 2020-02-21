package com.accp.dao;

import org.apache.ibatis.annotations.Param;

import com.accp.pojo.Tb_leave;

public interface Tb_leaveDAO {
	/* 请假 */
	int insertByTb_leave(@Param("Tb_leave")  Tb_leave tb_leave);
	
	
	
}
