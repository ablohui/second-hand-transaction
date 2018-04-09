<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.yh.toolbeen.Conn,java.sql.*,java.util.Date,java.util.*,com.yh.valuebeen.User,com.yh.valuebeen.User,com.yh.valuebeen.shop" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户上传商品</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Visitors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link rel="stylesheet" href="css/bootstrap.min.css" >
<!-- //bootstrap-css -->
<!-- Custom CSS -->
<link rel="icon" type="image/png" href="images/favicon.ico">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/style-responsive.css" rel="stylesheet"/>
<!-- font CSS -->
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!-- font-awesome icons -->
<link rel="stylesheet" href="css/font.css" type="text/css"/>
<link href="css/font-awesome.css" rel="stylesheet"> 
<link rel="stylesheet" href="css/morris.css" type="text/css"/>
<!-- calendar -->
<link rel="stylesheet" href="css/monthly.css">
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/fresh-bootstrap-table.css" rel="stylesheet" />
     
    <!--     Fonts and icons     -->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
<!-- //calendar -->
<!-- //font-awesome icons -->
<script src="js/jquery2.0.3.min.js"></script>
<script src="js/raphael-min.js"></script>
<script src="js/morris.js"></script>
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/bootstrap1.js"></script>
<script type="text/javascript" src="js/bootstrap-table.js"></script>
<style type="text/css">

.spancolor span{
	color:#000000;

}

