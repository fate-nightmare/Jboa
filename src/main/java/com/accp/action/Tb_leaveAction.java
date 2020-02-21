package com.accp.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.accp.biz.Tb_leaveBiz;
import com.accp.pojo.Tb_leave;

@Controller
@RequestMapping("/c/addleave")
public class Tb_leaveAction {
	@Resource
	private Tb_leaveBiz biz;
	
	
	/* 请假 */
	@PostMapping("addByLeave")
	@ResponseBody
	public Map<String, Object> insertByTb_leave(Tb_leave tb_leave) {
		Map<String, Object> message = new HashMap<String, Object>();
		if(biz.addinsertByTb_leave(tb_leave) > 0) {
			message.put("code", 200);
		} else {
			message.put("code", 400);
		}
		return message;
	}
	
}
