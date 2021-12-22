package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import context.DBContext;

public class AccountDAO {
	private Connection conn;

	public boolean login(String userMail, String password) throws Exception {

		conn = new DBContext().getConnection();
		String sql = "select count(*) as count from Account where user_mail=? and password=?";

		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, userMail);
		stmt.setString(2, password);

		ResultSet rs = stmt.executeQuery();
		int count = 0;
		if (rs.next()) {
			count = rs.getInt("count");
		}
		rs.close();
		stmt.close();
		conn.close();
		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}

	public boolean exists(String userMail) throws Exception {
		conn = new DBContext().getConnection();
		String sql = "select count(*) as count from Account where user_mail=?";

		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, userMail);

		ResultSet rs = stmt.executeQuery();
		int count = 0;
		if (rs.next()) {
			count = rs.getInt("count");
		}
		rs.close();
		stmt.close();
		conn.close();
		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}

	public void create(String userMail, String password, String userName, String userAddress, String phoneNumber)
			throws Exception {
		conn = new DBContext().getConnection();
		String sql = "insert into Account(user_mail,password,account_role,user_name,user_address,user_phone) values(?,?,?,?,?,?)";
		conn.setAutoCommit(false);
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);

			stmt.setString(1, userMail);
			stmt.setString(2, password);
			stmt.setInt(3, 2);
			stmt.setString(4, userName);
			stmt.setString(5, userAddress);
			stmt.setString(6, phoneNumber);
			stmt.executeUpdate();
			conn.commit();
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
		}
		conn.close();
	}

	public int getRole(String userMail) throws Exception {
		conn = new DBContext().getConnection();
		String sql = "select account_role from Account where user_mail=?";

		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, userMail);
		ResultSet rs = stmt.executeQuery();
		int role = -1;
		if (rs.next()) {
			role = rs.getInt("account_role");
		}
		return role;
	}
}
