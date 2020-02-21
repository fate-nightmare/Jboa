package com.accp.vo;

public class ReimbursementList {
	private String createMans;
	private String statusIds;
	private String nextDealMans;
	/* tb_reimburse */
	private Integer reimburseId;
	private Integer typeId;
	private Integer createMan;
	private String createTime;
	private Integer departmentId;
	private Integer nextDealMan;
	private String event;
	private Float totalCount;
	private Integer statusId;
	/* reimburse_detail */
	private Integer id;
	private Integer mainId;
	private Float subTotal;
	private String desc;
	private String pictureName;
	private String picturePath;
	/* employee */
	private Integer employeeId;
	private String employeeName;
	private String password;
	private Integer positionId;
	private Integer pId;
	private String status;
	/* tb_check */
	private Integer checkId;
	private Integer bizId;
	private String checkTime;
	private Integer checkMan;
	private Integer checkResult;
	private String checkComment;
	/* tb_status */
	private String statusName;
	/* check_result */
	private Integer resultId;
	private String resultName;
	/* position */
	private String positionName;
	/* department */
	private String departmentName;
	
	
	@Override
	public String toString() {
		return "ReimbursementList [createMans=" + createMans + ", statusIds=" + statusIds + ", nextDealMans="
				+ nextDealMans + ", reimburseId=" + reimburseId + ", typeId=" + typeId + ", createMan=" + createMan
				+ ", createTime=" + createTime + ", departmentId=" + departmentId + ", nextDealMan=" + nextDealMan
				+ ", event=" + event + ", totalCount=" + totalCount + ", statusId=" + statusId + ", id=" + id
				+ ", mainId=" + mainId + ", subTotal=" + subTotal + ", desc=" + desc + ", pictureName=" + pictureName
				+ ", picturePath=" + picturePath + ", employeeId=" + employeeId + ", employeeName=" + employeeName
				+ ", password=" + password + ", positionId=" + positionId + ", pId=" + pId + ", status=" + status
				+ ", checkId=" + checkId + ", bizId=" + bizId + ", checkTime=" + checkTime + ", checkMan=" + checkMan
				+ ", checkResult=" + checkResult + ", checkComment=" + checkComment + ", statusName=" + statusName
				+ ", resultId=" + resultId + ", resultName=" + resultName + ", positionName=" + positionName
				+ ", departmentName=" + departmentName + "]";
	}

	public ReimbursementList(String createMans, String statusIds, String nextDealMans, Integer reimburseId,
			Integer typeId, Integer createMan, String createTime, Integer departmentId, Integer nextDealMan,
			String event, Float totalCount, Integer statusId, Integer id, Integer mainId, Float subTotal, String desc,
			String pictureName, String picturePath, Integer employeeId, String employeeName, String password,
			Integer positionId, Integer pId, String status, Integer checkId, Integer bizId, String checkTime,
			Integer checkMan, Integer checkResult, String checkComment, String statusName, Integer resultId,
			String resultName, String positionName, String departmentName) {
		super();
		this.createMans = createMans;
		this.statusIds = statusIds;
		this.nextDealMans = nextDealMans;
		this.reimburseId = reimburseId;
		this.typeId = typeId;
		this.createMan = createMan;
		this.createTime = createTime;
		this.departmentId = departmentId;
		this.nextDealMan = nextDealMan;
		this.event = event;
		this.totalCount = totalCount;
		this.statusId = statusId;
		this.id = id;
		this.mainId = mainId;
		this.subTotal = subTotal;
		this.desc = desc;
		this.pictureName = pictureName;
		this.picturePath = picturePath;
		this.employeeId = employeeId;
		this.employeeName = employeeName;
		this.password = password;
		this.positionId = positionId;
		this.pId = pId;
		this.status = status;
		this.checkId = checkId;
		this.bizId = bizId;
		this.checkTime = checkTime;
		this.checkMan = checkMan;
		this.checkResult = checkResult;
		this.checkComment = checkComment;
		this.statusName = statusName;
		this.resultId = resultId;
		this.resultName = resultName;
		this.positionName = positionName;
		this.departmentName = departmentName;
	}
	
	public ReimbursementList() {
		// TODO Auto-generated constructor stub
	}
	
	public String getCreateMans() {
		return createMans;
	}
	public void setCreateMans(String createMans) {
		this.createMans = createMans;
	}
	public String getStatusIds() {
		return statusIds;
	}
	public void setStatusIds(String statusIds) {
		this.statusIds = statusIds;
	}
	public String getNextDealMans() {
		return nextDealMans;
	}
	public void setNextDealMans(String nextDealMans) {
		this.nextDealMans = nextDealMans;
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
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getMainId() {
		return mainId;
	}
	public void setMainId(Integer mainId) {
		this.mainId = mainId;
	}
	public Float getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(Float subTotal) {
		this.subTotal = subTotal;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getPictureName() {
		return pictureName;
	}
	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}
	public String getPicturePath() {
		return picturePath;
	}
	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}
	public Integer getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getPositionId() {
		return positionId;
	}
	public void setPositionId(Integer positionId) {
		this.positionId = positionId;
	}
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
		this.pId = pId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getCheckId() {
		return checkId;
	}
	public void setCheckId(Integer checkId) {
		this.checkId = checkId;
	}
	public Integer getBizId() {
		return bizId;
	}
	public void setBizId(Integer bizId) {
		this.bizId = bizId;
	}
	public String getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(String checkTime) {
		this.checkTime = checkTime;
	}
	public Integer getCheckMan() {
		return checkMan;
	}
	public void setCheckMan(Integer checkMan) {
		this.checkMan = checkMan;
	}
	public Integer getCheckResult() {
		return checkResult;
	}
	public void setCheckResult(Integer checkResult) {
		this.checkResult = checkResult;
	}
	public String getCheckComment() {
		return checkComment;
	}
	public void setCheckComment(String checkComment) {
		this.checkComment = checkComment;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	public Integer getResultId() {
		return resultId;
	}
	public void setResultId(Integer resultId) {
		this.resultId = resultId;
	}
	public String getResultName() {
		return resultName;
	}
	public void setResultName(String resultName) {
		this.resultName = resultName;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	
}
