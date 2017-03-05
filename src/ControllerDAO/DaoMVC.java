package ControllerDAO;

import java.sql.*;
import java.util.Random;

import Entites.ModelMVC;;;

public class DaoMVC {

		public static int userCode = 0;
		
	public static int registerUser(ModelMVC m, String sql) {
		int i = 2;
		Connection conn = getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			int randomNumber;
			
			Random rand = new Random(); 
			randomNumber = rand.nextInt(200);
			
			ps.setInt(1, randomNumber);
			
			ps.setString(2, m.getFname());
			ps.setString(3, m.getLname());
			ps.setString(4, m.getUname());
			ps.setString(5, m.getPassword());
			ps.setString(6, m.getEmail());
			ps.setString(7, m.getPhone());
			ps.setDouble(8, m.getBalance());
			ps.setString(9, m.getGender());
			ps.setString(10, m.getHome());
			
			
			i = ps.executeUpdate();
			
			System.out.println(i);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	private static Connection getConnection() {
		String connectionUrl = "jdbc:mysql://localhost:3306/eElectronics";
		Connection connection = null;
		
		
		try {
			
			//Instantiates for MySQL driver and registers it
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(connectionUrl, "root", "root");
			} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}

	public static ResultSet loginUser(ModelMVC m, String sql) {
		ResultSet rs = null;
		Connection conn = getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, m.getUname());
			ps.setString(2, m.getPassword());
			
			rs = ps.executeQuery();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	public static int updateUser(ModelMVC m, String sql) {
		
		int i = 0;
		
		Connection conn = getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, m.getUname());
			ps.setString(2, m.getPassword());
			ps.setString(3, m.getFname());
			ps.setString(4, m.getLname());
			ps.setString(5, m.getEmail());
			ps.setString(6, m.getPhone());
			ps.setString(7, m.getHome());
			ps.setString(8, m.getGender());
			ps.setInt(9, m.getUsercode());
			ps.setDouble(10, m.getBalance());
			
			i = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return i;
	}

}
