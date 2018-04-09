package com.yh.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.yh.toolbeen.Conn;

@SuppressWarnings("serial")
public class UploadAction extends ActionSupport{
	private File upload;           		 				//上传文件
	
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload=upload;
	}
	public String execute() throws Exception {
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		HttpSession session = request.getSession();
		String userid=(String)session.getAttribute("userid");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-ddHH:mm:ss");
		String redate=format.format(new Date());
		String shopname=request.getParameter("shopname");
		String intro=request.getParameter("intro");
		String num=request.getParameter("num");
		int n=Integer.parseInt(num);
		
		String price=request.getParameter("price");
		Double p=Double.parseDouble(price);
		InputStream is=new FileInputStream(getUpload());  		//根据上传的文件得到输入流
		
		OutputStream os=new FileOutputStream("c:\\Users\\58493\\Desktop\\1\\business\\WebContent\\user\\img\\upload\\image\\"+redate.substring(0, 10)+".jpg");  //指定输出流地址
		byte buffer[]=new byte[1024];   
		int count=0;
		while((count=is.read(buffer))>0){
			os.write(buffer,0,count);    			  		//把文件写到指定位置的文件中
		}
		os.close();                    			   		//关闭
		is.close();
		Conn con=new Conn();
		String img="img/upload/image/"+redate.substring(0, 10)+".jpg"; 
		System.out.println(img);
		String image=img;
		String sql="insert into newshop values('"+userid+"','"+redate+"','"+shopname+"','"+p+"','"+n+"','"+intro+"','"+image+"')";
		con.stmt.executeUpdate(sql);
		return SUCCESS;                              	
	}
	
}
