package com.yh.action;

import java.sql.*;
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
public class SearchAction extends ActionSupport{
	

	
	public String execute() throws SQLException
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		String text=request.getParameter("text");
		String w="";
		String order=request.getParameter("sortform");
		String or="";
		
		String text1=(String)session.getAttribute("search_text");
		if(text1==null)
		{
			session.setAttribute("search_text", text);
			text1=(String)session.getAttribute("search_text");
		}
		if(text1!=null)
		{
			text1=(String)session.getAttribute("search_text");
			w="where shopname like '%"+text1+"%' or stylename like '%"+text1+"%' or stylename2 like '%"+text1+"%' or intro like '%"+text1+"%'";
		}
		if(order!=null){
			or="order by "+order;
		}
		System.out.println(text);
		ArrayList<shop> list=new ArrayList<shop>();
		Conn con=new Conn();
		
		String sql="select * from v_shop_style_user_style2 "+w +" "+or;
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
			String styleid=rs.getString("styleid");
			String stylename=rs.getString("stylename");
			String styleid2=rs.getString("styleid2");
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
		System.out.println(list.size()+"sad");
		session.setAttribute("list_search_shop",list);
		return "success";
		
		
		
		
		
	}

}