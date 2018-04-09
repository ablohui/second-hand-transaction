package com.yh.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.yh.toolbeen.Conn;

@SuppressWarnings("serial")
public class AddcarAction extends ActionSupport{
	

	public String execute() throws SQLException
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		String shopid=request.getParameter("shopid");
		String useridadrop=(String)session.getAttribute("userid");
		String comment=request.getParameter("coupon_code");
		Conn con=new Conn();
		String sql="select * from v_usershop where  shopid='"+shopid+"'";
		
		ResultSet rs=con.stmt.executeQuery(sql);
		if(rs.next()&&!useridadrop.equals("")){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat format1 = new SimpleDateFormat("MM-dd");
		String datetime=format.format(new Date());
		String useridsell=rs.getString("userid");
		Double price=rs.getDouble("price");
		String carid=format1.format(new Date())+shopid;
		String sql2="insert into car values('"+carid+"','"+useridsell+"','"+useridadrop+"','"+shopid+"','"+price+"','"+datetime+"','"+rs.getString("address")+"',default,'"+comment+"')";
		con.stmt.executeUpdate(sql2);
		
		return "success";
		}
		else{
			
			return "error";
		
		}
		
		
		
	}

}