</style>
</head>
<body>
	<section id="container">
		
		<header class="header fixed-top clearfix">
		<!--logo start-->
			<div class="brand">
			    <a href="index.html" class="logo">
			        二手后台
			    </a>
			    <div class="sidebar-toggle-box">
			        <div class="fa fa-bars"></div>
			    </div>
			</div>
			<!--logo end-->
			<div class="nav notify-row" id="top_menu">
			    <!--  notification start -->
			    <ul class="nav top-menu">
			        <!-- settings start -->
			        <li class="dropdown">
			            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
			                <i class="fa fa-tasks"></i>
			                <span class="badge bg-success">8</span>
			            </a>
			            <ul class="dropdown-menu extended tasks-bar">
			                <li>
			                    <p class="">You have 8 pending tasks</p>
			                </li>
			                <li>
			                    <a href="#">
			                        <div class="task-info clearfix">
			                            <div class="desc pull-left">
			                                <h5>Target Sell</h5>
			                                <p>25% , Deadline  12 June’13</p>
			                            </div>
			                                    <span class="notification-pie-chart pull-right" data-percent="45">
			                            <span class="percent"></span>
			                            </span>
			                        </div>
			                    </a>
			                </li>
			                <li>
			                    <a href="#">
			                        <div class="task-info clearfix">
			                            <div class="desc pull-left">
			                                <h5>Product Delivery</h5>
			                                <p>45% , Deadline  12 June’13</p>
			                            </div>
			                                    <span class="notification-pie-chart pull-right" data-percent="78">
			                            <span class="percent"></span>
			                            </span>
			                        </div>
			                    </a>
			                </li>
			                <li>
			                    <a href="#">
			                        <div class="task-info clearfix">
			                            <div class="desc pull-left">
			                                <h5>Payment collection</h5>
			                                <p>87% , Deadline  12 June’13</p>
			                            </div>
			                                    <span class="notification-pie-chart pull-right" data-percent="60">
			                            <span class="percent"></span>
			                            </span>
			                        </div>
			                    </a>
			                </li>
			                <li>
			                    <a href="#">
			                        <div class="task-info clearfix">
			                            <div class="desc pull-left">
			                                <h5>Target Sell</h5>
			                                <p>33% , Deadline  12 June’13</p>
			                            </div>
			                                    <span class="notification-pie-chart pull-right" data-percent="90">
			                            <span class="percent"></span>
			                            </span>
			                        </div>
			                    </a>
			                </li>
			
			                <li class="external">
			                    <a href="#">See All Tasks</a>
			                </li>
			            </ul>
			        </li>
			        <!-- settings end -->
			        <!-- inbox dropdown start-->
			        <li id="header_inbox_bar" class="dropdown">
			            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
			                <i class="fa fa-envelope-o"></i>
			                <span class="badge bg-important">4</span>
			            </a>
			            <ul class="dropdown-menu extended inbox">
			                <li>
			                    <p class="red">You have 4 Mails</p>
			                </li>
			                <li>
			                    <a href="#">
			                        <span class="photo"><img alt="avatar" src="images/3.png"></span>
			                                <span class="subject">
			                                <span class="from">Jonathan Smith</span>
			                                <span class="time">Just now</span>
			                                </span>
			                                <span class="message">
			                                    Hello, this is an example msg.
			                                </span>
			                    </a>
			                </li>
			                <li>
			                    <a href="#">
			                        <span class="photo"><img alt="avatar" src="images/1.png"></span>
			                                <span class="subject">
			                                <span class="from">Jane Doe</span>
			                                <span class="time">2 min ago</span>
			                                </span>
			                                <span class="message">
			                                    Nice admin template
			                                </span>
			                    </a>
			                </li>
			                <li>
			                    <a href="#">
			                        <span class="photo"><img alt="avatar" src="images/3.png"></span>
			                                <span class="subject">
			                                <span class="from">Tasi sam</span>
			                                <span class="time">2 days ago</span>
			                                </span>
			                                <span class="message">
			                                    This is an example msg.
			                                </span>
			                    </a>
			                </li>
			                <li>
			                    <a href="#">
			                        <span class="photo"><img alt="avatar" src="images/2.png"></span>
			                                <span class="subject">
			                                <span class="from">Mr. Perfect</span>
			                                <span class="time">2 hour ago</span>
			                                </span>
			                                <span class="message">
			                                    Hi there, its a test
			                                </span>
			                    </a>
			                </li>
			                <li>
			                    <a href="#">See all messages</a>
			                </li>
			            </ul>
			        </li>
			        <!-- inbox dropdown end -->
			        <!-- notification dropdown start-->
			        <li id="header_notification_bar" class="dropdown">
			            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
			
			                <i class="fa fa-bell-o"></i>
			                <span class="badge bg-warning">3</span>
			            </a>
			            <ul class="dropdown-menu extended notification">
			                <li>
			                    <p>Notifications</p>
			                </li>
			                <li>
			                    <div class="alert alert-info clearfix">
			                        <span class="alert-icon"><i class="fa fa-bolt"></i></span>
			                        <div class="noti-info">
			                            <a href="#"> Server #1 overloaded.</a>
			                        </div>
			                    </div>
			                </li>
			                <li>
			                    <div class="alert alert-danger clearfix">
			                        <span class="alert-icon"><i class="fa fa-bolt"></i></span>
			                        <div class="noti-info">
			                            <a href="#"> Server #2 overloaded.</a>
			                        </div>
			                    </div>
			                </li>
			                <li>
			                    <div class="alert alert-success clearfix">
			                        <span class="alert-icon"><i class="fa fa-bolt"></i></span>
			                        <div class="noti-info">
			                            <a href="#"> Server #3 overloaded.</a>
			                        </div>
			                    </div>
			                </li>
			
			            </ul>
			        </li>
			        <!-- notification dropdown end -->
			    </ul>
			    <!--  notification end -->
			</div>
			<div class="top-nav clearfix">
			    <!--search & user info start-->
			    <ul class="nav pull-right top-menu">
			        <li>
			            <input type="text" class="form-control search" placeholder=" Search">
			        </li>
			        <!-- user login dropdown start-->
			        <li class="dropdown">
			            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
			                <img alt="" src="images/2.png">
			                <span class="username">John Doe</span>
			                <b class="caret"></b>
			            </a>
			            <ul class="dropdown-menu extended logout">
			                <li><a href="#"><i class=" fa fa-suitcase"></i>Profile</a></li>
			                <li><a href="#"><i class="fa fa-cog"></i> 设置</a></li>
			                <li><a href="login.html"><i class="fa fa-key"></i> 登出</a></li>
			            </ul>
			        </li>
			        <!-- user login dropdown end -->
			       
			    </ul>
			    <!--search & user info end-->
			</div>
			</header>
			
	<aside>
    <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
                <li>
                    <a class="active" href="hindex.jsp">
                        <i class="fa fa-dashboard"></i>
                        <span>首页</span>
                    </a>
                </li>
                
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>用户管理</span>
                    </a>
                    <ul class="sub">
						<li><a href="selectuser.action">查找用户</a></li>
						<li><a href="uploadselect.action">用户上传商品</a></li>
                        
                    </ul>
                </li>
               
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-th"></i>
                        <span>商品管理</span>
                    </a>
                    <ul class="sub">
                        <li><a href="selectshop.action">商品信息</a></li>
                        <li><a href="selectimage.action">商品图片</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-tasks"></i>
                        <span>订单管理</span>
                    </a>
                    <ul class="sub">
                        <li><a href="carselect.action?stauts=已成交">已成交订单</a></li>
                        <li><a href="carselect.action?stauts=已付款">已付款订单</a></li>
						<li><a href="carselect.action?stauts=未付款">未付款订单</a></li>
                    </ul>
                </li>
              
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-glass"></i>
                        <span>其他</span>
                    </a>
                    <ul class="sub">
                      
						<li><a href="404.html">404 Error</a></li>
                        <li><a href="registration.html">注册</a></li>
                    </ul>
                </li>
                <li>
                    <a href="login.html">
                        <i class="fa fa-user"></i>
                        <span>登录</span>
                    </a>
                </li>
            </ul>            </div>
        <!-- sidebar menu end-->
    </div>
