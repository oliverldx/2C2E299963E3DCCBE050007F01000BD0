package com.kaifa.testMybatis;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.kaifa.authority.pojo.FunctionTree;
import com.kaifa.authority.vo.FuncTreeVO;

public class TestSuper {

	public static void main(String[] args) {
		FunctionTree ft = new FunctionTree();
		ft.setParentFuncCode("p1");
		ft.setIcon("icom");
		ft.setFuncCode("1");
		ft.setMenuType("菜单");
		FuncTreeVO ftvo = new FuncTreeVO();
//		ftvo.convertFunctionTree(ftvo, ft);
//		System.out.println(JSON.toJSONString(ftvo));
		List<FunctionTree> ftList = new ArrayList<FunctionTree>();
		ftList.add(ft);
		List ftvoList =ftvo.convertFunctionTreeList( ftList);
		System.out.println(JSON.toJSONString(ftvoList));
	}

}
