package com.accp.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.accp.biz.ReimburseBiz;
import com.accp.pojo.Reimburse_detail;
import com.accp.pojo.Tb_check;
import com.accp.pojo.Tb_reimburse;
import com.accp.vo.LeaveList;
import com.accp.vo.Leavedetails;
import com.accp.vo.ReimbursementList;
import com.github.pagehelper.PageInfo;

@RestController
@RequestMapping("/api/reimburse")
public class ReimburseAction {
	@Resource
	private ReimburseBiz biz;
	
	/* 查看审批详情 */
	@GetMapping("/queryByCheck/{reimburseId}")
	List<ReimbursementList> queryByCheck(@PathVariable Integer reimburseId){
		return biz.queryByCheck(reimburseId);
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
	
	@PutMapping("/{updateByReimburse}")
	public Map<String, Object> updateByReimburse(@RequestBody Tb_reimburse tbr) {
		Map<String, Object> message = new HashMap<String, Object>();
		int i  = biz.modifyupdateByReimburse(tbr);
		if(i > 0) {
			message.put("code", "200");
			message.put("msg", "ok");
		} else {
			message.put("code", "500");
			message.put("msg", "no");
		}
		return message;
	}
	
	/* 编辑新增新的项目详情 */
	@PostMapping("/insertByNewProject")
	public Map<String, Object> insertByNewProject(@RequestBody Reimburse_detail rdl) {
		Map<String, Object> message = new HashMap<String, Object>();
		System.out.println(biz.addinsertByNewProject(rdl));
		int i = biz.addinsertByNewProject(rdl);
		if(i > 0){
			message.put("code", "200");
			message.put("msg", "ok");
		} else {
			message.put("code", "500");
			message.put("msg", "no");
		}
		return message;
	}
	
	/* 保存编辑 */
	@PutMapping("/updateBySave")
	public Map<String, Object> updateBySave(@RequestBody Tb_reimburse tre) {
		Map<String, Object> message = new HashMap<String, Object>();
		System.out.println(biz.modifyupdateBySave(tre));
		int i = biz.modifyupdateBySave(tre);
		if(i > 0){
			message.put("code", "200");
			message.put("msg", "ok");
		} else {
			message.put("code", "500");
			message.put("msg", "no");
		}
		return message;
	}
	
	/* 编辑删除 */
	@DeleteMapping("/deleteByCompile/{id}")
	public Map<String, Object> deleteByCompile(@PathVariable Integer id) {
		Map<String, Object> message = new HashMap<String, Object>();
		int i = biz.removedeleteByCompile(id);
		if(i > 0) {
			message.put("code", "200");
			message.put("msg", "ok");
		} else {
			message.put("code", "500");
			message.put("msg", "no");
		}
		return message;
	}
	
	/* 提交 */
	@PutMapping("/updateBySubmit")
	public Map<String, Object> updateBySubmit(@RequestBody ReimbursementList rlist) {
		Map<String, Object> message = new HashMap<String, Object>();
		System.out.println(biz.modifyupdateBySubmit(rlist));
		int i = biz.modifyupdateBySubmit(rlist);
		if(i > 0){
			message.put("code", "200");
			message.put("msg", "ok");
		} else {
			message.put("code", "500");
			message.put("msg", "no");
		}
		return message;
	}
	
	/* 查看详情信息 */
	@GetMapping("/queryByBasics/{mainId}")
	public List<ReimbursementList> queryByBasics(@PathVariable Integer mainId){
		System.out.println(biz.queryByBasics(mainId));
		return biz.queryByBasics(mainId);
	}
	
	/* 查看详情基本信息 */
	@GetMapping("/queryByBasic/{reimburseId}")
	public ReimbursementList queryByBasic(@PathVariable Integer reimburseId) {
		System.out.println(biz.queryByBasic(reimburseId));
		return biz.queryByBasic(reimburseId);
	}
	
	/* 出纳/财务 */
	@GetMapping("/queryByTwo/{pageNum}/{pageSize}")
	public PageInfo<ReimbursementList> queryByTwo(@PathVariable Integer pageNum,@PathVariable Integer pageSize){
		return biz.queryByTwo(pageNum, pageSize);
	}
	
	/* 部门经理 */
	@GetMapping("/queryByDepartmentManager/{departmentId}/{positionId}/{employeeId}/{pageNum}/{pageSize}")
	public PageInfo<ReimbursementList> queryByDepartmentManager(@PathVariable Integer departmentId,@PathVariable Integer positionId,@PathVariable Integer employeeId,@PathVariable Integer pageNum,@PathVariable Integer pageSize){
		System.out.println(biz.queryByDepartmentManager(departmentId, positionId, employeeId, pageNum, pageSize));
		return biz.queryByDepartmentManager(departmentId, positionId, employeeId, pageNum, pageSize);
	}
	
	/* 根据报销单状态查询 */
	@GetMapping("/queryByStatusId/{statusId}")
	public List<ReimbursementList> queryByStatusId(@PathVariable Integer statusId){
		System.out.println(biz.queryByStatusId(statusId));
		return biz.queryByStatusId(statusId);
	}
	
	/* 查询报销列表 */
	@GetMapping("/queryByRList/{positionId}/{employeeId}/{pageNum}/{pageSize}")
	public PageInfo<ReimbursementList> queryByReimbursementList(@PathVariable Integer positionId,@PathVariable Integer employeeId,@PathVariable Integer pageNum,@PathVariable Integer pageSize){
		System.out.println(biz.queryByReimbursementList(positionId, employeeId, pageNum, pageSize));
		return biz.queryByReimbursementList(positionId, employeeId, pageNum, pageSize);
	}
	
	/* 新增报销 */
	@PostMapping("addByReimburse")
	public Map<String, Object> insertByReimburs(@RequestBody Tb_reimburse tb_reimburse) {
		Map<String, Object> message = new HashMap<String, Object>();
		int i = biz.addinsertByReimburs(tb_reimburse);
		if(i > 0) {
			message.put("code", "200");
			message.put("msg", "ok");
		} else {
			message.put("code", "500");
			message.put("msg", "no");
		}
		return message;
	}
	
	/* 查询主表最后一条ID */
	@GetMapping("/queryByLast")
	public Tb_reimburse queryByReimburseLast() {
		return biz.queryByReimburseLast();
	}
	
}
