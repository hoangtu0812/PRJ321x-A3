package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Product;

//methods work with Product table
public class ListProductDAO {

	// return the list of products by product name
	public List<Product> search(String characters) throws Exception {
		List<Product> lp = getProductList();
		List<Product> lps = new ArrayList<>();
		for (Product x : lp) {
			if (x.getName().trim().toLowerCase().contains(characters.toLowerCase())) {
				lps.add(x);
			}
		}

		return lps;
	}

	// get the product
	public Product getProduct(String characters) throws Exception {
		Product p = new Product();
		List<Product> lp = getProductList();
		for (Product x : lp) {
			if (x.getId() == Integer.parseInt(characters)) {
				p = x;
			}
		}
		return p;
	}

	public List<Product> getProductList(int start, int end) throws Exception {
		List<Product> lp = getProductList();
		List<Product> getLp = new ArrayList<>();
		if(end + 1 >= lp.size()) {
			end = lp.size() - 1;
		}
		for (int i = start; i <= end; i++) {
			getLp.add(lp.get(i));
		}
		return getLp;

	}

	public List<Product> getProductList() throws Exception {
		Connection connection = new DBContext().getConnection();
		String sql = "select * from Products";
		PreparedStatement stmt = connection.prepareStatement(sql);

		ResultSet rs = stmt.executeQuery();
		List<Product> lp = new ArrayList<>();
		while (rs.next()) {
			int id = rs.getInt("product_id");
			String name = rs.getString("product_name");
			String des = rs.getString("product_des");
			float price = rs.getFloat("product_price");
			String src = rs.getString("product_img_source");
			String type = rs.getString("product_type");
			String brand = rs.getString("product_brand");
			Product pd = new Product(id, name, des, price, src, type, brand);
			lp.add(pd);
		}
		connection.close();
		return lp;

	}
}
