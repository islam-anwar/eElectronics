package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Entites.Product;

/**
 * Servlet implementation class ProductsOrderd
 */
@WebServlet("/ProductsOrderd")
public class ProductsOrderd extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	Statement stmt;
	ResultSet result;
	HashSet<Integer> productsOrderdList;
	
	
    public ProductsOrderd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		ServletContext context=request.getServletContext();
		stmt=(Statement)context.getAttribute("statement");
		
		productsOrderdList = new HashSet<Integer>();
		 
		 
		 try {
				result=stmt.executeQuery("SELECT * FROM eElectronics.order");
				
				if(result!=null){
					
					while (result.next()) {
						
				
						
						productsOrderdList.add(result.getInt("ProductId"));
						
					}
					
					System.out.println("productsOrderdList: "+productsOrderdList);
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				RequestDispatcher dispatch = request
						.getRequestDispatcher("error.jsp");
				dispatch.include(request, response);
			}
			
			HttpSession session=request.getSession();
			session.setAttribute("productsOrderdList", productsOrderdList);
			;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
