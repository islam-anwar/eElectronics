package Entites;

import java.io.Serializable;

public class Customer_bean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int customer_id;
	private String f_name;
	private String l_name;
	private String email;
	private String password;
	private String gender;

	public Customer_bean(int id, String f_name, String l_name, String email, String password, String gender) {
		this.customer_id=id;
		this.f_name = f_name;
		this.l_name = l_name;
		this.email = email;
		this.password = password;
		this.gender = gender;
	}

	public Customer_bean() {
		super();

	}
	public int getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}


	@Override
	public String toString() {
		return "Customer_bean [customer_id=" + customer_id + ", f_name=" + f_name + ", l_name=" + l_name + ", email="
				+ email + ", password=" + password + ", gender=" + gender + "]";
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	

}
