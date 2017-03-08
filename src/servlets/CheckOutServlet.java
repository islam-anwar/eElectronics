package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import Entites.Product;
import Entites.ProductCount;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	HashSet<String> productsIdHashSet;
	ArrayList<Product> productsList;
	Statement statement;

	public CheckOutServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		try{
		ServletContext context=request.getServletContext();
		statement=(Statement)context.getAttribute("statement");

		HttpSession session = request.getSession();
	
		productsIdHashSet = (HashSet<String>) session
				.getAttribute("productsIdHashSet");
		Iterator productSetIterator = productsIdHashSet.iterator();
		productsList = (ArrayList<Product>) session
				.getAttribute("ProductsList");
		int userId = (int) session.getAttribute("usercode");
		ArrayList<ProductCount> pContList=(ArrayList<ProductCount>)session
				.getAttribute("productCountList");
		Iterator pCListIterator=pContList.iterator();
		double userBalance = (double) session.getAttribute("balance");
		Date date = new Date();
		double total = (double)session.getAttribute("totalPrice");
		
		if(userBalance>=total){

		while (productSetIterator.hasNext()) {

			int productItemId = Integer.parseInt((String) productSetIterator.next());
			ProductCount pCount=(ProductCount)pCListIterator.next();
			int count=pCount.getProductCount();

			Iterator productsListIterator = productsList.iterator();

			while (productsListIterator.hasNext()) {

				Product p = (Product) productsListIterator.next();
				if (productItemId == p.getId()) {
					
					System.out.println("user id is"+userId);
					
					try {
						statement
								.execute("INSERT INTO  eelectronics.order (`OrderId` ,`UserId` ,`ProductId` ,`ProductQuntity` ,`OrderPrice` ,`Date`)VALUES (NULL ,  '"
										+ userId
										+ "',  '"
										+ p.getId()
										+ "',  '"+count+"',  '"
										+ (p.getProductPrice())*count
										+ "',  '" + date.toGMTString() + "')");
						System.out.println("order inserted");
						statement
								.executeUpdate("UPDATE  eelectronics.product SET  `Quantity` =  "
										+ (p.getQuantity() - count)
										+ " WHERE  `product`.`ProductId` ="
										+ p.getId() + "");
						System.out.println("quantity modified");
						statement
								.executeUpdate("UPDATE  eelectronics.users SET  `Balance` =  '"
										+ (userBalance - (p.getProductPrice())*count)
										+ "' WHERE  `users`.`Id` ="
										+ userId
										+ "");
						System.out.println("Balance modified");
					} catch (Exception e) {
						e.printStackTrace();
						RequestDispatcher dispatch = request
								.getRequestDispatcher("error.jsp");
						dispatch.forward(request, response);
					}

				}

			}
		}
		
		session.removeAttribute("balance");
		session.setAttribute("balance", userBalance-total);
		response.sendRedirect("checkout.jsp");
		}
		
		else{
			
			response.sendRedirect("cart.jsp");
			
			
		}
		}catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher dispatch = request
					.getRequestDispatcher("error.jsp");
			dispatch.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
