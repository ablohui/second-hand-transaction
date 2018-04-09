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
import com.yh.valuebeen.Car;


@SuppressWarnings("serial")
public class SelectOrderAction  extends ActionSupport{
	

	public String execute() throws SQLException
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		String value=request.getParameter("stauts");
		System.out.println(value);
		ArrayList<Car> list=new ArrayList<Car>();
		Conn con=new Conn();
		
		String sql="select * from car where status='"+value+"'";
		ResultSet rs=con.stmt.executeQuery(sql);
		while(rs.next())
		{
			Car car=new Car();
			String carid=rs.getString("carid");
			String shopid=rs.getString("shopid");
			String useridsell=rs.getString("useridsell");
			String useridadrop=rs.getString("useridadrop");
		
			Double price=rs.getDouble("price");
			String datetime=rs.getString("Datetime");
			
			String status=rs.getString("status");
			car.setCarid(carid);
			car.setDatetime(datetime);
			car.setPrice(price);
			car.setShopid(shopid);
			car.setStatus(status);
			car.setUseridadrop(useridadrop);
			car.setUseridsell(useridsell);

			
			
			list.add(car);
			
		}
		session.setAttribute("Car_Select_List",list);
		session.setAttribute("Order_status", value);
		return "success";
		}
		
		
		
		
		
	

}