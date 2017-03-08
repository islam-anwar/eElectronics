package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ControllerDAO.*;
import Entites.Customer_bean;

/**
 * Servlet implementation class View_allcustomers
 */
@WebServlet("/View_allcustomers")
public class View_allcustomers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		//PrintWriter out = response.getWriter();

	//	out.print("<table border='1' width='100%'");
		//out.print("<tr><th>id</th><th>fname</th><th>lname</th><th>email</th><th>password</th><th>gender</th> </tr>");
		List<Customer_bean> list = View_allcustomersDAO.getall();
	/*	for (Customer_bean c : list) {
			out.print("<tr><td>" + c.getCustomer_id() + "</td><td>" + c.getF_name() + "</td><td>" + c.getL_name()
					+ "</td><td>" + c.getEmail() + "</td> <td>" + c.getPassword() + "</td><td>" + c.getGender()
					+ "</td></tr>");
		}
		out.print("</table>");
*/
		request.setAttribute("list", list);
		request.getRequestDispatcher("viewallcustomers.jsp").forward(request,response);
		//out.close();
	}
}