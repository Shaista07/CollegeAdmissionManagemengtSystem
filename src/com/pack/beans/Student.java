package com.pack.beans;


public class Student {

		private Integer id;
		private String firstname;
		private String lastname;
		private Integer age;
		private String gender;
		private String dob;
		private String contact;
		private String email;
		private String password;
		private String address;
		private String state;
		private String city;
		private String zipcode;
		private Double per10;
		private Double per12;
		private String branch_name;
		private String status;
		private String paid;
		private String board10;
		private String board12;
		
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getPaid() {
			return paid;
		}
		public void setPaid(String paid) {
			this.paid = paid;
		}
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getFirstname() {
			return firstname;
		}
		public void setFirstname(String firstname) {
			this.firstname = firstname;
		}
		public String getLastname() {
			return lastname;
		}
		public void setLastname(String lastname) {
			this.lastname = lastname;
		}
		public Integer getAge() {
			return age;
		}
		public void setAge(Integer age) {
			this.age = age;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public String getDob() {
			return dob;
		}
		public void setDob(String dob) {
			this.dob = dob;
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
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public String getCity() {
			return city;
		}
		public void setCity(String city) {
			this.city = city;
		}
		public String getZipcode() {
			return zipcode;
		}
		public void setZipcode(String zipcode) {
			this.zipcode = zipcode;
		}
		public Double getPer10() {
			return per10;
		}
		public void setPer10(Double per10) {
			this.per10 = per10;
		}
		public Double getPer12() {
			return per12;
		}
		public void setPer12(Double per12) {
			this.per12 = per12;
		}
		public String getBranch_name() {
			return branch_name;
		}
		public void setBranch_name(String branch_name) {
			this.branch_name = branch_name;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public Student() {
			super();
			// TODO Auto-generated constructor stub
		}
		public String getBoard10() {
			return board10;
		}
		public void setBoard10(String board10) {
			this.board10 = board10;
		}
		public String getBoard12() {
			return board12;
		}
		public void setBoard12(String board12) {
			this.board12 = board12;
		}
		public Student(Integer id, String firstname, String lastname, Integer age, String gender, String dob,
				String contact, String email, String password, String address, String state, String city,
				String zipcode, Double per10, Double per12, String branch_name, String status, String paid,
				String board10, String board12) {
			super();
			this.id = id;
			this.firstname = firstname;
			this.lastname = lastname;
			this.age = age;
			this.gender = gender;
			this.dob = dob;
			this.contact = contact;
			this.email = email;
			this.password = password;
			this.address = address;
			this.state = state;
			this.city = city;
			this.zipcode = zipcode;
			this.per10 = per10;
			this.per12 = per12;
			this.branch_name = branch_name;
			this.status = status;
			this.paid = paid;
			this.board10 = board10;
			this.board12 = board12;
		}
		
	
		
		
		

}
