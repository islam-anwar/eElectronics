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

import ControllerDAO.DaoMVC;
import Entites.ModelMVC;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Statement stmt;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	ServletContext context=request.getServletContext();
		stmt=(Statement)context.getAttribute("statement");
    	
		// 1. Retrieve all parameters from HTML page
		String uname = request.getParameter("uname");
		String password = request.getParameter("password");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String home = request.getParameter("home");
		String gender = request.getParameter("gender");
		double balance = Double.parseDouble(request.getParameter("balance"));
	
//		//2. Set all values in Model Class Object
//		ModelMVC m = new ModelMVC();
//		m.setUname(uname);
//		m.setPassword(password);
//		m.setFname(fname);
//		m.setLname(lname);
//		m.setEmail(email);
//		m.setPhone(phone);
//		m.setHome(home);
//		m.setHome(gender);
//		m.setBalance(balance);
//		
//		
//		//3. Call a method in DAO class to insert data in table
//		String sql = "insert into eElectronics.users values (?,?,?,?,?,?,?,?,?,?)";
//		int i = DaoMVC.registerUser(m,sql);
		int i=0;
		try {
			i = stmt.executeUpdate("INSERT INTO  eelectronics.users (`Id` ,`FirstName` ,`LastName` ,`UserName` ,`PassWord` ,`Email` ,`PhoneNumber` ,`Balance` ,`Gender` ,`HomeAddress`)VALUES (NULL ,  '"+fname+"',  '"+lname+"',  '"+uname+"',  '"+password+"',  '"+email+"',  '"+phone+"',  '"+balance+"',  '"+gender+"',  '"+home+"')");
			System.out.println("iiiii"+i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(i != 0) {
			System.out.println("Value Inserted");
			request.setAttribute("msg", "Registeration Successful... Login Here");
			getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
		}
		
		else {
			System.out.println("Value isn't Inserted");
		}
	}
}
