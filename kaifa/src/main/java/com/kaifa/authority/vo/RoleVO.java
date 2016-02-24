package com.kaifa.authority.vo;

import com.kaifa.pojo.Page;

public class RoleVO extends Page{

	private String roleCode;
	private String roleName;
	private String roleJobDesc;
	private String isEnable;
	
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleJobDesc() {
		return roleJobDesc;
	}
	public void setRoleJobDesc(String roleJobDesc) {
		this.roleJobDesc = roleJobDesc;
	}
	public String getIsEnable() {
		return isEnable;
	}
	public void setIsEnable(String isEnable) {
		this.isEnable = isEnable;
	}
	
}
