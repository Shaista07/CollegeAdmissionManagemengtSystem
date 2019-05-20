package com.pack.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.pack.Util.DBUtil;
import com.pack.beans.Admin;
import com.pack.beans.Student;

public class StudentDAO {

	public boolean loginAdmin(Admin login) {
		boolean status=false;  
		try{  
		Connection con=DBUtil.getConnection();  
		PreparedStatement ps=con.prepareStatement(  "select id,password from admin_login where id=? and password=?");  
		ps.setInt(1,login.getId());  
		ps.setString(2,login.getPassword());  
		ResultSet rs=ps.executeQuery();  
		status=rs.next();  
		}
		catch(Exception e){System.out.println(e);}  
		return status;  
		}  
	
	public static Admin adminDetailsById(int id) {
		Admin a = new Admin();
		try{  
		Connection con=DBUtil.getConnection();  
		PreparedStatement ps=con.prepareStatement(  "select id,name,contact,email,designation,address from admin_login where id=?");  
		ps.setInt(1,id);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			a.setId(rs.getInt(1));
			a.setName(rs.getString(2));
			a.setContact(rs.getString(3));
			a.setEmail(rs.getString(4));
			a.setDesignation(rs.getString(5));
			a.setAddress(rs.getString(6));
		}
		con.close();
	}catch(Exception ex){System.out.println(ex);}
	
