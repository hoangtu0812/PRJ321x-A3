package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import dao.AccountDAO;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8"); // vietnamese
		try {
			request.getSession(true).invalidate();
			// validate mail and password
			String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
			String regex = "[a-zA-Z0-9_!@#$%^&*]+";
			// collect data from login from
			String user = request.getParameter("username");
			String password = request.getParameter("password");

			Account acc = new Account();
			acc.setUsr(user);
			acc.setPwd(password);

			HttpSession session = request.getSession(true);
			if (!password.matches(regex) || !user.matches(regexMail)) {
				session.setAttribute("message", "<font color='red'>Invalid Username or Password</font>");
				response.sendRedirect("login.jsp");
			}
			AccountDAO accDAO = new AccountDAO();
			// check account from form
			if (accDAO.login(user, password)) {
				session.setAttribute("user", user);
				Cookie userCookie = new Cookie("user", user);
				Cookie passCookie = new Cookie("pass", password);
				System.out.println(request.getParameter("chkRemember"));
				if (request.getParameter("chkRemember") != null) {
					userCookie.setMaxAge(60 * 60 * 24);
					passCookie.setMaxAge(60 * 60 * 24);
				} else {
					userCookie.setMaxAge(0);
					passCookie.setMaxAge(0);
				}
				response.addCookie(userCookie);
				response.addCookie(passCookie);
				if (accDAO.getRole(user) == 1) {
					session.setAttribute("role", accDAO.getRole(user));
					request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("/history.jsp").forward(request, response);
				}
			} else {
				session.setAttribute("message", "<font color='red'>Wrong Username or Password</font>");
				response.sendRedirect("login.jsp");
			}

		} catch (NullPointerException e) {
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		} catch (Exception ex) {
			response.getWriter().println(ex);
		}

	}

}
