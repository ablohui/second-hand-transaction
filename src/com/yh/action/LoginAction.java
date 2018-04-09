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
public class LoginAction extends ActionSupport{
	

	public String execute() throws SQLException
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		String uid=request.getParameter("userid");
		String password=request.getParameter("password");
		System.out.println(uid);
		Conn con=new Conn();
		String sql="select * from user where userid='"+uid+"' and password='"+password+"'";
		session.setAttribute("userid", uid);
		ResultSet rs=con.stmt.executeQuery(sql);
		if(rs.next())
			return "success";
		else
			return "error";
		
		
		
		
		
	}

}