package com.pack.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack.DAO.StudentDAO;
import com.pack.beans.Student;

/**
 * Servlet implementation class StudentHome
 */
@WebServlet("/StudentHome")
public class StudentHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentHome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		if(session == null) {
			response.sendRedirect("/CollegeAdmissionManagementSystem");
			return;
		}
		Student stu = (Student)session.getAttribute("userName");
		StudentDAO s=new StudentDAO();
		String flag = request.getParameter("flag");
		
		if(flag == null || stu == null) {
			response.sendRedirect("/CollegeAdmissionManagementSystem");
			return;
		}
		
		if(flag.equals("studentHome")) {
			/*System.out.println("TEST2");*/
			String arr[] = stu.getStatus().split(" ");
			List<String> status = new ArrayList<>();
			for(String str: arr) {
				status.add(str);
			}
			request.setAttribute("status", status);
			
			request.getRequestDispatcher("/StudentHome.jsp").forward(request, response);
		}
		else if(flag.equals("photo")) {
			Integer sid = Integer.parseInt(request.getParameter("sid"));
			int i = s.uploadPhoto(sid);
			if(i != 0) {
				stu = StudentDAO.getStudentById(sid);
				session.setAttribute("userName", stu);
			}
			String arr[] = stu.getStatus().split(" ");
			List<String> status = new ArrayList<>();
			for(String str: arr) {
				status.add(str);
			}
			request.setAttribute("status", status);
			
			request.getRequestDispatcher("/StudentHome.jsp").forward(request, response);
		}
		else if(flag.equals("aadhar")) {
			Integer sid = Integer.parseInt(request.getParameter("sid"));
			int i = s.uploadAadhar(sid);
			if(i != 0) {
				stu = StudentDAO.getStudentById(sid);
				session.setAttribute("userName", stu);
			}
			String arr[] = stu.getStatus().split(" ");
			List<String> status = new ArrayList<>();
			for(String str: arr) {
				status.add(str);
			}
			request.setAttribute("status", status);
			
			request.getRequestDispatcher("/StudentHome.jsp").forward(request, response);
		}
		else if(flag.equals("marksheet")) {
			Integer sid = Integer.parseInt(request.getParameter("sid"));
			int i = s.uploadMarksheet(sid);
			if(i != 0) {
				stu = StudentDAO.getStudentById(sid);
				session.setAttribute("userName", stu);
			}
			String arr[] = stu.getStatus().split(" ");
			List<String> status = new ArrayList<>();
			for(String str: arr) {
				status.add(str);
			}
			request.setAttribute("status", status);
			
			request.getRequestDispatcher("/StudentHome.jsp").forward(request, response);
		}
		else if(flag.equals("updatedetails")) {
			int i = 0;
			Integer sid = Integer.parseInt(request.getParameter("id"));
			
			System.out.println(sid);
			String email = request.getParameter("email");
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String contact = request.getParameter("contact");
			Integer age = Integer.parseInt(request.getParameter("age"));
			String address = request.getParameter("address");
			String state = request.getParameter("state");
			String city = request.getParameter("city");
			String zipcode = request.getParameter("zipcode");
			Double per10 = Double.parseDouble(request.getParameter("per10"));
			String board10 = request.getParameter("board10");
			Double per12 = Double.parseDouble(request.getParameter("per12"));
			String board12 = request.getParameter("board12");
			stu.setEmail(email);
			stu.setFirstname(fname);
			stu.setLastname(lname);
			stu.setContact(contact);
			stu.setAge(age);
			stu.setAddress(address);
			stu.setState(state);
			stu.setCity(city);
			stu.setZipcode(zipcode);
			stu.setPer10(per10);
			stu.setBoard10(board10);
			stu.setPer12(per12);
			stu.setBoard12(board12);
			i = s.updateStudent(stu);
			if(i != 0) {
				session.setAttribute("userName", stu);
			}
			
			String arr[] = stu.getStatus().split(" ");
			List<String> status = new ArrayList<>();
			for(String str: arr) {
				status.add(str);
			}
			request.setAttribute("status", status);
			
			request.getRequestDispatcher("/StudentHome.jsp").forward(request, response);
		}
		else if(flag.equals("updatepassword")) {
			int i = 0;
			Integer sid = Integer.parseInt(request.getParameter("id"));
			
			System.out.println(sid);
			String oldpass = request.getParameter("oldpass");
			String newpass = request.getParameter("newpass");
			
			String pass = s.getStudentPassword(sid);
			
			if(!oldpass.equals(pass)) {
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js'></script>");
				out.println("<script type=\"text/javascript\">");
				out.println("$(document).ready(function() {");
				out.println("alert('The password provided is wrong');");
				out.println("location='UpdateStudent.jsp?update=password';");
				out.println("});");
				out.println("</script>");
				//response.sendRedirect("UpdateStudent.jsp?update=password");
				return;
			}
			else {
				stu.setPassword(newpass);
				i = s.updateStudentPassword(stu);
			}
			if(i != 0) {
				session.setAttribute("userName", stu);
			}
			
			String arr[] = stu.getStatus().split(" ");
			List<String> status = new ArrayList<>();
			for(String str: arr) {
				status.add(str);
			}
			request.setAttribute("status", status);
			
			request.getRequestDispatcher("/StudentHome.jsp").forward(request, response);
		}
		else {
			out.println("Invalid Request<br><a href='/CollegeAdmissionManagementSystem'>Click here to go back</a>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
