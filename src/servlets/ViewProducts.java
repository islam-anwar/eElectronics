package servlets;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;

import com.mysql.jdbc.Blob;

import Entites.Product;

/**
 * Servlet implementation class ViewProducts
 */
@WebServlet("/ViewProducts")
public class ViewProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	Statement stmt;
	ResultSet result;
	ArrayList<Product> productsList;
	
	
	
	
       
    
    public ViewProducts() {
        super();
        
        
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext context=request.getServletContext();
		stmt=(Statement)context.getAttribute("statement");
		productsList=new ArrayList<Product>();
		HashSet<String> categoriesList = new HashSet<String>();
		try {
			result=stmt.executeQuery("SELECT * FROM eElectronics.product");
			
			if(result!=null){
				
				while (result.next()) {
					Product product=new Product();
					product.setId(result.getInt("ProductId"));
					product.setProductName(result.getString("ProductName"));
					product.setProductPrice(result.getDouble("ProductPrice"));
					product.setQuantity(result.getInt("Quantity"));
					product.setDescription(result.getString("Description"));
					product.setCategory(result.getString("Category"));
					
					
					
					
					product.setProductImage(result.getString("ProductImage"));
					
					
					productsList.add(product);
					categoriesList.add(result.getString("Category"));
					
					
					
				}
				
				System.out.println(categoriesList);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher dispatch = request
					.getRequestDispatcher("error.jsp");
			dispatch.include(request, response);
		}
		
		HttpSession session=request.getSession();
		session.setAttribute("ProductsList", productsList);
		session.setAttribute("categoriesList", categoriesList);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
