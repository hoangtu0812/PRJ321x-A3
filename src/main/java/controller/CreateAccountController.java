package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDAO;
import model.Account;

/**
 * Servlet implementation class CreateAccountController
 */
public class CreateAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAccountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action == null) {
			request.getRequestDispatcher("/createaccount.jsp").forward(request, response);
			
		}
		if(action.equalsIgnoreCase("docreate")) {
			String userMail = request.getParameter("username");
			String password = request.getParameter("password");
			String userName = request.getParameter("name");
			String address = request.getParameter("address");
			String phoneNumber = request.getParameter("phoneNumber");
			System.out.println("Mail: " + userMail + " Password: " + password + " userName: " + userName + " Address: " + address + " Phone: " + phoneNumber);
			Account acc = new Account(userMail, password, userName, address, phoneNumber);
			AccountDAO accDAO = new AccountDAO();
			try {
				if(accDAO.exists(userMail)) {
					request.setAttribute("message", "An account with this email address is already exists!");
					request.getRequestDispatcher("/createaccount.jsp").forward(request, response);
				} else {
					accDAO.create(userMail, password, userName, address, phoneNumber);
					request.setAttribute("user", userMail);
					request.setAttribute("userName", userName);
					request.getRequestDispatcher("/createaccountsuccess.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
