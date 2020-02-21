package com.accp.pojo;

public class Reimburse_detail {
	private Integer id;
	private Integer mainId;
	private Float subTotal;
	private String desc;
	private String pictureName;
	private String picturePath;
	
	
	
	@Override
	public String toString() {
		return "Reimburse_detail [id=" + id + ", mainId=" + mainId + ", subTotal=" + subTotal + ", desc=" + desc
				+ ", pictureName=" + pictureName + ", picturePath=" + picturePath + "]";
	}

	public Reimburse_detail(Integer id, Integer mainId, Float subTotal, String desc, String pictureName,
			String picturePath) {
		super();
		this.id = id;
		this.mainId = mainId;
		this.subTotal = subTotal;
		this.desc = desc;
		this.pictureName = pictureName;
		this.picturePath = picturePath;
	}
	
	public Reimburse_detail() {
		// TODO Auto-generated constructor stub
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
	
}
