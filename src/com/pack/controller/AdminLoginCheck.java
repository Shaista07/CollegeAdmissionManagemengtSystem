package com.pack.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack.DAO.StudentDAO;
import com.pack.beans.Admin;
import com.pack.beans.Student;

/**
 * Servlet implementation class AdminLoginCheck
 */
@WebServlet("/AdminLoginCheck")
public class AdminLoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int otp = 0;
	private String user = "";
       
    public AdminLoginCheck() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		String flag = request.getParameter("flag");
		StudentDAO login=new StudentDAO();
		if(flag.equals("login")) {
			Integer uname=Integer.parseInt(request.getParameter("uname"));
			String pass= request.getParameter("pass");
			String user=request.getParameter("user");
			Student stu = new Student();
			Admin admin=new Admin();
			if(user.equals("admin")) {
				Admin a=new Admin();
				admin.setId(uname);
				admin.setPassword(pass);
				a=StudentDAO.adminDetailsById(uname);
				boolean status=login.loginAdmin(admin);
				if(status) {
					 session.setAttribute("userName", a); 
					 request.getRequestDispatcher("AdminHome?flag=adminHome").forward(request, response);
				}
				else {
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js'></script>");
					out.println("<script type=\"text/javascript\">");
					out.println("$(document).ready(function() {");
					out.println("alert('The credentials provided are wrong');");
					out.println("location='/CollegeAdmissionManagementSystem';");
					out.println("});");
					out.println("</script>");
					return;
					 /*request.setAttribute("incorrect", true);
					 request.getRequestDispatcher("/").forward(request, response);*/
				}
			}
			else {
				stu.setId(uname);
				stu.setPassword(pass);
				Student s =new Student();
				s = StudentDAO.getStudentById(uname);
				boolean stu_status=login.loginStudent(stu);
				if(stu_status) {
					session.setAttribute("userName", s);
					request.getRequestDispatcher("StudentHome?flag=studentHome").forward(request, response);
				}
				else {
					out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js'></script>");
					out.println("<script type=\"text/javascript\">");
					out.println("$(document).ready(function() {");
					out.println("alert('The credentials provided are wrong');");
					out.println("location='/CollegeAdmissionManagementSystem';");
					out.println("});");
					out.println("</script>");
					return;
					/*request.setAttribute("incorrect", true);
					request.getRequestDispatcher("/").forward(request, response);*/
				}
			}
		}
		else if(flag.equals("resetPassword")) {
			Random r = new Random();
			int i = 0;
			otp = r.nextInt(900000) + 100000;
			
			user = request.getParameter("user");
			Integer id = Integer.parseInt(request.getParameter("id"));
			
			i = login.verifyId(user, id);
			if(i == 0 || i > 1) {
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js'></script>");
				out.println("<script type=\"text/javascript\">");
				out.println("$(document).ready(function() {");
				out.println("alert('The id provided is invalid');");
				out.println("location='/CollegeAdmissionManagementSystem';");
				out.println("});");
				out.println("</script>");
				//response.sendRedirect("/CollegeAdmissionManagementSystem");
				return;
			}
			else {
				String email = login.getEmail(user, id);
				login.sendOTP(otp, email);
				
				request.setAttribute("id", id);
				System.out.println(otp);
				//request.setAttribute("otp", otp);
				request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
				
			}
		}
		else if(flag.equals("changePassword")) {
			System.out.println(otp + " " + user);
			Integer id = Integer.parseInt(request.getParameter("id"));
			int newOtp = Integer.parseInt(request.getParameter("otp"));
			String newpass = request.getParameter("newpass");
			if(otp != newOtp) {
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js'></script>");
				out.println("<script type=\"text/javascript\">");
				out.println("$(document).ready(function() {");
				out.println("alert('Wrong OTP');");
				out.println("location='/CollegeAdmissionManagementSystem/ForgotPassword.jsp';");
				out.println("});");
				out.println("</script>");
				//response.sendRedirect("/CollegeAdmissionManagementSystem/ForgotPassword.jsp");
				return;
			}
			else {
				if(user.equalsIgnoreCase("admin")) {
					Admin a = StudentDAO.adminDetailsById(id);
					a.setPassword(newpass);
					int i = login.updateAdminPassword(a);
					if(i == 1) {
						out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js'></script>");
						out.println("<script type=\"text/javascript\">");
						out.println("$(document).ready(function() {");
						out.println("alert('Password successfully updated');");
						out.println("location='/CollegeAdmissionManagementSystem';");
						out.println("});");
						out.println("</script>");
						return;
					}
					else {
						out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js'></script>");
						out.println("<script type=\"text/javascript\">");
						out.println("$(document).ready(function() {");
						out.println("alert('Password could not be updated. Try again later');");
						out.println("location='/CollegeAdmissionManagementSystem';");
						out.println("});");
						out.println("</script>");
						return;
					}
				}
				if(user.equalsIgnoreCase("student")) {
					Student student = StudentDAO.getStudentById(id);
					student.setPassword(newpass);
					int i = login.updateStudentPassword(student);
					if(i == 1) {
						out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js'></script>");
						out.println("<script type=\"text/javascript\">");
						out.println("$(document).ready(function() {");
						out.println("alert('Password successfully updated');");
						out.println("location='/CollegeAdmissionManagementSystem';");
						out.println("});");
						out.println("</script>");
						return;
					}
					else {
						out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js'></script>");
						out.println("<script type=\"text/javascript\">");
						out.println("$(document).ready(function() {");
						out.println("alert('Password could not be updated. Try again later');");
						out.println("location='/CollegeAdmissionManagementSystem';");
						out.println("});");
						out.println("</script>");
						return;
					}
				}
			}
		}
		else {
			out.println("Invalid Request<br><a href='/CollegeAdmissionManagementSystem'>Click here to go back</a>");
		}
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