</aside>
<!--sidebar end-->
		<section id="main-content">
			<section class="wrapper">
			
				<div class="container">
			        <div class="row">
			            <div class="col-md-8 col-md-offset-2">
			                                
			                <div class="fresh-table full-color-orange">
			                <!--    Available colors for the full background: full-color-blue, full-color-azure, full-color-green, full-color-red, full-color-orange                  
			                        Available colors only for the toolbar: toolbar-color-blue, toolbar-color-azure, toolbar-color-green, toolbar-color-red, toolbar-color-orange
			                -->
			                
			                    <div class="toolbar">
			                        <button id="alertBtn" class="btn btn-default">Alert</button>
			                    </div>
			                    
			                    <table id="fresh-table" class="table spancolor">
			                        <thead>
			                            <th data-field="id">上传用户ID</th>
			                        	<th data-field="name" data-sortable="true">商品名</th>
			                        	<th data-field="price" data-sortable="true">价格</th>
			                        	<th data-field="num" data-sortable="true">数量</th>
			                        	
			                        	<th data-field="redate" >上传时间</th>
			                        	<th data-field="stauts">详情</th>
			                        </thead>
			                        <tbody>
			                        <% 
			                        	 ArrayList list=(ArrayList)session.getAttribute("UploadShop_Select_List"); 
			                       		 ArrayList list2=(ArrayList)session.getAttribute("Uploaduser_Select_List"); 
			                          if(list!=null){
			                        	  for(int i=0;i<list.size();i++){
			                        		  shop shop=(shop)list.get(i);
			                        		 String userid=(String)list2.get(i);
			                        		  
			                        		  
			                        		  %>
			                        		  
			                        		 <tr>
				                            	<td><span><%=userid %></span></td>
				                            	<td><span><%=shop.getShopname() %></span></td>
				                            	<td><span><%=shop.getPrice() %></span></td>
				                            	<td><span><%=shop.getNum() %></span></td>
				                            	
				                            	<td><span><%=shop.getShoptime()%></span></td>
				                            	<td><span><a href="updateuploaddo.jsp?userid=<%=userid %>&shoptime=<%=shop.getShoptime()%>"><button class="btn">查看详情</button></a></span></td>
			                           		 </tr>
			                        		  
			                        		  
			                        		  <%
			                        	  }
			                        	  
			                          }
			                        
			                        %>
			                        
			                           
			                            <tr>
			                            	<td>2</td>
			                            	<td>Minerva Hooper</td>
			                            	<td>$23,789</td>
			                            	<td>Curaçao</td>
			                            	<td>Sinaai-Waas</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>3</td>
			                            	<td>Sage Rodriguez</td>
			                            	<td>$56,142</td>
			                            	<td>Netherlands</td>
			                            	<td>Baileux</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>4</td>
			                            	<td>Philip Chaney</td>
			                            	<td>$38,735</td>
			                            	<td>Korea, South</td>
			                            	<td>Overland Park</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>5</td>
			                            	<td>Doris Greene</td>
			                            	<td>$63,542</td>
			                            	<td>Malawi</td>
			                            	<td>Feldkirchen in Kärnten</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>6</td>
			                            	<td>Mason Porter</td>
			                            	<td>$78,615</td>
			                            	<td>Chile</td>
			                            	<td>Gloucester</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>7</td>
			                            	<td>Alden Chen</td>
			                            	<td>$63,929</td>
			                            	<td>Finland</td>
			                            	<td>Gary</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>8</td>
			                            	<td>Colton Hodges</td>
			                            	<td>$93,961</td>
			                            	<td>Nicaragua</td>
			                            	<td>Delft</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>9</td>
			                            	<td>Illana Nelson</td>
			                            	<td>$56,142</td>
			                            	<td>Heard Island</td>
			                            	<td>Montone</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>10</td>
			                            	<td>Nicole Lane</td>
			                            	<td>$93,148</td>
			                            	<td>Cayman Islands</td>
			                            	<td>Cottbus</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>11</td>
			                            	<td>Chaim Saunders</td>
			                            	<td>$5,502</td>
			                            	<td>Romania</td>
			                            	<td>New Quay</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>12</td>
			                            	<td>Josiah Simon</td>
			                            	<td>$50,265</td>
			                            	<td>Christmas Island</td>
			                            	<td>Sint-Jans-Molenbeek</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>13</td>
			                            	<td>Ila Poole</td>
			                            	<td>$67,413</td>
			                            	<td>Montenegro</td>
			                            	<td>Pontevedra</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>14</td>
			                            	<td>Shana Mejia</td>
			                            	<td>$58,566</td>
			                            	<td>Afghanistan</td>
			                            	<td>Ballarat</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>15</td>
			                            	<td>Lana Ryan</td>
			                            	<td>$64,151</td>
			                            	<td>Martinique</td>
			                            	<td>Portobuffolè</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>16</td>
			                            	<td>Daquan Bender</td>
			                            	<td>$91,906</td>
			                            	<td>Sao Tome and Principe</td>
			                            	<td>Walhain-Saint-Paul</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>17</td>
			                            	<td>Connor Wagner</td>
			                            	<td>$86,537</td>
			                            	<td>Germany</td>
			                            	<td>Solihull</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>18</td>
			                            	<td>Boris Horton</td>
			                            	<td>$35,094</td>
			                            	<td>Laos</td>
			                            	<td>Saint-Mard</td>
			                            	<td></td>
			                            </tr>
			                            <tr>
			                            	<td>19</td>
			                            	<td>Winifred Ryan</td>
			                            	<td>$64,436</td>
			                            	<td>Ireland</td>
			                            	<td>Ronciglione</td>
			                            	<td></td>
			                            </tr>
			                        </tbody>
			                    </table>
			                </div>
			                
			                
			            </div>
			        </div>
			    </div>
			
			</section>
 <!-- footer -->
		  <div class="footer">
			<div class="wthree-copyright">
			  <p>© 2017 yh</p>
			</div>
		  </div>
  <!-- / footer -->
		</section>
	</section>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
