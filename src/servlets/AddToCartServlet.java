package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Entites.Order;
import Entites.ProductCount;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	HashSet<String>productsIdHashSet;
	ArrayList<ProductCount>productContList;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("id is"+request.getParameter("productId"));
		
		String productId=request.getParameter("productId");
		
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		productsIdHashSet=new HashSet<String>();
		productContList=new ArrayList<ProductCount>();
		
		try{
		
		if(session.getAttribute("productsIdHashSet")==null){
			
			HashSet<String> set=new HashSet<String>();
			set.add(productId);
			session.setAttribute("productsIdHashSet",set);
			ProductCount pc=new ProductCount();
			pc.setProductId(Integer.parseInt(productId));
			pc.setProductCount(1);
			productContList.add(pc);
			session.setAttribute("productCountList", productContList);
			
			
			
			
		
		}
		productsIdHashSet=(HashSet<String>)session.getAttribute("productsIdHashSet");
		productContList=(ArrayList<ProductCount>)session.getAttribute("productCountList");
		
		
		
		if(productsIdHashSet.contains(productId)){
			   out.println("<script>"); 
               out.println("alert('This Item is chossen !!')"); 
               out.println("</script>"); 
               
               response.sendRedirect(request.getContextPath());
               
               

		}else{
			
		
		productsIdHashSet.add(productId);
		session.removeAttribute("productsIdHashSet");
		session.setAttribute("productsIdHashSet", productsIdHashSet);
		
		ProductCount pc=new ProductCount();
		pc.setProductCount(1);
		pc.setProductId(Integer.parseInt(productId));
		productContList.add(pc);
		session.removeAttribute("productCountList");
		session.setAttribute("productCountList", productContList);
		
		
		
		
		
		
	
		 response.sendRedirect(request.getContextPath());
		
	}
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
