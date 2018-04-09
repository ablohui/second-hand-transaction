package com.yh.action;

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
public class View2Action extends ActionSupport{
	

	
	public String execute() throws SQLException
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		String styleid2=request.getParameter("styleid2");
		
		ArrayList<shop> list=new ArrayList<shop>();
		Conn con=new Conn();
		
		String sql="select * from v_shop_style_user_style2 where styleid2='"+styleid2+"'";
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
			int want=rs.getInt("want");
			int see=rs.getInt("see");
			String status=rs.getString("status");
			
			String stylename=rs.getString("stylename");
			String styleid=rs.getString("styleid");
			String stylename2=rs.getString("stylename2");
			String brand=rs.getString("brand");
			String suitperson=rs.getString("suitperson");
			String shopid=rs.getString("shopid");
			shop.setBrand(brand);
			shop.setImage(image);
			shop.setIntro(intro);
			shop.setNum(num);
			shop.setPrice(price);
			shop.setSee(see);
			shop.setShopid(shopid);
			shop.setShoplabel(shoplabel);
			shop.setShopname(shopname);
			shop.setShoptime(shoptime);
			shop.setStatus(status);
			shop.setStyleid(styleid);
			shop.setStyleid2(styleid2);
			shop.setStylename(stylename);
			shop.setStylename2(stylename2);
			shop.setSuitperson(suitperson);
			shop.setWant(want);
			list.add(shop);
			
		}
		session.setAttribute("list_search_shop",list);
		return "success";
		
		
		
		
		
	}

}