package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ControllerDAO.DaoMVC;
import Entites.ModelMVC;

/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Statement stmt;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		ServletContext context=request.getServletContext();
		stmt=(Statement)context.getAttribute("statement");
		
		
		// 1. Retrieve all parameters from JSP page
				int usercode = Integer.parseInt(request.getParameter("usercode"));
				String uname = request.getParameter("uname");
				String password = request.getParameter("password");
				String fname = request.getParameter("fname");
				String lname = request.getParameter("lname");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				String home = request.getParameter("home");
				String gender = request.getParameter("gender");
				double balance= Double.parseDouble(request.getParameter("balance"));
			
				//2. Set all values in Model Class Object
				HttpSession session = request.getSession();
				
				ModelMVC m = new ModelMVC();
				m.setUsercode(usercode);
				m.setUname(uname);
				m.setPassword(password);
				m.setFname(fname);
				m.setLname(lname);
				m.setEmail(email);
				m.setPhone(phone);
				m.setHome(home);
				m.setGender(gender);
				m.setBalance(balance);
				
//				//3. Call a method in DaoMVC to Edit data of User's Profile
//				String sql = "update eElectronics.users set UserName=?, PassWord=? , FirstName=?, LastName=?, Email=?, PhoneNumber=?, HomeAddress=?, Gender=?, Balance=? where usercode=?";
//				
//				int i = DaoMVC.updateUser(m,sql);
				
				int i=0;
				try {
					i = stmt.executeUpdate("UPDATE  eelectronics.users SET  FirstName =  '"+fname+"', LastName =  '"+lname+"',UserName =  '"+uname+"',PassWord =  '"+password+"', PhoneNumber =  '"+phone+"', Balance =  "+balance+", HomeAddress =  '"+home+"',Email='"+email+"',Gender='"+gender+"' WHERE  users.Id ="+usercode+ "");
					System.out.println("i is"+i);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				if(i != 0) {
					
					session.setAttribute("usercode", usercode);
					session.setAttribute("uname", uname);
					session.setAttribute("password", password);
					session.setAttribute("fname", fname);
					session.setAttribute("lname", lname);
					session.setAttribute("email", email);
					session.setAttribute("phone", phone);
					session.setAttribute("home", home);
					session.setAttribute("gender", gender);
					session.setAttribute("balance", balance);
					
					
					request.setAttribute("msg", "User Updated Successfully");
					getServletContext().getRequestDispatcher("/EditProfile.jsp").forward(request, response);
				}
				
				else {
					request.setAttribute("msg", "User not Updated");
					getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
				}
	}
}
