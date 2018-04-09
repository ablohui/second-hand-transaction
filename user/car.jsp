<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="com.yh.toolbeen.Conn,java.sql.*,java.util.Date,java.util.*,com.yh.valuebeen.User,com.yh.valuebeen.User,com.yh.valuebeen.shop" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>


 <div class="shop_area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="shop_menu">
                            <ul class="cramb_area cramb_area_2 ">
                                <li><a href="index.jsp">主页 /</a></li>
                                <li><a href="car.jsp">订单</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
  </div>
  
  <%
  String userid=(String)session.getAttribute("userid");
  ArrayList list1=(ArrayList)session.getAttribute("list_user_infor");

	ArrayList list2=(ArrayList)session.getAttribute("list_shop_infor");
	
	User user=new User();
	shop shop=new shop();
             if(list1!=null){
          	   user=(User)list1.get(0);
          	   
             }
             if(list2!=null)
             {
          	   shop=(shop)list2.get(0);
          	
             }
  

  %>
   <div class="shopping_cart">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="account_heading account_heading_ah">
                            <h1>订单</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="all_wis_frm">
                        <div class="col-md-12">
                            <div class="wishlist-content wishlist-content-2">
                                <form action="addcar.action?shopid=<%=shop.getShopid()%>" method="post">
                                    <div class="wishlist-table wishlist-table-2 table-responsive">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th class="product-remove"><span class="nobr"></span></th>
                                                    <th class="product-thumbnail product-thumbnail-2"></th>
                                                    <th class="product-name product-name_2"><span class="nobr">产品</span></th>
                                                    <th class="product-price"><span class="nobr"> 单价 </span></th>
                                                    <th class="product-stock-stauts"><span class="nobr"> 数量 </span></th>
                                                    <th class="product-add-to-cart"><span class="nobr">总计</span></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            
                                                <tr>
                                                    <td class="product-remove product-remove_2"><a href="#">×</a></td>
                                                    <td class="product-thumbnail product-thumbnail-2"><a href="product.action?shopid=<%=shop.getShopid()%>"><img src="<%=shop.getImage() %>" alt="" /></a></td>
                                                    <td class="product-name product-name_2"><a href="product.action?shopid=<%=shop.getShopid()%>"><%=shop.getShopname() %></a></td>
                                                    <td class="product-price"><span class="amount-list amount-list-2">$<%=shop.getPrice() %></span></td>
                                                    <td class="product-stock-status">
                                                        <div class="latest_es_from_2">
                                                            <input type="number" value="1" disabled>
                                                        </div>
                                                    </td>
                                                    <td class="product-price"><span class="amount-list amount-list-2">$<%=shop.getPrice() %></span></td>
                                                </tr>
                                                
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="6">
                                                        <div class="coupon">
                                                            <label for="coupon_code"></label>
                                                            <input id="coupon_code" class="input-text" type="text" placeholder="留言" value="" name="coupon_code">
                                                    <!--       <a class="button_act button_act_3 button_act_333 button_act_tp " href="#">apply coupon</a>  --> 
                                                            <a class="button_act btn-tip " href="car.jsp">刷新订单</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                               
                                <div class="row">
                                    <div class="col-md-6 col-xs-12">
                                        <div class="cart_totals ">
                                            
                                            <div class="wc-proceed-to-checkout">
                                            <input type="submit" value="提交订单" class="button_act button_act-tc">
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12">
                                    </div>
                                </div>
                                 </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>