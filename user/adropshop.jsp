<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="com.yh.toolbeen.Conn,java.sql.*,java.util.Date,java.util.*,com.yh.valuebeen.User,com.yh.valuebeen.User,com.yh.valuebeen.shop" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>已购商品</title>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>
<%
Conn con=new Conn();


String stylesql="select * from style";
ArrayList list=(ArrayList)session.getAttribute("list_useradrop_shop");
ArrayList list2=(ArrayList)session.getAttribute("list_useradrop_shopdate");

%>





    
        <!--shop area start-->
        <div class="shop_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="shop_menu">
                            <ul class="cramb_area cramb_area_5">
                                <li><a href="index.jsp">主页 /</a></li>
                                <li class="br-active"><a href="like.action">收藏</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--bar area start-->
                <div class="row">
                    <div class="col-md-3">
                        <div class="category-widget-menu">
                            <h2 class="cat-menu-title text-uppercase">商品分类</h2>
                            <div class="menu-categories-container">
                                <ul class="menu-categories">
                                <%
                                ResultSet rs=con.stmt.executeQuery(stylesql);
                                while(rs.next()){
                                	String styleid=rs.getString("styleid");
                                	String style2sql="select * from style2 where styleid='"+styleid+"'";
                                	Statement st=con.connection.createStatement();
                                	ResultSet rs2=st.executeQuery(style2sql);
                                
                                %>
                                    <li class="expandable"><a href="view.action?styleid=<%=styleid%>"><%=rs.getString("stylename") %></a>                                
                                     <ul class="category-sub">
                                      
                                            <%while(rs2.next()) {%>
                                            <li><a href="view.action?styleid2=<%=rs2.getString("styleid2")%>"><%=rs2.getString("stylename2") %></a></li>
                                            <%} %>
                                       </ul>
                                      </li>
                                   <%
                                            
                                }%>
                                    
                                </ul>
                            </div>
                        </div>                      
                        <div class="row">
                            <div class="col-md-12">
                                <div class="single-sidebar-dr">
                                    <aside class="single-sidebar">
                                        <h3>价格区间</h3>
                                        <div class="info_widget">
                                        <form id="priceform" method="get" action="">
                                            <div class="price_filter">
                                                <div id="slider-range"></div>
                                                <div class="price_slider_amount">
                                                    <input type="text" id="amount" name="price"  placeholder="Add Your Price">
                                                </div>
                                                <div class="amount-range">
                                                    <p>价格:</p>
                                                    <input type="submit"  value="确定">
                                                </div>
                                            </div>
                                           </form>
                                        </div>
                                    </aside>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-12">
                                <div class="single-sidebar-dr">
                                    <aside class="single-sidebar single-sidebar-vg">
                                        <h3>热门标签</h3>
                                        <div class="compare_content compare_content_2">
                                            <div class="new_tag">
                                                <a href="#">Clothing</a>
                                                <a href="#">Enim</a>
                                                <a href="#">Fashion</a>
                                                <a href="#">Glasses</a>
                                                <a href="#">Hats</a>
                                                <a href="#">Hoodies</a>
                                            </div>
                                        </div>
                                    </aside>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-12">
                                <div class="category-widget-menu">
                                    <h2 class="cat-menu-title text-uppercase">热销</h2>
                                    <%	String hotleftsql="select * from v_hot_shop" ;
                                		Statement stm=con.connection.createStatement();
                                		ResultSet rs4=stm.executeQuery(hotleftsql); 
                                		for(int i=0;i<3;i++){
                                			if(rs4.next()){
                                			Double price=rs4.getDouble("price");
                                			int hotcount=rs4.getInt("hotcount");
                                			Double dicount=(100-hotcount)*price/100;
                                			
                                		%>
                                    <div class="all-pros-ex all-pros-ex-2">
                                        <div class="llc_pro">
                                            <div class="sinle_pic_3">
                                                <a href="#">
                                                <img class="primary-img" src="<%=rs4.getString("image") %>" alt="" />
                                                </a>
                                            </div>
                                        </div>
                                        <div class="product_content_2">
                                            <div class="usal_pro">
                                                <div class=" product_name_new">
                                                    <h2>
                                                        <a href="#"><%=rs4.getString("shopname") %></a>
                                                    </h2>
                                                </div>
                                                <div class="product_price product_price_new product_price_new_3">
                                                </div>
                                                <div class="price_box price_box_new price_box_new_3">
                                                    <span class="old- price old- price-3">$<%=price %></span>
                                                    <span class="spical-price">$<%=dicount %></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%} 
                                    }%>
                               
                                
                                
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="bar">
                           
                            <div class="right_area">
                           
                                <ul class="retabs" role="tablist">
                                    <li role="presentation"><a href="#home" role="tab" data-toggle="tab"><i class="fa fa-th"> 网状</i></a></li>
                                    <li role="presentation" class="active"><a href="#profile" role="tab" data-toggle="tab"><i class="fa fa-list"> 列表</i></a></li>
                                 </ul>
                            </div>
                        </div>
                        
                        <div class="tab-content">
                        
                            <div role="tabpanel" class="tab-pane" id="home">
                                <div class="row">
                                <%
                                if(list!=null){
                                	
                                	for(int i=0;i<list.size();i++){
                                	shop shop=(shop)list.get(i);
                                	String date=(String)list2.get(i);
                                	String image=shop.getImage();
                                	String image1=null,image2=null;
                                	if(image!=null){
                            			for(int j=0;j<image.length();j++){
                            				if(image.charAt(j)=='|'){			
                            					image1=image.substring(0,j-1);
                            					image2=image.substring(j+1,image.length()-1);
                            					
                            				}else{
                            					image1=image;
                            					image2=image;
                            				}
                            			}
                            		}else{
                            			image1="";
                            			image1="";
                            		}
                                	
                                	
                                	
                                	
                                	
                                	%>
                                	
                                	<div class="col-md-4 col-sm-4">
                                        <div class="all-pros all-pros-2 all-pros-latest">
                                            
                                            <div class="sinle_pic">
                                                <a href="#">
                                                <img class="primary-img" src="<%=image1 %>" alt="" />
                                                <img class="secondary-img" src="<%=image2 %>" alt="" />
                                                </a>
                                            </div>
                                            
                                            <div class="product_content">
                                                <div class="usal_pro">
                                                    <div class="product_name_2">
                                                        <h2>
                                                            <a href="#"><%=shop.getShopname() %></a>
                                                        </h2>
                                                    </div>
                                                    <div class="product_price">
                                                        <div class="price_rating">
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="price_box">
                                                        <span class="spical-price">$<%=shop.getPrice() %></span>
                                                    </div>
                                                    <div class="last_button_area">
                                                        <ul class="add-to-links clearfix">
                                                         	<li>
                                                                <div class="new_act">
                                                                   <p>购买数量:<%=shop.getNum() %> &nbsp;&nbsp;&nbsp;&nbsp; 成交时间:<%=date %></p>
                                                                   
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <div class="new_act">
                                                                    <a class="button_act" data-quick-id="45" href="" title="" data-toggle="tooltip" data-original-title="<%=shop.getStatus() %>"><%=shop.getStatus() %></a>
                                                                </div>
                                                            </li>
                                                            
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                	
                                	<%
                                	}
                                	
                                }
                                
                                %>
                                    
                             
                                </div>
                                
                                
                            </div>
                            
                       		<div role="tabpanel" class="tab-pane active" id="profile">
                             <%
                                if(list!=null){
                                	
                                	for(int i=0;i<list.size();i++){
                                	shop shop=(shop)list.get(i);
                                	String image=shop.getImage();
                                	String image1=null,image2=null;
                                	if(image!=null){
                            			for(int j=0;j<image.length();j++){
                            				if(image.charAt(j)=='|'){			
                            					image1=image.substring(0,j-1);
                            					image2=image.substring(j+1,image.length()-1);
                            					
                            				}else{
                            					image1=image;
                            					image2=image;
                            				}
                            			}
                            		}else{
                            			image1="";
                            			image1="";
                            		}
                                	
                                	
                                	
                                	
                                	
                                	%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="all-pros br-ntf">
                                            <div class="row">
                                                <div class="col-md-4 col-sm-4 pl pr">
                                                    <div class="sngl-pro">
                                                        
                                                        <div class="sinle_pic sngl-pc sinle_pic_2xd">
                                                            <a href="#">
                                                            <img class="primary-img" src="<%=image1 %>" alt="" />
                                                			<img class="secondary-img" src="<%=image2 %>" alt="" />
                                               				 </a>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                                <div class="col-md-8 col-sm-8 pl pr">
                                                    <div class="product_content product_content_nx">
                                                        <div class="usal_pro">
                                                            <div class="product_name_2 product_name_3 prnm">
                                                                <h2>
                                                                    <a href="#"><%=shop.getShopname() %></a>
                                                                </h2>
                                                                <div class="pro_discrip">
                                                                    <p><%=shop.getIntro() %></p>
                                                                </div>
                                                            </div>
                                                            <div class="action actionmm">
                                                                <div class="product_price product_price_tz">
                                                                    <div class="price_rating">
                                                                        
                                                                    </div>
                                                                </div>
                                                                <div class="price_box price_box_tz">
                                                                    <span class="spical-price">$<%=shop.getPrice() %></span>
                                                                </div>
                                                                <div class="last_button_area">
                                                                    <ul class="add-to-links clearfix">
                                                                        <li>
			                                                                <div class="new_act">
			                                                                   <p>浏览数:<%=shop.getSee() %></p>
			                                                                   <p>收藏数:<%=shop.getWant() %></p>
			                                                                </div>
			                                                            </li>
			                                                            <li>
			                                                                <div class="new_act">
			                                                                    <a class="button_act" data-quick-id="45" href="" title="" data-toggle="tooltip" data-original-title="删除宝贝">删除宝贝</a>
			                                                                </div>
			                                                            </li>
                                                                        
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               <%}
                                	}%>
                    
                            
                            
                            
                            </div>
                            
                            
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="navi_area">
                                    &nbsp;
                                    </div>
                                </div>
                             </div>
                           
                           
                        </div>
                    </div>
                </div>
                
            </div>
         
        </div>
        <!--shop area end-->
        
      
        
       




 
<jsp:include page="bottom.jsp"></jsp:include>


<script src="js/vendor/jquery-1.12.0.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- nivo slider js -->
        <script src="lib/js/jquery.nivo.slider.js" type="text/javascript"></script>
        <script src="lib/home.js" type="text/javascript"></script>
        <!-- owl.carousel js -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- meanmenu js -->
        <script src="js/jquery.meanmenu.js"></script>
        <!-- jquery-ui js -->
        <script src="js/jquery-ui.min.js"></script>
        <!-- easing js -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- mixitup js -->
        <script src="js/jquery.mixitup.min.js"></script>
        <!-- jquery.countdown js -->
        <script src="js/jquery.countdown.min.js"></script>
        <!-- wow js -->
        <script src="js/wow.min.js"></script>
        <!-- popup js -->
        <script src="js/jquery.magnific-popup.min.js"></script> 
        <!-- plugins js -->
        <script src="js/plugins.js"></script>
        <!-- main js -->
        <script src="js/main.js"></script>
        
        
</body>
</html>