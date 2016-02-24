package com.kaifa.authority.pojo;

import java.util.Date;

public class UserDegree {
    private String degreeCode;

    private String userCode;

    private String degreeName;

    private Date dgrEnableDateBegin;

    private Date dgrEnableDateEnd;

    private String groupCode;

    private String isEnable;

    private String insertUser;

    private Date insertDate;

    private String updateUser;

    private Date updateDate;

    public String getDegreeCode() {
        return degreeCode;
    }

    public void setDegreeCode(String degreeCode) {
        this.degreeCode = degreeCode == null ? null : degreeCode.trim();
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode == null ? null : userCode.trim();
    }

    public String getDegreeName() {
        return degreeName;
    }

    public void setDegreeName(String degreeName) {
        this.degreeName = degreeName == null ? null : degreeName.trim();
    }

    public Date getDgrEnableDateBegin() {
        return dgrEnableDateBegin;
    }

    public void setDgrEnableDateBegin(Date dgrEnableDateBegin) {
        this.dgrEnableDateBegin = dgrEnableDateBegin;
    }

    public Date getDgrEnableDateEnd() {
        return dgrEnableDateEnd;
    }

    public void setDgrEnableDateEnd(Date dgrEnableDateEnd) {
        this.dgrEnableDateEnd = dgrEnableDateEnd;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode == null ? null : groupCode.trim();
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