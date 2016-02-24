package com.kaifa.authority.pojo;

import java.util.Date;

public class SystemFunction {
    private String sysFuncCode;

    private String sysFuncName;

    private String isEnable;

    private String insertUser;

    private Date insertDate;

    private String updateUser;

    private Date updateDate;

    public String getSysFuncCode() {
        return sysFuncCode;
    }

    public void setSysFuncCode(String sysFuncCode) {
        this.sysFuncCode = sysFuncCode == null ? null : sysFuncCode.trim();
    }

    public String getSysFuncName() {
        return sysFuncName;
    }

    public void setSysFuncName(String sysFuncName) {
        this.sysFuncName = sysFuncName == null ? null : sysFuncName.trim();
    }

    public String getIsEnable() {
        return isEnable;
    }

    public void setIsEnable(String isEnable) {
        this.isEnable = isEnable == null ? null : isEnable.trim();
    }

    public String getInsertUser() {
        return insertUser;
    }

    public void setInsertUser(String insertUser) {
        this.insertUser = insertUser == null ? null : insertUser.trim();
    }

    public Date getInsertDate() {
        return insertDate;
    }

    public void setInsertDate(Date insertDate) {
        this.insertDate = insertDate;
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser == null ? null : updateUser.trim();
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}