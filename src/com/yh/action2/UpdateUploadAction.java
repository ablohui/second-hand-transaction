package com.yh.action2;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.yh.toolbeen.Conn;

@SuppressWarnings("serial")
public class UpdateUploadAction extends ActionSupport{
	public String execute() throws Exception {
		
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		String userid=(String) session.getAttribute("userid1");
		String time=(String) session.getAttribute("shoptime");
		System.out.println(userid+time);
		
		String suitperson=request.getParameter("suitperson");
		String style=request.getParameter("style");
		String choose=request.getParameter("choose");
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");

		String shopid=format.format(new Date());
		
		
		String sql="select * from newshop where userid='"+userid+"' and time='"+time+"'";
		Conn con=new Conn();
		ResultSet rs=con.stmt.executeQuery(sql);
		rs.next();
		String image=rs.getString("image");
		String shopname=rs.getString("shopname");
		String num=rs.getString("num");
		String price=rs.getString("price");
		String intro=rs.getString("intro");
		String sql1="delete from newshop where userid='"+userid+"' and time='"+time+"'";
		String sql2="insert into shop values('"+shopid+"','"+shopname+"','"+time+"','"+intro+"','"+image+"','"+price+"','"+num+"',default)";
		
		String sql3="insert into user_shop values('"+userid+"','"+shopid+"',default,default,default)";
		String sql4="insert into style2 values('"+style+"1','"+shopname+"','"+shopid+"','"+style+"',default,'"+suitperson+"')";
		
		int i=con.stmt.executeUpdate(sql1);
		if(i!=0)
		{
		con.stmt.executeUpdate(sql2);
		con.stmt.executeUpdate(sql3);
		con.stmt.executeUpdate(sql4);
		}
		
		return "success";
		
		
		
	}

}
