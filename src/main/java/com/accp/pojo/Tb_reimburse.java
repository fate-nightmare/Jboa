package com.accp.pojo;

import java.util.ArrayList;
import java.util.List;

public class Tb_reimburse {
	private Integer reimburseId;
	private Integer typeId;
	private Integer createMan;
	private String createTime;
	private Integer departmentId;
	private Integer nextDealMan;
	private String event;
	private Float totalCount;
	private Integer statusId;
	private List<Reimburse_detail> list = new ArrayList<Reimburse_detail>(0);
	
	
	@Override
	public String toString() {
		return "Tb_reimburse [reimburseId=" + reimburseId + ", typeId=" + typeId + ", createMan=" + createMan
				+ ", createTime=" + createTime + ", departmentId=" + departmentId + ", nextDealMan=" + nextDealMan
				+ ", event=" + event + ", totalCount=" + totalCount + ", statusId=" + statusId + ", list=" + list + "]";
	}

	public Tb_reimburse(Integer reimburseId, Integer typeId, Integer createMan, String createTime, Integer departmentId,
			Integer nextDealMan, String event, Float totalCount, Integer statusId, List<Reimburse_detail> list) {
		super();
		this.reimburseId = reimburseId;
		this.typeId = typeId;
		this.createMan = createMan;
		this.createTime = createTime;
		this.departmentId = departmentId;
		this.nextDealMan = nextDealMan;
		this.event = event;
		this.totalCount = totalCount;
		this.statusId = statusId;
		this.list = list;
	}
	
	public Tb_reimburse() {
		// TODO Auto-generated constructor stub
	}
	
	public Integer getReimburseId() {
		return reimburseId;
	}
	public void setReimburseId(Integer reimburseId) {
		this.reimburseId = reimburseId;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public Integer getCreateMan() {
		return createMan;
	}
	public void setCreateMan(Integer createMan) {
		this.createMan = createMan;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	public Integer getNextDealMan() {
		return nextDealMan;
	}
	public void setNextDealMan(Integer nextDealMan) {
		this.nextDealMan = nextDealMan;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public Float getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Float totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getStatusId() {
		return statusId;
	}
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	public List<Reimburse_detail> getList() {
		return list;
	}
	public void setList(List<Reimburse_detail> list) {
		this.list = list;
	}
	
}
