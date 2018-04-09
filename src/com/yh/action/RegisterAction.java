package com.yh.action;


import java.sql.*;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.yh.toolbeen.Conn;
import java.util.Date;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport{
	
	public String execute() throws SQLException
	{	
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		String userid=request.getParameter("userid");
		String password=request.getParameter("password");
		String username=request.getParameter("username");
		String age=request.getParameter("age");
		String sex=request.getParameter("sex");
		String address=request.getParameter("address");
		String telephone=request.getParameter("telephone");
		String QQ=request.getParameter("QQ");
		String Alipay=request.getParameter("Alipay");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String redate=format.format(new Date());
		
		String birthdate=request.getParameter("birthdate");
		System.out.println(birthdate+"  "+redate);
		Conn con=new Conn();
		String a="select * from user where userid='"+userid+"'";
		ResultSet rs=con.stmt.executeQuery(a);
		
				
		if(!rs.next())
		{
			String sql="insert into user values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.connection.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setString(2, password);
			ps.setString(3, username);
			ps.setString(4, age);
			ps.setString(5, sex);
			ps.setString(6, birthdate);
			ps.setString(7, address);
			ps.setString(8, QQ);
			ps.setString(9, telephone);
			ps.setString(10, Alipay);
			ps.setString(11,redate);
			ps.executeUpdate();
			
			return "success";
		}
		else{
			return "error";
		}
	}

}
