package controller.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import model.Product;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ListProductDAO;

public class ListController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = resp.getWriter()){
			List<Product> ls = new ListProductDAO().getProductList();
			for(Product x:ls) {
				System.out.println(x.getName());
			}
			req.setAttribute("products", ls);
			req.getRequestDispatcher("/admin/dashboard.jsp?action=list").forward(req, resp);
		} catch (Exception ex) {}
	}

}
