package servlets;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class UpdateCart
 */
@WebServlet("/UpdateCart")
public class UpdateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			
			
			int i=0;
			System.out.println("update");
			String[]count=request.getParameterValues("quantity");
			System.out.println(count);
			HttpSession session=request.getSession();
			ArrayList<ProductCount> productCountList=(ArrayList<ProductCount>)session.getAttribute("productCountList");
			Iterator pcIterator=productCountList.iterator();
			ArrayList<ProductCount>pCList=new ArrayList<ProductCount>();
			
			while (pcIterator.hasNext()) {
				
				ProductCount pc=(ProductCount)pcIterator.next();
				pc.setProductCount(Integer.parseInt(count[i]));
				
				pCList.add(pc);
				
				
				
					
					
				}
			session.removeAttribute("productCountList");
			session.setAttribute("productCountList", pCList);
			
			response.sendRedirect("cart.jsp");
			} catch (Exception e) {
				e.printStackTrace();
				RequestDispatcher dispatch = request
						.getRequestDispatcher("error.jsp");
				dispatch.forward(request, response);
			}
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
		
		int i=0;
		System.out.println("update");
		String[]count=request.getParameterValues("quantity");
		System.out.println("count is"+count);
		HttpSession session=request.getSession();
		ArrayList<ProductCount> productCountList=(ArrayList<ProductCount>)session.getAttribute("productCountList");
		Iterator pcIterator=productCountList.iterator();
		ArrayList<ProductCount>pCList=new ArrayList<ProductCount>();
		
		while (pcIterator.hasNext()) {
			
			ProductCount pc=(ProductCount)pcIterator.next();
			pc.setProductCount(Integer.parseInt(count[i]));
			
			pCList.add(pc);
			
			
			
			i++;	
				
			}
		session.removeAttribute("productCountList");
		session.setAttribute("productCountList", pCList);
		
		response.sendRedirect("cart.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			RequestDispatcher dispatch = request
					.getRequestDispatcher("error.jsp");
			dispatch.forward(request, response);
		}
		
	}

}