<script src="js/jquery.scrollTo.js"></script>
<!-- morris JavaScript -->	

 <script type="text/javascript">
        var $table = $('#fresh-table'),
            $alertBtn = $('#alertBtn'),
            full_screen = false;
            
        $().ready(function(){
            $table.bootstrapTable({
                toolbar: ".toolbar",
    
                showRefresh: true,
                search: true,
                showToggle: true,
                showColumns: true,
                pagination: true,
                striped: true,
                pageSize: 10,
                pageList: [10,25,50,75,100],
                
                formatShowingRows: function(pageFrom, pageTo, totalRows){
                    //do nothing here, we don't want to show the text "showing x of y from..." 
                },
                formatRecordsPerPage: function(pageNumber){
                    return pageNumber + " rows visible";
                },
                icons: {
                    refresh: 'fa fa-refresh',
                    toggle: 'fa fa-th-list',
                    columns: 'fa fa-columns',
                    detailOpen: 'fa fa-plus-circle',
                    detailClose: 'fa fa-minus-circle'
                }
            });
            
                        
            
           
            
            $alertBtn.click(function () {
                alert("You pressed on Alert");
            });
            
        });
            
    
       
    
            
    </script>
   

<script>
	$(document).ready(function() {
		//BOX BUTTON SHOW AND CLOSE
	   jQuery('.small-graph-box').hover(function() {
		  jQuery(this).find('.box-button').fadeIn('fast');
	   }, function() {
		  jQuery(this).find('.box-button').fadeOut('fast');
	   });
	   jQuery('.small-graph-box .box-close').click(function() {
		  jQuery(this).closest('.small-graph-box').fadeOut(200);
		  return false;
	   });
	   
	    //CHARTS
	    function gd(year, day, month) {
			return new Date(year, month - 1, day).getTime();
		}
		
		graphArea2 = Morris.Area({
			element: 'hero-area',
			padding: 10,
        behaveLikeLine: true,
        gridEnabled: false,
        gridLineColor: '#dddddd',
        axes: true,
        resize: true,
        smooth:true,
        pointSize: 0,
        lineWidth: 0,
        fillOpacity:0.85,
			data: [
				{period: '2015 Q1', iphone: 2668, ipad: null, itouch: 2649},
				{period: '2015 Q2', iphone: 15780, ipad: 13799, itouch: 12051},
				{period: '2015 Q3', iphone: 12920, ipad: 10975, itouch: 9910},
				{period: '2015 Q4', iphone: 8770, ipad: 6600, itouch: 6695},
				{period: '2016 Q1', iphone: 10820, ipad: 10924, itouch: 12300},
				{period: '2016 Q2', iphone: 9680, ipad: 9010, itouch: 7891},
				{period: '2016 Q3', iphone: 4830, ipad: 3805, itouch: 1598},
				{period: '2016 Q4', iphone: 15083, ipad: 8977, itouch: 5185},
				{period: '2017 Q1', iphone: 10697, ipad: 4470, itouch: 2038},
			
			],
			lineColors:['#eb6f6f','#926383','#eb6f6f'],
			xkey: 'period',
            redraw: true,
            ykeys: ['iphone', 'ipad', 'itouch'],
            labels: ['All Visitors', 'Returning Visitors', 'Unique Visitors'],
			pointSize: 2,
			hideHover: 'auto',
			resize: true
		});
		
	   
	});
	</script>
<!-- calendar -->
	<script type="text/javascript" src="js/monthly.js"></script>
	<script type="text/javascript">
		$(window).load( function() {

			$('#mycalendar').monthly({
				mode: 'event',
				
			});

			$('#mycalendar2').monthly({
				mode: 'picker',
				target: '#mytarget',
				setWidth: '250px',
				startHidden: true,
				showTrigger: '#mytarget',
				stylePast: true,
				disablePast: true
			});

		switch(window.location.protocol) {
		case 'http:':
		case 'https:':
		// running on a server, should be good.
		break;
		case 'file:':
		alert('Just a heads-up, events will not work when run locally.');
		}

		});
	</script>
	<!-- //calendar -->


</body>
</html>