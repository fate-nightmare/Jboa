package com.accp.pojo;

public class Tb_check {
	private Integer checkId;
	private Integer bizId;
	private Integer typeId;
	private String checkTime;
	private Integer checkMan;
	private Integer checkResult;
	private String checkComment;
	
	
	@Override
	public String toString() {
		return "Tb_check [checkId=" + checkId + ", bizId=" + bizId + ", typeId=" + typeId + ", checkTime=" + checkTime
				+ ", checkMan=" + checkMan + ", checkResult=" + checkResult + ", checkComment=" + checkComment + "]";
	}

	public Tb_check(Integer checkId, Integer bizId, Integer typeId, String checkTime, Integer checkMan,
			Integer checkResult, String checkComment) {
		super();
		this.checkId = checkId;
		this.bizId = bizId;
		this.typeId = typeId;
		this.checkTime = checkTime;
		this.checkMan = checkMan;
		this.checkResult = checkResult;
		this.checkComment = checkComment;
	}
	
	public Tb_check() {
		// TODO Auto-generated constructor stub
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
	
}