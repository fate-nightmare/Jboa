package com.accp.pojo;

public class Employee {
    private Integer employeeid;

    private String employeename;

    private String password;

    private Integer departmentid;

    private Integer positionid;

    private Integer pid;

    private String status;
    

    @Override
	public String toString() {
		return "employee [employeeid=" + employeeid + ", employeename=" + employeename + ", password=" + password
				+ ", departmentid=" + departmentid + ", positionid=" + positionid + ", pid=" + pid + ", status="
				+ status + "]";
	}

	public Employee(Integer employeeid, String employeename, String password, Integer departmentid, Integer positionid,
			Integer pid, String status) {
		super();
		this.employeeid = employeeid;
		this.employeename = employeename;
		this.password = password;
		this.departmentid = departmentid;
		this.positionid = positionid;
		this.pid = pid;
		this.status = status;
	}
    
    public Employee() {
		// TODO Auto-generated constructor stub
	}
    

	public Integer getEmployeeid() {
        return employeeid;
    }

    public void setEmployeeid(Integer employeeid) {
        this.employeeid = employeeid;
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename == null ? null : employeename.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(Integer departmentid) {
        this.departmentid = departmentid;
    }

    public Integer getPositionid() {
        return positionid;
    }

    public void setPositionid(Integer positionid) {
        this.positionid = positionid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}