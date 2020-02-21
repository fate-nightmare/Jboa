package com.accp.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.accp.biz.LeaveListBiz;
import com.accp.pojo.Employee;
import com.accp.pojo.Tb_check;
import com.accp.pojo.Tb_leave;
import com.accp.vo.LeaveList;
import com.accp.vo.Leavedetails;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("/api/leaveList")
public class LeaveListAction {
	@Resource
	private LeaveListBiz biz;
	
	/* 人事查看请假 */
	@GetMapping("/queryByPersonnel/{departmentId}/{positionId}/{employeeId}/{pageNum}/{pageSize}")
	public PageInfo<LeaveList> queryByPersonnel(@PathVariable Integer departmentId, @PathVariable Integer positionId, @PathVariable Integer employeeId, @PathVariable Integer pageNum,@PathVariable Integer pageSize){
		System.out.println("人事查看请假："+biz.queryByPersonnel(departmentId, positionId, employeeId, pageNum, pageSize));
		return biz.queryByPersonnel(departmentId, positionId, employeeId, pageNum, pageSize);
	}
	
	/* 点击审批通过新增审批/修改请假表 */
	@PostMapping("/{addByApproval}")
	public Map<String, Object> insertByApproval(@RequestBody Tb_check tb_check) {
		Map<String, Object> message = new HashMap<String, Object>();
		int i  = biz.addinsertByApproval(tb_check);
		if(i > 0) {
			message.put("code", "200");
			message.put("msg", "ok");
		} else {
			message.put("code", "500");
			message.put("msg", "no");
		}
		return message;
	}
	
	@PutMapping("/{updateByLeaveList}")
	public Map<String, Object> updateByLeaveList(@RequestBody LeaveList leaveList) {
		Map<String, Object> message = new HashMap<String, Object>();
		int i  = biz.modifyupdateByLeaveList(leaveList);
		if(i > 0) {
			message.put("code", "200");
			message.put("msg", "ok");
		} else {
			message.put("code", "500");
			message.put("msg", "no");
		}
		return message;
	}
	
	
	/* 部门经理查看请假 */
	@GetMapping("/queryByManager/{departmentId}/{positionId}/{employeeId}/{pageNum}/{pageSize}")
	public PageInfo<LeaveList> queryByDepartmentManager(@PathVariable Integer departmentId, @PathVariable Integer positionId, @PathVariable Integer employeeId, @PathVariable Integer pageNum, @PathVariable Integer pageSize){
		System.out.println("部门经理查看请假："+biz.queryByDepartmentManager(departmentId, positionId, employeeId, pageNum, pageSize));
		return biz.queryByDepartmentManager(departmentId, positionId, employeeId, pageNum, pageSize);
	}
	
	/* 请假 */
	@PostMapping("/add")
	public Map<String, Object> insertByLeave(@RequestBody Tb_leave tb_leave) {
		Map<String, Object> message = new HashMap<String, Object>();
		int i = biz.addinsertByLeave(tb_leave);
		if(i > 0) {
			message.put("code", "200");
			message.put("msg", "ok");
		} else {
			message.put("code", "500");
			message.put("msg", "no");
		}
		return message;
	}
	
	/* 根据时间区间查询请假列表 */
	@GetMapping("/queryByTime/{startTime}/{endTime}/{pageNum}/{pageSize}")
	public PageInfo<LeaveList> queryByTime(@PathVariable String startTime,@PathVariable String endTime,@PathVariable Integer pageNum,@PathVariable Integer pageSize){
		System.out.println(biz.queryByTime(startTime, endTime, pageNum, pageSize));
		return biz.queryByTime(startTime, endTime, pageNum, pageSize);
	}
	
	/* 查看请假审批详情 */
	@GetMapping("/{details}/{leaveId}")
	public List<Leavedetails> queryByLeaveListDetails(@PathVariable Integer leaveId){
		System.out.println("==========查看请假审批详情=========="+biz.queryByLeaveListDetails(leaveId));
		return biz.queryByLeaveListDetails(leaveId);
	}
	
	/* 查看请假详细基本信息 */
	@GetMapping("/detail/{leaveId}")
	public LeaveList queryByLeaveListDetail(@PathVariable Integer leaveId) {
		System.out.println(biz.queryByLeaveListDetail(leaveId));
		return biz.queryByLeaveListDetail(leaveId);
	}
	
	/* 根据用户查询请假列表 */
	@GetMapping("/{positionId}/{employeeId}/{pageNum}/{pageSize}")
	public PageInfo<LeaveList> queryByLeaveList(@PathVariable Integer employeeId,@PathVariable Integer positionId,@PathVariable Integer pageNum,@PathVariable Integer pageSize) {
		System.out.println("根据用户查询请假列表"+biz.queryByLeaveList(employeeId, positionId, pageNum, pageSize));
		return biz.queryByLeaveList(employeeId, positionId, pageNum, pageSize);
	}
	
	
	/* 根据用户查询请假列表 */
	//@PostMapping("leaveList")
	//public String queryByLeaveList(Model model,Integer employeeId) {
	//	model.addAttribute("leavelist", biz.queryByLeaveList(employeeId));
	//	return "leavefindList";
	//}
	
	
}
