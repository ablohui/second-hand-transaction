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
public class SelectImageAction extends ActionSupport{
	public String execute() throws SQLException
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		String sql="select * from shop order by shoptime";
		Conn con=new Conn();
		ResultSet rs=con.stmt.executeQuery(sql);
		shop shop=new shop();
		ArrayList<shop> list=new ArrayList<shop>();
		while(rs.next())
		{
			shop.setImage(rs.getString("image"));
			shop.setShopname(rs.getString("shopname"));
			shop.setShoptime(rs.getString("shoptime"));
			list.add(shop);
		}
		session.setAttribute("Select_Image_List", list);
		return "success";
	
	}

}
