package tpc;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignupServletStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Successfully signed up!!");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("IAMHERE");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String userid =  request.getParameter("userid");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String rollno = request.getParameter("rollno");
		String branch = request.getParameter("branch");
		String cgpa = request.getParameter("cgpa");
		String email = request.getParameter("email");
		String dob = request.getParameter("dob");
		String passwd = request.getParameter("passwd");
		String cpasswd = request.getParameter("cpasswd");
		if(passwd.equals(cpasswd)){
			Student rec = new Student();
			rec.setuserid(userid);
			rec.setFirstName(fname);
			rec.setLastName(lname);
			rec.setrollNo(rollno);
			rec.setbranch(branch);
			rec.setCGPA(Float.parseFloat(cgpa));
			rec.setemailId(email);
			rec.setDateOfBirth(dob);
			rec.setpassword(passwd);
			Signup.main(rec);
			response.sendRedirect(request.getContextPath() + "/index.jsp");
		}
		else{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Password does not match. Enter your credentials again')");
			out.println("</script>");
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
	}
}

/*
		float jsalary = Float.parseFloat(request.getParameter("jsalary"));
		float jmincpi = Float.parseFloat(request.getParameter("jmincpi"));
		String jbranch = request.getParameter("jbranch").toUpperCase();
		String jdov = request.getParameter("jdov");
		
			recj.setBaseSalary(jsalary);
			recj.setMinCPI(jmincpi);
			recj.setBranchPrefferd(jbranch);
			recj.setDateOfVisit(jdov);
 */