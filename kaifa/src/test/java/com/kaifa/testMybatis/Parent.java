package com.kaifa.testMybatis;

public class Parent {
	String id;
	
	void convert(Object o) {
		System.out.println("-----parent------");
		Parent p = (Parent)o;
		p.setId("1");
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
}
