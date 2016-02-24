package com.kaifa.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kaifa.authority.captcha.ICaptchaHolder;
import com.kaifa.authority.service.ILoginAccountService;
import com.kaifa.authority.vo.MenuVO;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@Resource
	private ILoginAccountService loginAccountService;
	@Autowired
	private ICaptchaHolder captchaHolder;

	@RequestMapping(value = "/menu")
	public String login() {
		return "menu/menu";
	}

	@RequestMapping(value = "/getMenuData")
	public @ResponseBody
	Map<String, Object> getMenuData(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> ret = new HashMap<String, Object>();
		List<MenuVO> list = new ArrayList<MenuVO>();
		List<MenuVO> listMenu = new ArrayList<MenuVO>();
		
		return ret;
	}

	@RequestMapping(value = "/getMenuData2")
	public @ResponseBody
	Map<String, Object> getMenuData2(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> ret = new HashMap<String, Object>();
		List<MenuVO> list = new ArrayList<MenuVO>();
		List<MenuVO> listMenu = new ArrayList<MenuVO>();

		List Menuname = Arrays.asList(new String[] { "菜单管理", "用户角色管理",
				"用户权限管理", "权限设置", "用户列表" });
		for (int i = 0; i < Menuname.size(); i++) {
			MenuVO menu = new MenuVO();
			String menuId = "1" + i + "";
			menu.setMenuid(menuId);
			menu.setMenuname(Menuname.get(i).toString());
			menu.setIcon("icon-nav");
			if (i == 4) {
				menu.setUrl("../user/listUser.do");
			} else if (i == 3) {
				menu.setUrl("../user/tree.do");
			} else {
				menu.setUrl("#");
			}

			list.add(menu);
		}
		MenuVO menulist = new MenuVO();
		menulist.setMenuid("1");
		menulist.setMenuname("系统设置");
		menulist.setIcon("icon-sys");
		menulist.setMenus(list);
		listMenu.add(menulist);

		ret.put("basic", listMenu);
		// 222
		listMenu = new ArrayList<MenuVO>();

		list = new ArrayList<MenuVO>();
		Menuname = Arrays.asList(new String[] { "年龄分类", "视频分类" });
		for (int i = 0; i < Menuname.size(); i++) {
			MenuVO menu = new MenuVO();
			String menuId = "3" + i + "";
			menu.setMenuid(menuId);
			menu.setMenuname(Menuname.get(i).toString());
			menu.setIcon("icon-nav");
			if (i == 1) {
				menu.setUrl("../video/videoGroup.do");
			} else {
				menu.setUrl("../video/videoAvg.do");
			}
			list.add(menu);
		}
		menulist = new MenuVO();
		menulist.setMenuid("3");
		menulist.setMenuname("视频分类");
		menulist.setIcon("icon-sys");
		menulist.setMenus(list);
		listMenu.add(menulist);

		list = new ArrayList<MenuVO>();
		Menuname = Arrays.asList(new String[] { "视频管理", "视频列表", "用户视频收藏",
				"观看历史表", "评论表" });
		for (int i = 0; i < Menuname.size(); i++) {
			MenuVO menu = new MenuVO();
			String menuId = "4" + i + "";
			menu.setMenuid(menuId);
			menu.setMenuname(Menuname.get(i).toString());
			menu.setIcon("icon-nav");
			if (i == 1) {
				menu.setUrl("../video/videoList.do");
			} else if (i == 2) {
				menu.setUrl("../video/videoCollectList.do");
			} else if (i == 3) {
				menu.setUrl("../video/videoHistoryList.do");
			} else if (i == 4) {
				menu.setUrl("../video/videoCommentList.do");
			} else {
				menu.setUrl("#");
			}
			list.add(menu);
		}
		menulist = new MenuVO();
		menulist.setMenuid("4");
		menulist.setMenuname("视频管理");
		menulist.setIcon("icon-sys");
		menulist.setMenus(list);
		listMenu.add(menulist);
		ret.put("point", listMenu);
		// 333教育管理
		listMenu = new ArrayList<MenuVO>();

		list = new ArrayList<MenuVO>();
		Menuname = Arrays.asList(new String[] { "学科分类表", "资源分类表", "管理教育资源" });
		for (int i = 0; i < Menuname.size(); i++) {
			MenuVO menu = new MenuVO();
			String menuId = "5" + i + "";
			menu.setMenuid(menuId);
			menu.setMenuname(Menuname.get(i).toString());
			menu.setIcon("icon-nav");
			if (i == 1) {
				menu.setUrl("../education/eduClass.do");
			} else {
				menu.setUrl("../education/eduSubject.do");
			}
			list.add(menu);
		}
		menulist = new MenuVO();
		menulist.setMenuid("5");
		menulist.setMenuname("教育资源管理");
		menulist.setIcon("icon-sys");
		menulist.setMenus(list);
		listMenu.add(menulist);

		ret.put("education", listMenu);

		return ret;

	}

}