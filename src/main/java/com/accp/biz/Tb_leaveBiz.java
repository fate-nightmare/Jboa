package com.accp.biz;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.accp.dao.Tb_leaveDAO;
import com.accp.pojo.Tb_leave;

@Service("tb_leaveBiz")
public class Tb_leaveBiz {
	@Autowired
	private Tb_leaveDAO dao;

	
	/* 请假 */
	public int addinsertByTb_leave(@Param("Tb_leave")  Tb_leave tb_leave) {
		return dao.insertByTb_leave(tb_leave);
	}
	
}
