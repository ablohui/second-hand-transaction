package com.yh.action;

import java.sql.*;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.yh.toolbeen.Conn;

@SuppressWarnings("serial")
public class AddlikeAction extends ActionSupport{
	

	public String execute() throws SQLException
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		String shopid=request.getParameter("shopid");
		String userid=(String)session.getAttribute("userid");
		
		Conn con=new Conn();
		String sql="select * from likelist where userid='"+userid+"' and shopid='"+shopid+"'";
		
		ResultSet rs=con.stmt.executeQuery(sql);
		if(rs.next()&&userid!=null)
			return "error";
		else{
			String sql2="insert into likelist values('"+userid+"','"+shopid+"')";
			con.stmt.executeUpdate(sql2);
			
			return "success";
		
		}
		
		
		
	}

}