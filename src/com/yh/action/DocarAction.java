package com.yh.action;

import java.sql.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.yh.toolbeen.Conn;
import com.yh.valuebeen.User;
import com.yh.valuebeen.shop;

@SuppressWarnings("serial")
public class DocarAction extends ActionSupport{
	
	@SuppressWarnings("rawtypes")
	public String execute() throws SQLException
	{
		
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		
		String userid=(String) session.getAttribute("userid");
		ArrayList list1=(ArrayList)session.getAttribute("list_user_infor");
		User user=(User)list1.get(0);
		
		ArrayList list2=(ArrayList)session.getAttribute("list_shop_infor");
		shop shop=(shop)list2.get(0);
		String comment=request.getParameter("coupon_code");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat format2 = new SimpleDateFormat("yyyyMMddHHmmss");
		String date=format.format(new Date());
		String carid=userid+format2.format(new Date());
		Conn con=new Conn();
		String usersql="select * from user where userid='"+userid+"'";
		ResultSet rs=con.stmt.executeQuery(usersql);
		rs.next();
		String sql="insert into car values('"+carid+"','"+user.getUid()+"','"+userid+"','"+shop.getPrice()+"','"+date+"','"+rs.getString("address")+"',default,'"+comment+"')";
		int count=con.stmt.executeUpdate(sql);
		if(shop.getNum()>=1&&count==1){
		String sql2="update shop set num=num-1 where shopid='"+shop.getShopid()+"'";
		con.stmt.executeUpdate(sql2);
		String sql3="update user_shop set status='´ý½»ÊÛ' where shopid='"+shop.getShopid()+"' and userid='"+user.getUid()+"'";
		con.stmt.executeUpdate(sql3);
		return "success";
		}
		
		else
			return "error";
		
	
		
		
	}
}