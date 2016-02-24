package com.kaifa.authority.pojo;

import java.util.Date;

public class FunctionTree {
    private String funcCode;

    private String funcName;

    private String parentFuncCode;
    
    private String icon;
    
	private String menuType;

    private String menu;

    private Integer menuSerial;

    private String isEnable;

    private String insertUser;

    private Date insertDate;

    private String updateUser;

    private Date updateDate;

    public String getFuncCode() {
        return funcCode;
    }

    public void setFuncCode(String funcCode) {
        this.funcCode = funcCode == null ? null : funcCode.trim();
    }

    public String getFuncName() {
        return funcName;
    }

    public void setFuncName(String funcName) {
        this.funcName = funcName == null ? null : funcName.trim();
    }

    public String getMenuType() {
        return menuType;
    }

    public void setMenuType(String menuType) {
        this.menuType = menuType == null ? null : menuType.trim();
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu == null ? null : menu.trim();
    }

    public Integer getMenuSerial() {
        return menuSerial;
    }

    public void setMenuSerial(Integer menuSerial) {
        this.menuSerial = menuSerial;
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
	public String getParentFuncCode() {
		return parentFuncCode;
	}
	public void setParentFuncCode(String parentFuncCode) {
		this.parentFuncCode = parentFuncCode;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
}