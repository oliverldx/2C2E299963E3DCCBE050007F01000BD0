package com.kaifa.authority.pojo;

public class SysFuncTree {
    private String id;

    private String funcCode;

    private String sysFuncCode;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getFuncCode() {
        return funcCode;
    }

    public void setFuncCode(String funcCode) {
        this.funcCode = funcCode == null ? null : funcCode.trim();
    }

    public String getSysFuncCode() {
        return sysFuncCode;
    }

    public void setSysFuncCode(String sysFuncCode) {
        this.sysFuncCode = sysFuncCode == null ? null : sysFuncCode.trim();
    }
}