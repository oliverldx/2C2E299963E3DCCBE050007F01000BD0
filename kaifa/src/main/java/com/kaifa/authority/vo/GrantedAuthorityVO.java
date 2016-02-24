package com.kaifa.authority.vo;

import java.util.List;

/**
 * 
 * <pre>
 * 用户权限数据
 * </pre>
 */
public class GrantedAuthorityVO implements org.springframework.security.core.GrantedAuthority {
	
	private static final long serialVersionUID = 474225153669562397L;

	private String roleId;
	
	private List<Tree> trees;
	
	//hzz
	private String menuid;
	private String icon;
	private String menuname;
	private String menus;
	private String url;
	
	//
	
	public GrantedAuthorityVO(String roleId,List<Tree> trees){
		this.roleId = roleId;
		this.trees = trees;
	}
	/* (non-Javadoc)
	 * @see org.springframework.security.core.GrantedAuthority#getAuthority()
	 */
	@Override
	public String getAuthority() {
		return this.roleId;
	}
	
	public List<Tree> getRoleTrees(){
		return this.trees;
	}
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
	public String getMenus() {
		return menus;
	}
	public void setMenus(String menus) {
		this.menus = menus;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	//hzz
	
}
