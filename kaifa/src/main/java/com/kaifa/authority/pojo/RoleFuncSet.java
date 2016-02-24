package com.kaifa.authority.pojo;

public class RoleFuncSet {
    private String id;

    private String funcSetCode;

    private String roleCode;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getFuncSetCode() {
        return funcSetCode;
    }

    public void setFuncSetCode(String funcSetCode) {
        this.funcSetCode = funcSetCode == null ? null : funcSetCode.trim();
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode == null ? null : roleCode.trim();
    }
}