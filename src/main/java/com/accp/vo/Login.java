package com.accp.vo;

public class Login {
	/* employee */
	private Integer employeeId;
    private String employeeName;
    private String password;
    private Integer departmentId;
    private Integer positionId;
    private Integer pId;
    private String status;
	/* department */
    private String departmentName;
    /* position */
    private String positionName;
	 
	 
	@Override
	public String toString() {
		return "Login [employeeId=" + employeeId + ", employeeName=" + employeeName + ", password=" + password
				+ ", departmentId=" + departmentId + ", positionId=" + positionId + ", pId=" + pId + ", status="
				+ status + ", departmentName=" + departmentName + ", positionName=" + positionName + "]";
	}

	public Login(Integer employeeId, String employeeName, String password, Integer departmentId, Integer positionId,
			Integer pId, String status, String departmentName, String positionName) {
		super();
		this.employeeId = employeeId;
		this.employeeName = employeeName;
		this.password = password;
		this.departmentId = departmentId;
		this.positionId = positionId;
		this.pId = pId;
		this.status = status;
		this.departmentName = departmentName;
		this.positionName = positionName;
	}
	
	public Login() {
		// TODO Auto-generated constructor stub
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
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
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
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
	 
}
