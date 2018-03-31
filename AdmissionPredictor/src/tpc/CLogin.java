package tpc;

import java.awt.List;
import java.io.*;
import java.util.Dictionary;
import java.util.Hashtable;

import org.json.JSONException;
import org.json.JSONObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CLogin")
public class CLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int flag = 0;

	public CLogin() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setContentType("application/json");
			JSONObject json = new JSONObject();
			Dictionary error = new Hashtable();
			PrintWriter out = response.getWriter();
			boolean fl = false;
			HttpSession ht = request.getSession();

			LoginClass lc = new LoginClass();
			Dao db = new Dao();

			json.put("success", false);
			String email = request.getParameter("email");

			if (email.isEmpty())
				error.put("email", "Email is empty");

			if (!error.isEmpty()) {
				json.put("error", error);
			} else {
				lc.setEmail(email);
				lc.setPassword(request.getParameter("password"));
				System.out.println(lc.getEmail()+lc.getPassword());
				fl = db.confirmLogin(lc);

				if (fl == true) {
					ht.setAttribute("email", email);
					ht.setAttribute("sid", ht.getId());

					json.put("success", true);
				}

			}

			out.print(json.toString());
		} catch (JSONException e) {
			System.out.println("Unexpected JSON error");
		}
	}
}
