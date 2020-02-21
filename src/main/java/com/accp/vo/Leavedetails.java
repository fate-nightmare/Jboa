package com.accp.vo;

public class Leavedetails {
	private String nextDealManName;
	/*tb_check*/
	private Integer checkId;
	private Integer bizId;
	private Integer typeId;
	private String checkTime;
	private Integer checkMan;
	private Integer checkResult;
	private String checkComment;
	/* tb_leave */
	private Integer leaveId;
	private Integer createMan;
	private String createManName;
	private Integer departmentId;
	private String createTime;
	private String startTime;
	private String endTime;
	private Integer nextDealMan;
	private String event;
	private Integer totalCount;
	private Integer statusId;
	/* check_result */
	private Integer resultId;
	private String resultName;
	
	
	@Override
	public String toString() {
		return "Leavedetails [nextDealManName=" + nextDealManName + ", checkId=" + checkId + ", bizId=" + bizId
				+ ", typeId=" + typeId + ", checkTime=" + checkTime + ", checkMan=" + checkMan + ", checkResult="
				+ checkResult + ", checkComment=" + checkComment + ", leaveId=" + leaveId + ", createMan=" + createMan
				+ ", createManName=" + createManName + ", departmentId=" + departmentId + ", createTime=" + createTime
				+ ", startTime=" + startTime + ", endTime=" + endTime + ", nextDealMan=" + nextDealMan + ", event="
				+ event + ", totalCount=" + totalCount + ", statusId=" + statusId + ", resultId=" + resultId
				+ ", resultName=" + resultName + "]";
	}

	public Leavedetails(String nextDealManName, Integer checkId, Integer bizId, Integer typeId, String checkTime,
			Integer checkMan, Integer checkResult, String checkComment, Integer leaveId, Integer createMan,
			String createManName, Integer departmentId, String createTime, String startTime, String endTime,
			Integer nextDealMan, String event, Integer totalCount, Integer statusId, Integer resultId,
			String resultName) {
		super();
		this.nextDealManName = nextDealManName;
		this.checkId = checkId;
		this.bizId = bizId;
		this.typeId = typeId;
		this.checkTime = checkTime;
		this.checkMan = checkMan;
		this.checkResult = checkResult;
		this.checkComment = checkComment;
		this.leaveId = leaveId;
		this.createMan = createMan;
		this.createManName = createManName;
		this.departmentId = departmentId;
		this.createTime = createTime;
		this.startTime = startTime;
		this.endTime = endTime;
		this.nextDealMan = nextDealMan;
		this.event = event;
		this.totalCount = totalCount;
		this.statusId = statusId;
		this.resultId = resultId;
		this.resultName = resultName;
	}
	
	public Leavedetails() {
		// TODO Auto-generated constructor stub
	}
	
	public String getNextDealManName() {
		return nextDealManName;
	}
	public void setNextDealManName(String nextDealManName) {
		this.nextDealManName = nextDealManName;
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
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
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
	public Integer getLeaveId() {
		return leaveId;
	}
	public void setLeaveId(Integer leaveId) {
		this.leaveId = leaveId;
	}
	public Integer getCreateMan() {
		return createMan;
	}
	public void setCreateMan(Integer createMan) {
		this.createMan = createMan;
	}
	public String getCreateManName() {
		return createManName;
	}
	public void setCreateManName(String createManName) {
		this.createManName = createManName;
	}
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
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
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getStatusId() {
		return statusId;
	}
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
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
	
}
