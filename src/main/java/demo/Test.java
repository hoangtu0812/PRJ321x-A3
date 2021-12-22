package demo;

import java.util.List;

import dao.AccountDAO;
import dao.ListProductDAO;
import model.Product;

public class Test {

	public static void main(String[] args) {
		try {
			List<Product> ls = new ListProductDAO().getProductList();
			for (Product x : ls) {

				System.out.println(x.getName());
			}
			Product p = new ListProductDAO().getProduct("2");
			System.out.println("Product: " + p.getName());
			List<Product> ls1 = new ListProductDAO().search("iphone");
			for (Product x : ls1) {

				System.out.println("Search: " +x.getName());
			}
			List<Product> ls2 = new ListProductDAO().getProductList(6, 11);
			for (Product x : ls2) {

				System.out.println("Test: " +x.getName());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long millis=System.currentTimeMillis();  
        java.sql.Date date=new java.sql.Date(millis);  
        System.out.println(date);  
        
        AccountDAO acc = new AccountDAO();
        try {
			System.out.println(acc.getRole("hoangtu@gmail.com"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
