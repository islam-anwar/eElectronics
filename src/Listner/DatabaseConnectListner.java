package Listner;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;



/**
 * Application Lifecycle Listener implementation class DatabaseConnectListner
 *
 */
@WebListener
public class DatabaseConnectListner implements ServletContextListener {

  
    public void contextInitialized(ServletContextEvent sce) {
    	
    	 Statement st = null;
         ServletContext context;
        

         String username = "root";
         String pass = "root";
         String url = "jdbc:mysql://localhost:3306/eElectronics";
         String driver = "com.mysql.jdbc.Driver";
         String dbName = "eElectronics";
         
            try {



             //1- loade draiver

             Class.forName(driver);

             //2-creat connection

             Connection con = DriverManager.getConnection(url, username, pass);

             //3- create statement object

              st = con.createStatement();
              context=sce.getServletContext();
              context.setAttribute("statement", st);
              
              System.out.println("Connection DONE");


             
         } catch (Exception e) {
             e.printStackTrace();
         }
     
    }

	
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    }
	
}
