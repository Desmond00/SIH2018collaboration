package tpc;

import java.io.*;
import java.util.Dictionary;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("application/json");
			JSONObject json = new JSONObject();
			Dictionary error = new Hashtable();
			PrintWriter out = response.getWriter();
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String cpassword = request.getParameter("cpassword");
			boolean flag = false;
			json.put("success", false);
			
			if(password.equals(cpassword)){
				Dao db = new Dao();
				LoginClass lc = new LoginClass(email,password);	
				flag = db.signup(lc);
				if(flag)
					json.put("success", true);
				else
					error.put("message", "Please check your Email Id");
			}
			else{
				System.out.println("Wrong password");
		//			out.println("<script type=\"text/javascript\">");
		//			out.println("alert('Password does not match. Enter your credentials again')");
		//			out.println("</script>");
		//			response.sendRedirect(request.getContextPath() + "/signup.jsp");
				error.put("message", " The passwords do not match");
			}
			json.put("error", error);
			out.print(json.toString());
		}
		 catch (JSONException e) {
				System.out.println("Unexpected JSON error");
		}
	}
}


