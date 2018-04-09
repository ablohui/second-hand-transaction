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
import com.yh.valuebeen.User;

@SuppressWarnings("serial")
public class SelectUserAction extends ActionSupport{
	

	public String execute() throws SQLException
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		
		ArrayList<User> list1=new ArrayList<User>();
		Conn con=new Conn();
		String sql="select * from user ";
		
		ResultSet rs=con.stmt.executeQuery(sql);
		while(rs.next()){
			User user=new User();
			String username=rs.getString("username");
			String sex=rs.getString("sex");
			String QQ=rs.getString("QQ");
			String telephone=rs.getString("telephone");
			String Alipay=rs.getString("Alipay");
			String address=rs.getString("address");
			String birthdate=rs.getString("birthdate");
			String redate=rs.getString("redate");
			String age=rs.getString("age");
			String userid=rs.getString("userid");
			
			user.setAge(age);
			user.setRedate(redate);
			user.setBirthdate(birthdate);
			user.setAddress(address);
			user.setUid(userid);
			user.setUsername(username);
			user.setSex(sex);
			user.setQQ(QQ);
			user.setTelephone(telephone);
			user.setAlipay(Alipay);
			list1.add(user);
			
			
		}
		session.setAttribute("User_Select_List", list1);
			return "success";
		
		
		
		
		
	}

}