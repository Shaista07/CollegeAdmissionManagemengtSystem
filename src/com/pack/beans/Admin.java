package com.pack.beans;

public class Admin {
	private Integer id;
	private String password;
	private String name;
	private String contact;
	private String email;
	private String designation;
	private String address;
	
	
	
	public Admin(Integer id, String password, String name, String contact, String email, String designation,
			String address) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.contact = contact;
		this.email = email;
		this.designation = designation;
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Admin(Integer id, String password) {
		super();
		this.id = id;
		this.password = password;
	}
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	

}
