package com.kaifa.authority.pojo;

public class FuncSetSysFunc {
    private String id;

    private String sysFuncCode;

    private String funcSetCode;

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

    public String getFuncSetCode() {
        return funcSetCode;
    }

    public void setFuncSetCode(String funcSetCode) {
        this.funcSetCode = funcSetCode == null ? null : funcSetCode.trim();
    }
}