	return a;
		
		}  
	
	
	public int updateAdmin(Admin ad) {
		int i = 0;
		try { 
			Connection con = DBUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("update admin_login set name=?, contact=?, email=?, address=? where id=?");
			ps.setString(1, ad.getName());
			ps.setString(2, ad.getContact());
			ps.setString(3, ad.getEmail());
			ps.setString(4, ad.getAddress());
			ps.setInt(5, ad.getId());
			i = ps.executeUpdate();
			con.close();
		}
		catch(Exception e) {System.out.println(e);}
		
		return i;
	}
	
	
	public String getAdminPassword(Integer id) {
		String pass = "";
		try { 
			Connection con = DBUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("select password from admin_login where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				pass = rs.getString("password");
			}
			
			con.close();
		}
		catch(Exception e) {System.out.println(e);}
		
		return pass;
	}
	
	public int updateAdminPassword(Admin ad) {
		int i = 0;
		try { 
			Connection con = DBUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("update admin_login set password=? where id=?");
			ps.setString(1, ad.getPassword());
			ps.setInt(2, ad.getId());
			i = ps.executeUpdate();
			con.close();
		}
		catch(Exception e) {System.out.println(e);}
		
		return i;
	}
	
	

	public boolean loginStudent(Student login) {
		boolean status=false;  
		try{  
			Connection con=DBUtil.getConnection();  
			PreparedStatement ps=con.prepareStatement(  "select * from student where student_id=? and password=?");  
		ps.setInt(1,login.getId());  
		ps.setString(2,login.getPassword());  
		      
		ResultSet rs=ps.executeQuery();  
		status=rs.next();  
		          
		}catch(Exception e){System.out.println(e);}  
		return status;  
		}  

	public List<Student> getAllStudent(String status) {
		List<Student> list=null;
		try{
			list=new ArrayList<Student>();
			Connection con=DBUtil.getConnection();
			PreparedStatement ps=con.prepareStatement("select student_id,firstname,lastname,gender,dob,age,email,contact,address,state,city,zip_code,per10,per12,branch_name,status,paid,board10,board12 from student where status LIKE ?");
			ps.setString(1, status + "%");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Student s=new Student();
				s.setId(rs.getInt(1));
				s.setFirstname(rs.getString(2));
				s.setLastname(rs.getString(3));
				s.setGender(rs.getString(4));
				s.setDob(rs.getString(5));
				s.setAge(rs.getInt(6));
				s.setEmail(rs.getString(7));
				s.setContact(rs.getString(8));
				s.setAddress(rs.getString(9));
				s.setState(rs.getString(10));
				s.setCity(rs.getString(11));
				s.setZipcode(rs.getString(12));
				s.setPer10(rs.getDouble(13));
				s.setPer12(rs.getDouble(14));
				s.setBranch_name(rs.getString(15));
				s.setStatus(rs.getString(16));
				s.setPaid(rs.getString(17));
				s.setBoard10(rs.getString(18));
				s.setBoard12(rs.getString(19));
				list.add(s);
			}
			con.close();
		}catch(Exception ex){System.out.println(ex);}
		
		return list;
	}
	public static Student getStudentById(int id){
		Student bean=new Student();
		try{
			Connection con=DBUtil.getConnection();
			PreparedStatement ps=con.prepareStatement("select student_id,firstname,lastname,gender,contact,paid,branch_name,state,city,per10,per12,board10,board12,email,password,status,age,address,dob,zip_code from student where student_id=?");
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				bean.setId(rs.getInt(1));
				bean.setFirstname(rs.getString(2));
				bean.setLastname(rs.getString(3));
				bean.setGender(rs.getString(4));
				bean.setContact(rs.getString(5));
				bean.setPaid(rs.getString(6));         
				bean.setBranch_name(rs.getString(7));
				bean.setState(rs.getString(8));
				bean.setCity(rs.getString(9));
				bean.setPer10(rs.getDouble(10));
				bean.setPer12(rs.getDouble(11));
				bean.setBoard10(rs.getString(12));
				bean.setBoard12(rs.getString(13));
				bean.setEmail(rs.getString(14));
				bean.setPassword(rs.getString(15));
				bean.setStatus(rs.getString(16));
				bean.setAge(rs.getInt(17));
				bean.setAddress(rs.getString(18));
				bean.setDob(rs.getString(19));
				bean.setZipcode(rs.getString(20));
			}
			con.close();
		}catch(Exception ex){System.out.println(ex);}
		
		return bean;
	}
	
	public int confirm(Integer sid) {
		int i = 0;
		try {
			Connection con = DBUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("update student set status='Confirm' where student_id=?");
			ps.setInt(1, sid);
			i = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return i;
	}
	
	public int removeStudent(Integer sid) {
		int status=0;
		try{
			Connection con=DBUtil.getConnection();
			PreparedStatement ps=con.prepareStatement("delete from student where student_id=?");
			ps.setInt(1,sid);
			status=ps.executeUpdate();
			con.close();
		}catch(Exception ex){System.out.println(ex);}
		return status;
		
	}

	public int addStudent(Student s) {
			int status=0;
			try{
				Connection con=DBUtil.getConnection();
				PreparedStatement ps=con.prepareStatement("insert into student(student_id,firstname,lastname,gender,dob,age,email,contact,address,state,city,zip_code,per10,per12,branch_name,password,status,paid,board10,board12) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				int num = 0;
				if (s.getId()==null) {
					Random r = new Random();
					num = r.nextInt(9000000) + 1000000;
					s.setId(num);
				}
				ps.setInt(1,s.getId());
				ps.setString(2,s.getFirstname());
				ps.setString(3,s.getLastname());
				ps.setString(4,s.getGender());
				ps.setString(5,s.getDob());
				ps.setInt(6,s.getAge());
				ps.setString(7,s.getEmail());
				ps.setString(8,s.getContact());
				ps.setString(9,s.getAddress());
				ps.setString(10,s.getState());
				ps.setString(11,s.getCity());
				ps.setString(12,s.getZipcode());
				ps.setDouble(13,s.getPer10());
				ps.setDouble(14,s.getPer12());
				ps.setString(15,s.getBranch_name());
				ps.setString(16,s.getPassword());
				ps.setString(17,"Pending");
				ps.setString(18,"Unpaid");
				ps.setString(19,s.getBoard10());
				ps.setString(20,s.getBoard12());
				status=ps.executeUpdate();
				con.close();
			}catch(Exception ex){System.out.println(ex);}
			return status;
		}
		

	public int updateStudent(Student s) {
		int status=0;
		try{
			Connection con=DBUtil.getConnection();
			PreparedStatement ps=con.prepareStatement("update student set firstname=?,lastname=?,gender=?,dob=?,age=?,email=?,contact=?,address=?,state=?,city=?,zip_code=?,per10=?,per12=? where student_id=?");
			ps.setString(1,s.getFirstname());
			ps.setString(2,s.getLastname());
			ps.setString(3,s.getGender());
			ps.setString(4,s.getDob());
			ps.setInt(5,s.getAge());
			ps.setString(6,s.getEmail());
			ps.setString(7,s.getContact());
			ps.setString(8,s.getAddress());
			ps.setString(9,s.getState());
			ps.setString(10,s.getCity());
			ps.setString(11,s.getZipcode());
			ps.setDouble(12,s.getPer10());
			ps.setDouble(13,s.getPer12());
			ps.setInt(14,s.getId());

			status=ps.executeUpdate();
			con.close();
		}catch(Exception ex){System.out.println(ex);}
		return status;
		
	}
	
	
	public String getAllStudentEmails() {
		String rec = "";
		try {
			Connection con = DBUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("Select email from student where status LIKE 'Confirm%'");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				rec += rs.getString("email") + ",";
			}
		}
		catch(Exception e) {System.out.println(e);}
		return rec;
	}
	
	public int uploadPhoto(Integer sid) {
		int i = 0;
		try {
			Connection con = DBUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("update student set status=concat(status,' photo') where student_id=?");
			ps.setInt(1, sid);
			i = ps.executeUpdate();
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return i;
	}
	
	public int uploadAadhar(Integer sid) {
		int i = 0;
		try {
			Connection con = DBUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("update student set status=concat(status,' aadhar') where student_id=?");
			ps.setInt(1, sid);
			i = ps.executeUpdate();
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return i;
	}
	
	public int uploadMarksheet(Integer sid) {
		int i = 0;
		try {
			Connection con = DBUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("update student set status=concat(status,' marksheet') where student_id=?");
			ps.setInt(1, sid);
			i = ps.executeUpdate();
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return i;
	}
	
	
	public String getStudentPassword(Integer sid) {
		String pass = "";
		try { 
			Connection con = DBUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("select password from student where student_id=?");
			ps.setInt(1, sid);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				pass = rs.getString("password");
			}
			
			con.close();
		}
		catch(Exception e) {System.out.println(e);}
		
		return pass;
	}
	
	public int updateStudentPassword(Student stu) {
		int i = 0;
		try { 
			Connection con = DBUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("update student set password=? where student_id=?");
			ps.setString(1, stu.getPassword());
			ps.setInt(2, stu.getId());
			i = ps.executeUpdate();
			con.close();
		}
		catch(Exception e) {System.out.println(e);}
		
		return i;
	}
	
	
	
	
	public int verifyId(String user, Integer id) {
		int i = 0;
		try {
			Connection con = DBUtil.getConnection();
			PreparedStatement ps = null;
			if(user.equalsIgnoreCase("admin"))
				ps = con.prepareStatement("select email from admin_login where id=?");
			if(user.equalsIgnoreCase("student"))
				ps = con.prepareStatement("select email from student where student_id=?");
			if(ps != null) {
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
					i++;
			}
			
		}
		catch(Exception e) {System.out.println(e);}
		
		return i;
	}
	
	public String getEmail(String user, Integer id) {
		String email = null;
		try {
			Connection con = DBUtil.getConnection();
			PreparedStatement ps = null;
			if(user.equalsIgnoreCase("admin"))
				ps = con.prepareStatement("select email from admin_login where id=?");
			if(user.equalsIgnoreCase("student"))
				ps = con.prepareStatement("select email from student where student_id=?");
			if(ps != null) {
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				if(rs.next())
					email = rs.getString("email");
			}
			
		}
		catch(Exception e) {System.out.println(e);}
		
		return email;
	}
	
	
	
	public void informAdmin(Student user)
	{
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465"); 
		javax.mail.Session session = javax.mail.Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("ChoHelen1097","diptendu");
			}
		});
		
		String addr= "taylorliz42796@gmail.com";
		
		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("chohelen1097@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(addr));
			message.setSubject("New Student registration");
			String msg = "<body><div class='header' style='width: 100%; height: 50px; background-color: #b3b3ff; border-radius: 15px 15px 0 0; font-size: 40px;'><center><b>FIEM</b></center></div><br><br><span><p style='padding-left: 100px; font-size: 20px;'>Dear Admin,<br><br>There is a new Student admission registration by " + user.getFirstname() + " " + user.getLastname() + " with ID: " + user.getId() + ".<br>Kindly check it out.</p></span><br><br><div class='footer' style='width: 100%; height: 50px; background-color: #b3b3ff; border-radius: 0 0 15px 15px;'/></body>";
			message.setContent(msg, "text/html");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	public void informStudent(Student user)
	{
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465"); 
		javax.mail.Session session = javax.mail.Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("ChoHelen1097","diptendu");
			}
		});
		
		String addr= user.getEmail();
		
		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("chohelen1097@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(addr));
			message.setSubject("Registration confirmed");
			String msg = "<body><div class='header' style='width: 100%; height: 50px; background-color: #b3b3ff; border-radius: 15px 15px 0 0; font-size: 40px;'><center><b>FIEM</b></center></div><br><br><span><p style='padding-left: 100px; font-size: 20px;'>Dear Candidate,<br><br>Your registration is confirmed.<br>Kindly note down your ID and password given below and use it to login.<br><b>ID : " + user.getId() + "<br><b>Password : " + user.getPassword() + "</b></p></span><br><br><div class='footer' style='width: 100%; height: 50px; background-color: #b3b3ff; border-radius: 0 0 15px 15px;'/></body>";
			message.setContent(msg, "text/html");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	public void sendMails(String receipants, String subject, String m)
	{
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465"); 
		javax.mail.Session session = javax.mail.Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("ChoHelen1097","diptendu");
			}
		});
		
		String addr= receipants;
		
		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("chohelen1097@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(addr));
			message.setSubject(subject);
			String msg = "<body><div class='header' style='width: 100%; height: 50px; background-color: #b3b3ff; border-radius: 15px 15px 0 0; font-size: 40px;'><center><b>FIEM</b></center></div><br><br><span><p style='padding-left: 100px; font-size: 20px;'>Dear Candidate,<br><br>" + m + "<br><br>Thank You,<br>Admin Team</p></span><br><br><div class='footer' style='width: 100%; height: 50px; background-color: #b3b3ff; border-radius: 0 0 15px 15px;'/></body>";
			message.setContent(msg, "text/html");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	
	public void sendOTP(Integer otp, String email)
	{
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465"); 
		javax.mail.Session session = javax.mail.Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("ChoHelen1097","diptendu");
			}
		});
		
		String addr = email;
		
		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("chohelen1097@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(addr));
			message.setSubject("OTP for reset password");
			String msg = "<body><div class='header' style='width: 100%; height: 50px; background-color: #b3b3ff; border-radius: 15px 15px 0 0; font-size: 40px;'><center><b>FIEM</b></center></div><br><br><span><p style='padding-left: 100px; font-size: 20px;'>Dear User,<br><br>Your OTP is <b>" + otp + "</b></p></span><br><br><div class='footer' style='width: 100%; height: 50px; background-color: #b3b3ff; border-radius: 0 0 15px 15px;'/></body>";
			message.setContent(msg, "text/html");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	
	
	
	
	
	public boolean checkEmail(String email, int op) {
		boolean status = false;
		int i = 0;
		try {
			Connection con = DBUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("Select * from student where email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i++;
			}
			if(op == 1) {
				if(i == 0)
					status = true;
			}
			if(op == 2) {
				if(i == 0 || i == 1)
					status = true;
			}
		}
		catch(Exception e) {System.out.println(e);}
		
		return status;
	}

}
