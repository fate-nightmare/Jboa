package com.accp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.accp.pojo.Employee;
import com.accp.pojo.Tb_check;
import com.accp.pojo.Tb_leave;
import com.accp.vo.LeaveList;
import com.accp.vo.Leavedetails;

public interface LeaveListDAO {
	/* 人事查看请假 */
	List<LeaveList> queryByPersonnel(@Param("departmentId") Integer departmentId,@Param("positionId") Integer positionId,@Param("employeeId") Integer employeeId);
	
	/* 点击审批通过新增审批/修改请假表/存档 */
	int insertByApproval(@Param("tb_check") Tb_check tb_check);
	
	int updateByLeaveList(@Param("leaveList") LeaveList leaveList);
	
	/* 部门经理查看请假 */
	List<LeaveList> queryByDepartmentManager(@Param("departmentId") Integer departmentId,@Param("positionId") Integer positionId,@Param("employeeId") Integer employeeId);
	
	/* 请假 */
	int insertByLeave(@Param("tb_leave") Tb_leave tb_leave);
	
	/* 根据时间区间查询请假列表 */
	List<LeaveList> queryByTime(@Param("startTime") String startTime,@Param("endTime") String endTime);
	
	/* 查看请假审批详情 */
	List<Leavedetails> queryByLeaveListDetails(@Param("leaveId") Integer leaveId);
	
	/* 查看请假详细基本信息 */
	LeaveList queryByLeaveListDetail(@Param("leaveId") Integer leaveId);
	
	/* 根据用户查询请假列表 */
	List<LeaveList> queryByLeaveList(@Param("employeeId") Integer employeeId,@Param("positionId") Integer positionId);
	
	
	
}
