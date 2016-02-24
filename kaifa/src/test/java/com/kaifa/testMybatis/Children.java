package com.kaifa.testMybatis;

public class Children extends Parent{
	
	private  String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	void convert(Object o) {
		System.out.println("------children-------");
		super.convert(o);
		Children c = (Children)o;
		c.setName("sb");
	}
	
	
	
}
