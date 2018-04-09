package com.yh.action;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.yh.toolbeen.Conn;
import com.yh.valuebeen.shop;

@SuppressWarnings("serial")
public class SelectAdropShopAction extends ActionSupport{
	

	public String execute() throws SQLException
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		String userid=(String) session.getAttribute("userid");
		if(userid==null)
		{
			return "error";
		}else{
		ArrayList<shop> list=new ArrayList<shop>();
		ArrayList<String> list2=new ArrayList<String>();
		Conn con=new Conn();
		
		String sql="select * from v_car_shop where useridadrop='"+userid+"'";
		ResultSet rs=con.stmt.executeQuery(sql);
		while(rs.next())
		{
			shop shop=new shop();
			String shopname=rs.getString("shopname");
			String shoptime=rs.getString("shoptime");
			String intro=rs.getString("intro");
			String image=rs.getString("image");
			String shoplabel=rs.getString("shoplabel");
			Double price=rs.getDouble("price2");
			int num=rs.getInt("num");
			String shopid=rs.getString("shopid");		
			String status=rs.getString("status");
			String date=rs.getString("Datetime");
			shop.setImage(image);
			shop.setIntro(intro);
			shop.setStatus(status);
			shop.setNum(num);
			shop.setPrice(price);
			shop.setShopid(shopid);
			shop.setShoplabel(shoplabel);
			shop.setShopname(shopname);
			shop.setShoptime(shoptime);
			list.add(shop);
			list2.add(date);
			
		}
		session.setAttribute("list_useradrop_shop",list);
		session.setAttribute("list_useradrop_shopdate", list2);
		return "success";
		}
		
		
		
		
		
	}

}