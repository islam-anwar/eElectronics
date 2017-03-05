package ControllerDAO;
import javax.servlet.http.HttpServletRequest;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author NewTech
 */
public interface EcommerceInterface {
  //  public void addTOCart(String name,int price,int count,HttpServletRequest request);
    public double editAccount(double total,double oldaccount);
}
