package com.kaifa.authority.pojo;

import java.util.Date;

public class Group {
    private String groupCode;

    private String groupName;

    private String groupParent;

    private String address;

    private String contact;

    private String fax;

    private String email;

    private String isEnable;

    private Date grpEnableDateBegin;

    private Date grpEnableDateEnd;

    private String insertUser;

    private Date insertDate;

    private String updateUser;

    private Date updateDate;

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode == null ? null : groupCode.trim();
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName == null ? null : groupName.trim();
    }

    public String getGroupParent() {
        return groupParent;
    }

    public void setGroupParent(String groupParent) {
        this.groupParent = groupParent == null ? null : groupParent.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact == null ? null : contact.trim();
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax == null ? null : fax.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getIsEnable() {
        return isEnable;
    }

    public void setIsEnable(String isEnable) {
        this.isEnable = isEnable == null ? null : isEnable.trim();
    }

    public Date getGrpEnableDateBegin() {
        return grpEnableDateBegin;
    }

    public void setGrpEnableDateBegin(Date grpEnableDateBegin) {
        this.grpEnableDateBegin = grpEnableDateBegin;
    }

    public Date getGrpEnableDateEnd() {
        return grpEnableDateEnd;
    }

    public void setGrpEnableDateEnd(Date grpEnableDateEnd) {
        this.grpEnableDateEnd = grpEnableDateEnd;
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