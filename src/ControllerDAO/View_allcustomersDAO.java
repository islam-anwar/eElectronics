package ControllerDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Entites.*;


public class View_allcustomersDAO  {
	
	public static  List<Customer_bean> getall() {

		List<Customer_bean> list = new ArrayList<Customer_bean>();
		Connection con = DaoMVC.getConnection();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("select * from eElectronics.users ");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Customer_bean c = new Customer_bean();
				c.setCustomer_id(rs.getInt("Id"));
				c.setF_name(rs.getString("FirstName"));
				c.setL_name(rs.getString("LastName"));
				c.setEmail(rs.getString("Email"));
				c.setPassword(rs.getString("PassWord"));
				c.setGender(rs.getString("Gender"));
				list.add(c);
			}
			con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}

}
