package com.kaifa.authority.pojo;

import java.util.Date;

public class LoginAccount {
    private String accountCode;

    private String userCode;

    private String password;

    private Date pwdEnableDateBegin;

    private Date pwdEnableDateEnd;

    private String insertUser;

    private Date insertDate;

    private String updateUser;

    private Date updateDate;

    public String getAccountCode() {
        return accountCode;
    }

    public void setAccountCode(String accountCode) {
        this.accountCode = accountCode == null ? null : accountCode.trim();
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode == null ? null : userCode.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Date getPwdEnableDateBegin() {
        return pwdEnableDateBegin;
    }

    public void setPwdEnableDateBegin(Date pwdEnableDateBegin) {
        this.pwdEnableDateBegin = pwdEnableDateBegin;
    }

    public Date getPwdEnableDateEnd() {
        return pwdEnableDateEnd;
    }

    public void setPwdEnableDateEnd(Date pwdEnableDateEnd) {
        this.pwdEnableDateEnd = pwdEnableDateEnd;
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