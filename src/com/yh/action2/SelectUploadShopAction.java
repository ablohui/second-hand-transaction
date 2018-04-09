package com.yh.action2;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.yh.toolbeen.Conn;
import com.yh.valuebeen.shop;

@SuppressWarnings("serial")
public class SelectUploadShopAction  extends ActionSupport{
	

	public String execute() throws SQLException
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		ArrayList<shop> list=new ArrayList<shop>();
		ArrayList<String> list2=new ArrayList<String>();
		Conn con=new Conn();
		
		String sql="select * from newshop ";
		ResultSet rs=con.stmt.executeQuery(sql);
		while(rs.next())
		{
			shop shop=new shop();
			String shopname=rs.getString("shopname");
			String shoptime=rs.getString("time");
			String intro=rs.getString("intro");
			String image=rs.getString("image");
			String userid=rs.getString("userid");
			Double price=rs.getDouble("price");
			int num=rs.getInt("num");
			
			

			shop.setImage(image);
			shop.setIntro(intro);			
			shop.setNum(num);
			shop.setPrice(price);		
			shop.setShopname(shopname);
			shop.setShoptime(shoptime);

			list.add(shop);
			list2.add(userid);
			
		}
		session.setAttribute("UploadShop_Select_List",list);
		session.setAttribute("Uploaduser_Select_List",list2);
		return "success";
		}
		
		
		
		
		
	

}