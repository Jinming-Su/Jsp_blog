package com.sjming.model;

public class CatalogVO {
	
	private int clid;
	private int id;
	private String name;
	private String child1;
	private String child2;
	private String child3;
	private String child4;
	private String child5;
	
	public CatalogVO(int clid, int id, String name, String child1, String child2, String child3, String child4,
			String child5) {
		super();
		this.clid = clid;
		this.id = id;
		this.name = name;
		this.child1 = child1;
		this.child2 = child2;
		this.child3 = child3;
		this.child4 = child4;
		this.child5 = child5;
	}
	public CatalogVO(int id, String name, String child1, String child2, String child3, String child4, String child5) {
		super();
		this.id = id;
		this.name = name;
		this.child1 = child1;
		this.child2 = child2;
		this.child3 = child3;
		this.child4 = child4;
		this.child5 = child5;
	}
	public CatalogVO() {
		super();
	}
	
	public int getClid() {
		return clid;
	}
	public void setClid(int clid) {
		this.clid = clid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getChild1() {
		return child1;
	}
	public void setChild1(String child1) {
		this.child1 = child1;
	}
	public String getChild2() {
		return child2;
	}
	public void setChild2(String child2) {
		this.child2 = child2;
	}
	public String getChild3() {
		return child3;
	}
	public void setChild3(String child3) {
		this.child3 = child3;
	}
	public String getChild4() {
		return child4;
	}
	public void setChild4(String child4) {
		this.child4 = child4;
	}
	public String getChild5() {
		return child5;
	}
	public void setChild5(String child5) {
		this.child5 = child5;
	}
	
}
