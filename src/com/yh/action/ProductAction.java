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
import com.yh.valuebeen.User;
import com.yh.valuebeen.shop;

@SuppressWarnings("serial")
public class ProductAction extends ActionSupport{
	

	public String execute() throws SQLException
	{
		ArrayList<User> list1=new ArrayList<User>();
		ArrayList<shop> list2=new ArrayList<shop>();
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		String shopid=request.getParameter("shopid");
		String sql="select * from v_shop_style_user_style2 where shopid='"+shopid+"'";
		Conn con=new Conn();
		ResultSet rs=con.stmt.executeQuery(sql);
		if(rs.next()){
			User user=new User();
			shop shop=new shop();
			String userid=rs.getString("userid");
			String username=rs.getString("username");
			String sex=rs.getString("sex");
			String QQ=rs.getString("QQ");
			String telephone=rs.getString("telephone");
			String Alipay=rs.getString("Alipay");
			user.setUid(userid);
			user.setUsername(username);
			user.setSex(sex);
			user.setQQ(QQ);
			user.setTelephone(telephone);
			user.setAlipay(Alipay);
			list1.add(user);
			
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
			list2.add(shop);
			session.setAttribute("list_user_product", list1);
			session.setAttribute("list_shop_product", list2);
			return "success";
		}else{
			return "error";
		}
		
		
		
		
		
		
		
		
		
	}

}