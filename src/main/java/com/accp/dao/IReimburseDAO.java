package com.accp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.accp.pojo.Reimburse_detail;
import com.accp.pojo.Tb_check;
import com.accp.pojo.Tb_reimburse;
import com.accp.vo.LeaveList;
import com.accp.vo.Leavedetails;
import com.accp.vo.ReimbursementList;

public interface IReimburseDAO {
	/* 查看审批详情 */
	List<ReimbursementList> queryByCheck(@Param("reimburseId") Integer reimburseId);
	
	/* 点击审批通过新增审批/修改报销/打回/存档 */
	int insertByApproval(@Param("tb_check") Tb_check tb_check);
	
	int updateByReimburse(@Param("tbr") Tb_reimburse tbr);
	
	/* 编辑新增新的项目详情 */
	int insertByNewProject(@Param("rdl") Reimburse_detail rdl);
	
	/* 保存编辑 */
	int updateBySave(@Param("tre") Tb_reimburse tre);
	
	/* 编辑删除 */
	int deleteByCompile(@Param("id") Integer id);
	
	/* 提交 */
	int updateBySubmit(@Param("rlist") ReimbursementList rlist);
	
	/* 审批记录未完成 */
	
	/* 查看详情信息 */
	List<ReimbursementList> queryByBasics(@Param("mainId") Integer mainId);
	
	/* 查看详情基本信息 */
	ReimbursementList queryByBasic(@Param("reimburseId") Integer reimburseId);
	
	/* 出纳/财务 */
	List<ReimbursementList> queryByTwo();
	
	/* 部门经理 */
	List<ReimbursementList> queryByDepartmentManager(@Param("departmentId") Integer departmentId,@Param("positionId") Integer positionId,@Param("employeeId") Integer employeeId);
	
	/* 根据报销单状态查询 */
	List<ReimbursementList> queryByStatusId(@Param("statusId") Integer statusId);
	
	/* 查询报销列表 */
	List<ReimbursementList> queryByReimbursementList(@Param("positionId") Integer positionId,@Param("employeeId") Integer employeeId);
	
	/* 新增报销 */
	int insertByReimburs(@Param("tb_reimburse") Tb_reimburse tb_reimburse);
	
	/* 查询主表最后一条ID */
	Tb_reimburse queryByReimburseLast();
	
	
}
