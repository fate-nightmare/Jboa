package com.accp.biz;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.accp.dao.LeaveListDAO;
import com.accp.pojo.Employee;
import com.accp.pojo.Tb_check;
import com.accp.pojo.Tb_leave;
import com.accp.vo.LeaveList;
import com.accp.vo.Leavedetails;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("leaveListBiz")
public class LeaveListBiz {
	@Autowired
	private LeaveListDAO dao;
	
	/* 人事查看请假 */
	public PageInfo<LeaveList> queryByPersonnel(Integer departmentId, Integer positionId, Integer employeeId, Integer pageNum,Integer pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<LeaveList>(dao.queryByPersonnel(departmentId, positionId, employeeId));
	}
	
	/* 点击审批通过新增审批/修改请假表 */
	public int addinsertByApproval(Tb_check tb_check) {
		return dao.insertByApproval(tb_check);
	}
	
	public int modifyupdateByLeaveList(LeaveList leaveList) {
		return dao.updateByLeaveList(leaveList);
	}
	
	/* 部门经理查看请假 */
	public PageInfo<LeaveList> queryByDepartmentManager(Integer departmentId, Integer positionId, Integer employeeId, Integer pageNum, Integer pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<LeaveList>(dao.queryByDepartmentManager(departmentId, positionId, employeeId));
	}
	
	/* 请假 */
	public int addinsertByLeave(Tb_leave tb_leave) {
		return dao.insertByLeave(tb_leave);
	}
	
	/* 根据时间区间查询请假列表 */
	public PageInfo<LeaveList> queryByTime(String startTime,String endTime,Integer pageNum,Integer pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<LeaveList>(dao.queryByTime(startTime, endTime));
	}
	
	/* 查看请假审查详情 */
	public List<Leavedetails> queryByLeaveListDetails(Integer leaveId){
		return dao.queryByLeaveListDetails(leaveId);
	}
	
	/* 查看请假详细基本信息 */
	public LeaveList queryByLeaveListDetail(Integer leaveId) {
		return dao.queryByLeaveListDetail(leaveId);
	}
	
	/* 根据用户查询请假列表 */
	public PageInfo<LeaveList> queryByLeaveList(Integer employeeId,Integer positionId,Integer pageNum,Integer pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<LeaveList>(dao.queryByLeaveList(employeeId,positionId));
	}
	
	
	
}
