package com.kaifa.authority.vo;

import java.util.List;

/**
 * 
 * <pre>
 * 用户权限数据
 * </pre>
 */
public class MenuVO implements org.springframework.security.core.GrantedAuthority {

	
	private static final long serialVersionUID = 1L;
	
	private String menuid;
	private String icon;
	private String menuname;
	private List<MenuVO> menus;
	private String url;
	private int sortIndex;
	
	public String getMenuid() {
		return menuid;
	}
	public void setMenuid(String menuid) {
		this.menuid = menuid;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getMenuname() {
		return menuname;
	}
	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String getAuthority() {
		// TODO Auto-generated method stub
		return null;
	}
	public List<MenuVO> getMenus() {
		return menus;
	}
	public void setMenus(List<MenuVO> menus) {
		this.menus = menus;
	}
	public int getSortIndex() {
		return sortIndex;
	}
	public void setSortIndex(int sortIndex) {
		this.sortIndex = sortIndex;
	}
	
}
