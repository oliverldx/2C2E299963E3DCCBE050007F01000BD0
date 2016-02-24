package com.kaifa.authority.pojo;

public class RoleSysFunc {
    private String id;

    private String sysFuncCode;

    private String roleCode;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getSysFuncCode() {
        return sysFuncCode;
    }

    public void setSysFuncCode(String sysFuncCode) {
        this.sysFuncCode = sysFuncCode == null ? null : sysFuncCode.trim();
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode == null ? null : roleCode.trim();
    }
}