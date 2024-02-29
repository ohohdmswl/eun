package eun.proj.service;

import java.io.Serializable;

public class SviewVO implements Serializable{

	private static final long serialVersionUID = -7701265536980165738L;
	
	private String parent_sn;
	private String nm;
	private String my_sn;
	private String day_wrtr;
	private String day_wrtday;
	
	private String newName;
	private String checkChildState;
	
	
	public String getParent_sn() {
		return parent_sn;
	}
	public void setParent_sn(String parent_sn) {
		this.parent_sn = parent_sn;
	}
	public String getNm() {
		return nm;
	}
	public void setNm(String nm) {
		this.nm = nm;
	}
	public String getMy_sn() {
		return my_sn;
	}
	public void setMy_sn(String my_sn) {
		this.my_sn = my_sn;
	}
	public String getDay_wrtr() {
		return day_wrtr;
	}
	public void setDay_wrtr(String day_wrtr) {
		this.day_wrtr = day_wrtr;
	}
	public String getDay_wrtday() {
		return day_wrtday;
	}
	public void setDay_wrtday(String day_wrtday) {
		this.day_wrtday = day_wrtday;
	}
	
	
	
	public String getNewName() {
		return newName;
	}
	public void setNewName(String newName) {
		this.newName = newName;
	}
	
	
	public String getCheckChildState() {
		return checkChildState;
	}
	public void setCheckChildState(String checkChildState) {
		this.checkChildState = checkChildState;
	}
	@Override
	public String toString() {
		return "MainVO [parent_sn=" + parent_sn + ", nm=" + nm + ", my_sn=" + my_sn + ", day_wrtr=" + day_wrtr
				+ ", day_wrtday=" + day_wrtday + ", newName=" + newName + ", checkChildState=" + checkChildState + "]";
	}

	

	
	
	
	
}
