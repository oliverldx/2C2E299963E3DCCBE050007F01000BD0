package com.kaifa.pojo;

public class Page {
	
	private int pageNow = 1; // 当前页数
	private int pageSize = 10; // 每页显示记录的条数
	
	
	
    private int total;//总条数

    private Object rows;//返回的json
    

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Object getRows() {
		return rows;
	}

	public void setRows(Object rows) {
		this.rows = rows;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

   
    
}