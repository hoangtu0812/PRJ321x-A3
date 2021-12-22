package controller.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ListProductDAO;
import model.Product;

public class SearchController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = res.getWriter()) {
			String name = req.getParameter("search");
			List<Product> ls = new ListProductDAO().search(name);
			req.setAttribute("products", ls);
			req.getRequestDispatcher("/admin/dashboard.jsp?action=searchresults").forward(req, res);
		} catch (Exception ex) {
			
		}
	}

}
