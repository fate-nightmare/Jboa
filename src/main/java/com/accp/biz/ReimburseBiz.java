package com.accp.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.accp.dao.IReimburseDAO;
import com.accp.pojo.Reimburse_detail;
import com.accp.pojo.Tb_check;
import com.accp.pojo.Tb_reimburse;
import com.accp.vo.ReimbursementList;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("reimburseBiz")
public class ReimburseBiz {
	@Autowired
	private IReimburseDAO dao;
	
	/* 查看审批详情 */
	public List<ReimbursementList> queryByCheck(Integer reimburseId){
		return dao.queryByCheck(reimburseId);
	}
	
	/* 点击审批通过新增审批/修改报销/打回/存档 */
	public int addinsertByApproval(Tb_check tb_check) {
		return dao.insertByApproval(tb_check);
	}
	
	public int modifyupdateByReimburse(Tb_reimburse tbr) {
		return dao.updateByReimburse(tbr);
	}
	
	/* 编辑新增新的项目详情 */
	public int addinsertByNewProject(Reimburse_detail rdl) {
		return dao.insertByNewProject(rdl);
	}
	
	/* 保存编辑 */
	public int modifyupdateBySave(Tb_reimburse tre) {
		return dao.updateBySave(tre);
	}
	
	/* 编辑删除 */
	public int removedeleteByCompile(Integer id) {
		return dao.deleteByCompile(id);
	}
	
	/* 提交 */
	public int modifyupdateBySubmit(ReimbursementList rlist) {
		return dao.updateBySubmit(rlist);
	}
	
	/* 查看详情信息 */
	public List<ReimbursementList> queryByBasics(Integer mainId){
		return dao.queryByBasics(mainId);
	}
	
	/* 查看详情基本信息 */
	public ReimbursementList queryByBasic(Integer reimburseId) {
		return dao.queryByBasic(reimburseId);
	}
	
	/* 出纳/财务 */
	public PageInfo<ReimbursementList> queryByTwo(Integer pageNum, Integer pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<ReimbursementList>(dao.queryByTwo());
	}
	
	/* 部门经理 */
	public PageInfo<ReimbursementList> queryByDepartmentManager(Integer departmentId, Integer positionId, Integer employeeId, Integer pageNum, Integer pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<ReimbursementList>(dao.queryByDepartmentManager(departmentId, positionId, employeeId));
	}
	
	/* 根据报销单状态查询 */
	public List<ReimbursementList> queryByStatusId(Integer statusId){
		return dao.queryByStatusId(statusId);
	}
	
	/* 查询报销列表 */
	public PageInfo<ReimbursementList> queryByReimbursementList(Integer positionId, Integer employeeId,Integer pageNum, Integer pageSize){
		PageHelper.startPage(pageNum, pageSize);
		return new PageInfo<ReimbursementList>(dao.queryByReimbursementList(positionId, employeeId));
	}
	
	/* 新增报销 */
	public int addinsertByReimburs(Tb_reimburse tb_reimburse) {
		return dao.insertByReimburs(tb_reimburse);
	}
	
	/* 查询主表最后一条ID */
	public Tb_reimburse queryByReimburseLast() {
		return dao.queryByReimburseLast();
	}
	
}
