package Entites;

import java.io.Serializable;

public class Admin_bean implements Serializable {
	private String admin_id;
	private String username;
	private String password;
	private String email;
	private String phone;

	public Admin_bean() {

	}

	public Admin_bean(String admin_id, String username, String password, String email, String phone) {
	
		this.admin_id = admin_id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
	}



	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
}
