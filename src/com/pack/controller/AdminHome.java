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
import com.pack.beans.Admin;
import com.pack.beans.Student;

/**
 * Servlet implementation class AdminHome
 */
@WebServlet("/AdminHome")
public class AdminHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Integer index = 1;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminHome() {
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
		Admin ad = (Admin)session.getAttribute("userName");
		StudentDAO s=new StudentDAO();
		String flag = request.getParameter("flag");
		
		if(flag == null || ad == null) {
			response.sendRedirect("/CollegeAdmissionManagementSystem");
			return;
		}
		
		if(flag.equals("adminHome")) {
			List<Student> list = new ArrayList<>();
			list = s.getAllStudent("Confirm");
			List<Student> pendingList = new ArrayList<>();
			pendingList = s.getAllStudent("Pending");
			index = 1;
			request.setAttribute("index", index);
			request.setAttribute("list", list);
			request.setAttribute("pendingList", pendingList);
			request.getRequestDispatcher("/AdminHome.jsp").forward(request, response);
		}
		else if(flag.equals("confirm")) {
			Integer sid = Integer.parseInt(request.getParameter("sid"));
			int i = s.confirm(sid);
			if(i != 0) {
				Student stu = StudentDAO.getStudentById(sid);
				s.informStudent(stu);
			}
				
			List<Student> list = new ArrayList<>();
			list = s.getAllStudent("Confirm");
			List<Student> pendingList = new ArrayList<>();
			pendingList = s.getAllStudent("Pending");
			index = 2;
			request.setAttribute("index", index);
			request.setAttribute("list", list);
			request.setAttribute("pendingList", pendingList);
			request.getRequestDispatcher("/AdminHome.jsp").forward(request, response);
		}
		else if(flag.equals("reject")) {
			Integer sid = Integer.parseInt(request.getParameter("sid"));
			int i = s.removeStudent(sid);
			List<Student> list = new ArrayList<>();
			list = s.getAllStudent("Confirm");
			List<Student> pendingList = new ArrayList<>();
			pendingList = s.getAllStudent("Pending");
			index = 2;
			request.setAttribute("index", index);
			request.setAttribute("list", list);
			request.setAttribute("pendingList", pendingList);
			request.getRequestDispatcher("/AdminHome.jsp").forward(request, response);
		}
		else if(flag.equals("updatedetails")) {
			Integer id = Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			String name = request.getParameter("name");
			String contact = request.getParameter("contact");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			ad.setName(name);
			ad.setContact(contact);
			ad.setEmail(email);
			ad.setAddress(address);
			int i = s.updateAdmin(ad);
			if(i != 0) {
				session.setAttribute("userName", ad);
			}
			
			List<Student> list = new ArrayList<>();
			list = s.getAllStudent("Confirm");
			List<Student> pendingList = new ArrayList<>();
			pendingList = s.getAllStudent("Pending");
			index = 1;
			request.setAttribute("index", index);
			request.setAttribute("list", list);
			request.setAttribute("pendingList", pendingList);
			request.getRequestDispatcher("/AdminHome.jsp").forward(request, response);
			
		}
		else if(flag.equals("updatepassword")) {
			int i = 0;
			Integer id = Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			String oldpass = request.getParameter("oldpass");
			String newpass = request.getParameter("newpass");
			
			String pass = s.getAdminPassword(id);
			
			if(!oldpass.equals(pass)) {
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js'></script>");
				out.println("<script type=\"text/javascript\">");
				out.println("$(document).ready(function() {");
				out.println("alert('The password provided is wrong');");
				out.println("location='UpdateAdmin.jsp?update=password';");
				out.println("});");
				out.println("</script>");
				//response.sendRedirect("UpdateAdmin.jsp?update=password");
				return;
			}
			else {
				ad.setPassword(newpass);
				i = s.updateAdminPassword(ad);
			}
			if(i != 0) {
				session.setAttribute("userName", ad);
			}
			
			List<Student> list = new ArrayList<>();
			list = s.getAllStudent("Confirm");
			List<Student> pendingList = new ArrayList<>();
			pendingList = s.getAllStudent("Pending");
			index = 1;
			request.setAttribute("index", index);
			request.setAttribute("list", list);
			request.setAttribute("pendingList", pendingList);
			request.getRequestDispatcher("/AdminHome.jsp").forward(request, response);
			
		}
		else if(flag.equals("mail")) {
			String receipants = request.getParameter("receive");
			String subject = request.getParameter("subject");
			String msg = request.getParameter("message");
			if(receipants.equals("") || receipants == null) {
				receipants = s.getAllStudentEmails();
			}
			
			if(!receipants.equals("") && receipants != null) {
				String[] receivers = receipants.split(",|\\s");
				receipants = "";
				receipants += receivers[0].trim();
				for(int i = 1; i < receivers.length; i++) {
					if(!receivers[i].equals(""))
						receipants += "," + receivers[i].trim();
				}
			}
			//System.out.println(receipants);
			s.sendMails(receipants, subject, msg);
			
			List<Student> list = new ArrayList<>();
			list = s.getAllStudent("Confirm");
			List<Student> pendingList = new ArrayList<>();
			pendingList = s.getAllStudent("Pending");
			index = 1;
			request.setAttribute("index", index);
			request.setAttribute("list", list);
			request.setAttribute("pendingList", pendingList);
			request.getRequestDispatcher("/AdminHome.jsp").forward(request, response);
			
		}
		else if(flag.equals("viewConfirm")) {
			Integer sid = Integer.parseInt(request.getParameter("sid"));
			Student stud = StudentDAO.getStudentById(sid);
			
			String status = stud.getStatus();
			String tmp[] = status.split("\\s");
			List<String> actions = null;
			if(tmp.length > 1)
				actions = new ArrayList<>();
			for(int j = 1; j < tmp.length; j++)
				actions.add(tmp[j]);
			
			request.setAttribute("student", stud);
			request.setAttribute("status", tmp[0].trim());
			request.setAttribute("actions", actions);
			
			request.getRequestDispatcher("/ViewStudent.jsp").forward(request, response);
		}
		else if(flag.equals("viewPending")) {
			Integer sid = Integer.parseInt(request.getParameter("sid"));
			Student stud = StudentDAO.getStudentById(sid);
			
			request.setAttribute("student", stud);
			request.setAttribute("status", stud.getStatus());
			request.setAttribute("actions", null);
			
			request.getRequestDispatcher("/ViewStudent.jsp").forward(request, response);
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
