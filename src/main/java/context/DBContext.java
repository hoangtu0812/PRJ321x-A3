package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
	public Connection getConnection() throws Exception {
		String url= "jdbc:sqlserver://localhost:1433;databaseName=ShoppingDB;user=sa;password=sa";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url);
	}
}
