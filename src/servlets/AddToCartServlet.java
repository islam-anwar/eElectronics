package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Entites.Order;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	HashSet<String>productsIdHashSet;
	ArrayList<Order>orderCartlist;
       
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
		//orderCartlist=new ArrayList<Order>();
		
		
		
		if(session.getAttribute("productsIdHashSet")==null){
			
			HashSet<String> set=new HashSet<String>();
			set.add(productId);
			session.setAttribute("productsIdHashSet",set);
			Order order=new Order();
			order.setUserId((int)session.getAttribute("usercode"));
			order.setProductId(Integer.parseInt(productId));
			ArrayList<Order> list=new ArrayList<Order>();
			list.add(order);
			session.setAttribute("orderCartlist", list);
			
			
			
		
		}
		productsIdHashSet=(HashSet<String>)session.getAttribute("productsIdHashSet");
		orderCartlist=(ArrayList<Order>)session.getAttribute("orderCartlist");
		
		
		if(productsIdHashSet.contains(productId)){
			   out.println("<script>"); 
               out.println("alert('This Item is chossen !!')"); 
               out.println("</script>"); 
               
               response.sendRedirect(request.getContextPath());
               
               

		}else{
			
		
		productsIdHashSet.add(productId);
		session.removeAttribute("productsIdHashSet");
		session.setAttribute("productsIdHashSet", productsIdHashSet);
		
		Order order=new Order();
		order.setUserId((int)session.getAttribute("usercode"));
		order.setProductId(Integer.parseInt(productId));
		orderCartlist.add(order);
		session.removeAttribute("orderCartlist");
		session.setAttribute("orderCartlist", orderCartlist);
		
		
		
	
		response.sendRedirect(request.getContextPath());
		
	}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
