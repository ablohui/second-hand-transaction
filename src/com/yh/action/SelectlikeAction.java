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
public class SelectlikeAction extends ActionSupport{
	

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
		Conn con=new Conn();
		
		String sql="select * from v_like_shop where userid='"+userid+"'";
		ResultSet rs=con.stmt.executeQuery(sql);
		while(rs.next())
		{
			shop shop=new shop();
			String shopname=rs.getString("shopname");
			String shoptime=rs.getString("shoptime");
			String intro=rs.getString("intro");
			String image=rs.getString("image");
			String shoplabel=rs.getString("shoplabel");
			Double price=rs.getDouble("price");
			int num=rs.getInt("num");
			String shopid=rs.getString("shopid");
			shop.setImage(image);
			shop.setIntro(intro);
			shop.setNum(num);
			shop.setPrice(price);
			shop.setShopid(shopid);
			shop.setShoplabel(shoplabel);
			shop.setShopname(shopname);
			shop.setShoptime(shoptime);
			list.add(shop);
			
		}
		session.setAttribute("list_like_shop",list);
		return "success";
		}
		
		
		
		
		
	}

}