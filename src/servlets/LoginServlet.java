package servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ControllerDAO.DaoMVC;
import Entites.ModelMVC;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
       
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. Retrieve all Parameters from HTML Page
		
		String uname = request.getParameter("uname");
		String password = request.getParameter("password");
		
		if(uname.equals(null) || uname == "" || password.equals(null) || password == "") {
			request.setAttribute("msg", "All Fields are mandatory");
			getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
		}
		else {
			//2. Set all values in Model Class Object
			ModelMVC m = new ModelMVC();
			m.setUname(uname);
			m.setPassword(password);
			
			String sql = "select * from eElectronics.users where username=? and password=?";
			
			//3. Call a method in DAO to select data from table
			HttpSession session = request.getSession();
			
			ResultSet rs = DaoMVC.loginUser(m,sql);
			 System.out.println("islam");
		
			try {
				if(rs.next()) {
					session.setAttribute("usercode", rs.getInt(1));
					session.setAttribute("uname", rs.getString(4));
					session.setAttribute("password", rs.getString(5));
					session.setAttribute("fname", rs.getString(2));
					session.setAttribute("lname", rs.getString(3));
					session.setAttribute("email", rs.getString(6));
					session.setAttribute("phone", rs.getString(7));
					session.setAttribute("home", rs.getString(10));
					session.setAttribute("gender", rs.getString(9));
					session.setAttribute("balance", rs.getDouble(8));
					
					
					
					getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
				
				
					
				
				}
				else {
					getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}


}
