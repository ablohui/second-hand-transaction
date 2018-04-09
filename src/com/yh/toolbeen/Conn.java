

package com.yh.toolbeen;

import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.Statement;


public class Conn {
	private String Driver="com.mysql.jdbc.Driver";
	private String url="jdbc:mysql://localhost:3306/business";
	public Connection connection=null;
	public Statement stmt=null;

	public Conn()
	{
		try{
			Class.forName(Driver).newInstance();
			connection=DriverManager.getConnection(url,"ablohui","yh123456");
			stmt=connection.createStatement();
			
		}catch(Exception e)
		{
			System.out.println("数据库加载失败");
		}
	}

}