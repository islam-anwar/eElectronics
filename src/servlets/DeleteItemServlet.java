package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Entites.ProductCount;

/**
 * Servlet implementation class DeleteItemServlet
 */
@WebServlet("/DeleteItemServlet")
public class DeleteItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	HashSet<String>productsIdHashSet;
	ArrayList<ProductCount> productCountList;
	
    public DeleteItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try{
			
		String productId=request.getParameter("productId");
		HttpSession session=request.getSession();
		
		productsIdHashSet=(HashSet<String>)session.getAttribute("productsIdHashSet");
		productsIdHashSet.remove(productId);
		session.removeAttribute("productsIdHashSet");
		session.setAttribute("productsIdHashSet", productsIdHashSet);
		productCountList=(ArrayList<ProductCount>)session.getAttribute("productCountList");
		Iterator pcIterator=productCountList.iterator();
		while (pcIterator.hasNext()) {
			
			ProductCount pc=(ProductCount)pcIterator.next();
			
			
			if(pc.getProductId()==Integer.parseInt(productId)){
				
				
				pcIterator.remove();
				break;
				
			}
		
			
		}
		session.removeAttribute("productCountList");
		session.setAttribute("productCountList", productCountList);
		
	
		response.sendRedirect("cart.jsp");
		}catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher dispatch = request
					.getRequestDispatcher("error.jsp");
			dispatch.forward(request, response);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
