package servlets;

import java.io.IOException;
import java.nio.file.Path;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

/**
 * Servlet implementation class AddProductToDB_Servlet
 */
@WebServlet("/AddProductToDB_Servlet")
public class AddProductToDB_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Statement statement;

	public AddProductToDB_Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String productName = request.getParameter("productName");
		String productPrice = request.getParameter("productPrice");
		String productImage = request.getParameter("imagePath");
		String quantity = request.getParameter("quantity");
		String description = request.getParameter("description");
		String category = request.getParameter("category").toLowerCase();
		

		ServletContext context = request.getServletContext();
		statement = (Statement) context.getAttribute("statement");
		int i=0;
		try {
			
			i=statement.executeUpdate("INSERT INTO  eelectronics.product (`ProductId` ,`ProductName` ,`ProductPrice` ,`Quantity` ,`Description` ,`Category` ,`ProductImage`)VALUES (NULL ,  '"+productName+"',  '"+productPrice+"',  '"+quantity+"',  '"+description+"',  '"+category+"',  '"+productImage+"')");
			if(i!=0){
				
				getServletContext().getRequestDispatcher("/addProductToDB.jsp").forward(request, response);
				
			}else{
				
				getServletContext().getRequestDispatcher("error.jsp").forward(request, response);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher dispatch = request
					.getRequestDispatcher("error.jsp");
			dispatch.include(request, response);
		}

	}

}
