/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ControllerDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author NewTech
 */
public interface Product {
	 public void addTOCart(String name, double price,String cat,int Quantity ,HttpServletRequest request,int prodectId,HttpServletResponse response);
    //addtocart
    //addprodect
    //removeprodect
    //updateproduct

	
    
    //
    
}
