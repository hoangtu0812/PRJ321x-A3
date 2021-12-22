package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;


import context.DBContext;
import model.Cart;
import model.Orders;
import model.Product;

//method work with Orders table
public class OrdersDAO {
	
	//insert information of Order to data source, that including list of
	//products in cart (c) and information of buyer in Orders o
	public void insertOrder(Orders o, Cart c) throws Exception {
		Connection conn = new DBContext().getConnection();
		conn.setAutoCommit(false);
		try {
		String sqlOrders = "insert into Orders(user_mail,order_status,order_date,order_discount_code,order_address) values(?,?,?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sqlOrders);
		stmt.setString(1, o.getUserMail());
		stmt.setInt(2, o.getStatus());
		stmt.setDate(3, (Date) o.getReceivedDate());
		stmt.setString(4, o.getDiscount());
		stmt.setString(5, o.getAddress());
		stmt.executeUpdate();
		stmt.close();
		
		String sqlGetId = "select top 1 * from Orders order by order_id desc";
		stmt =conn.prepareStatement(sqlGetId);
		ResultSet results = stmt.executeQuery();
		int id = 0;
		if(results.next()) {
			id = results.getInt("order_id");
		}
		stmt.close();
		
		
		String sqlCart = "insert into Orders_detail(order_id,product_id,amount_product,price_product) values(?,?,?,?) ";
		stmt = conn.prepareStatement(sqlCart);
		List<Product> ls = c.getItems();
		for(Product x: ls) {
			stmt.setInt(1, id);
			stmt.setInt(2, x.getId());
			stmt.setInt(3, x.getNumber());
			stmt.setInt(4, (int) x.getPrice());
			stmt.addBatch();
		}
		stmt.executeBatch();
		conn.commit();
		stmt.clearBatch();
		stmt.close();
		} catch (Exception ex) {
			ex.printStackTrace();
			conn.rollback();
		}
		conn.close();
		
	}
}
