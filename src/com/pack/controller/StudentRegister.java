package com.pack.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pack.DAO.StudentDAO;
import com.pack.beans.Student;

/**
 * Servlet implementation class StudentRegister
 */
@WebServlet("/StudentRegister")
public class StudentRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentRegister() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int status=0;
		Student s=new Student();
		response.setContentType("text/html"); 
		String fname=request.getParameter("fname");  
		String lname=request.getParameter("lname");  
		int age=Integer.parseInt(request.getParameter("age"));  
		String gender=request.getParameter("gender");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		String dob=request.getParameter("dob");
		String address=request.getParameter("address");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		String zipcode=request.getParameter("zipcode");
		double p10=Double.parseDouble(request.getParameter("per10"));
		double p12=Double.parseDouble(request.getParameter("per12"));
		String password=request.getParameter("pass");
		String branch=request.getParameter("branch");
		String board10=request.getParameter("board10");
		String board12=request.getParameter("board12");
		s.setFirstname(fname);
		s.setLastname(lname);
		s.setAge(age);
		s.setGender(gender);
		s.setDob(dob);
		s.setAddress(address);
		s.setState(state);
		s.setCity(city);
		s.setZipcode(zipcode);
		s.setPer10(p10);
		s.setPer12(p12);
		s.setBranch_name(branch);
		s.setPassword(password);
		s.setBoard10(board10);
		s.setBoard12(board12);
		s.setEmail(email);
		s.setContact(contact);
		StudentDAO reg =new StudentDAO();
		status=reg.addStudent(s);
		int id =s.getId();
		if(status!=0) {
			request.setAttribute("stuid", id); 
			reg.informAdmin(s);
			out.println("Registration successful. You will be sent and email from us after confirmation of your registration<br><a href='/CollegeAdmissionManagementSystem'>Click here to go back</a>");
			/*request.getRequestDispatcher("/Home.jsp").forward(request, response);*/
		}
		else {
			out.println("Registration unsuccessful<br><a href='/CollegeAdmissionManagementSystem'>Click here to go back</a>");
			/*request.getRequestDispatcher("/AdminLogin.jsp").forward(request, response);*/
		}
	}

}
