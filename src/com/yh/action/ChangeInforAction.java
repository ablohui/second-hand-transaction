package com.yh.action;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.yh.toolbeen.Conn;

@SuppressWarnings("serial")
public class ChangeInforAction extends ActionSupport{
	
	
	public String execute() throws SQLException
	{
		
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		String userid=(String)session.getAttribute("userid");
		
		String username=request.getParameter("username");
		String age=request.getParameter("age");
		String sex=request.getParameter("sex");
		String birthdate=request.getParameter("birthdate");
		String password=request.getParameter("password");
		String QQ=request.getParameter("QQ");
		String telephone=request.getParameter("telephone");
		String Alipay=request.getParameter("Alipay");
		String address=request.getParameter("address");
		Conn con=new Conn();
		String sql="update user Set username='"+username+"' , password='"+password+"' , age='"+age+"' ,sex='"+sex+"' ,birthdate='"+birthdate+"' , address='"+address+"' ,QQ='"+QQ+"', telephone='"+telephone+"',Alipay='"+Alipay+"' where userid='"+userid+"'";
		int i=con.stmt.executeUpdate(sql);
		if(i==0)
			return "error";
		else
			return "success";
		
		
	
		
		
	}
}