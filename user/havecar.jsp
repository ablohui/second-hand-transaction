<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,com.yh.toolbeen.Conn,com.yh.toolbeen.Mytools,java.util.Date,java.text.SimpleDateFormat" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>交易记录</title>
	<link rel="icon" type="image/png" href="img/icon/favicon.ico">
  <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/fresh-bootstrap-table.css" rel="stylesheet" />
     
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
</head>
<body>
<jsp:include page="header2.jsp"></jsp:include>

<div>
	<div class="row">
            <div class="col-md-8 col-md-offset-2">
            &nbsp;<br>
            <br>
			</div>
	
	</div>

</div>

<div class="wrapper">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                                
                <div class="fresh-table full-color-orange">
                <!--    Available colors for the full background: full-color-blue, full-color-azure, full-color-green, full-color-red, full-color-orange                  
                        Available colors only for the toolbar: toolbar-color-blue, toolbar-color-azure, toolbar-color-green, toolbar-color-red, toolbar-color-orange
                -->
                <%
                	String userid=(String)session.getAttribute("userid");
                	Conn con=new Conn();
                	String sql="select * from car where useridsell='"+userid+"' order by Datetime";
                	String sql2="select * from car where useridadrop='"+userid+"' order by Datetime";
                	ResultSet rs1=con.stmt.executeQuery(sql);
                	Statement st=con.connection.createStatement();
                	ResultSet rs2=st.executeQuery(sql2);
                %>
                    <div class="toolbar">
                        <button id="alertBtn" class="btn btn-default">Alert</button>
                    </div>
                    
                    <table id="fresh-table" class="table">
                        <thead>
                            <th data-field="id">订单ID</th>
                        	<th data-field="shopid" data-sortable="true">商品id</th>
                        	<th data-field="price" data-sortable="true">价格</th>
                        	<th data-field="Datetime" data-sortable="true">订单时间</th>
                        	<th data-field="status">订单状态</th>
                        	<th data-field="user" data-sortable="true">用户身份</th>
                        </thead>
                        <tbody>
                        <% while(rs1.next()) {%>
                            <tr>
                            	<td><%=rs1.getString("carid") %></td>
                            	<td><%=rs1.getString("shopid") %></td>
                            	<td>$<%=rs1.getDouble("price") %></td>
                            	<td><%=rs1.getString("Datetime") %></td>
                            	<td><%=rs1.getString("status") %></td>
                            	<td>卖家</td>
                            </tr>
                            <%} %>
                            <% while(rs2.next()) {%>
                            <tr>
                            	<td><%=rs2.getString("carid") %></td>
                            	<td><%=rs2.getString("shopid") %></td>
                            	<td>$<%=rs2.getDouble("price") %></td>
                            	<td><%=rs2.getString("Datetime") %></td>
                            	<td><%=rs2.getString("status") %></td>
                            	<td>买家</td>
                            </tr>
                            <%} %>
                            
                        </tbody>
                    </table>
                </div>
                
                
            </div>
        </div>
    </div>
</div>
<div>
	<div class="row">
            <div class="col-md-8 col-md-offset-2">
            &nbsp;
			</div>
	
	</div>

</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrap-table.js"></script>

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
                pageSize: 8,
                pageList: [8,10,25,50,100],
                
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
            
                        
            
            $(window).resize(function () {
                $table.bootstrapTable('resetView');
            });
    
            
            window.operateEvents = {
                'click .like': function (e, value, row, index) {
                    alert('You click like icon, row: ' + JSON.stringify(row));
                    console.log(value, row, index);
                },
                'click .edit': function (e, value, row, index) {
                    alert('You click edit icon, row: ' + JSON.stringify(row));
                    console.log(value, row, index);    
                },
                'click .remove': function (e, value, row, index) {
                    $table.bootstrapTable('remove', {
                        field: 'id',
                        values: [row.id]
                    });
            
                }
            };
            
            $alertBtn.click(function () {
                alert("You pressed on Alert");
            });
            
        });
            
    
        function operateFormatter(value, row, index) {
            return [
                '<a rel="tooltip" title="Like" class="table-action like" href="javascript:void(0)" title="Like">',
                    '<i class="fa fa-heart"></i>',
                '</a>',
                '<a rel="tooltip" title="Edit" class="table-action edit" href="javascript:void(0)" title="Edit">',
                    '<i class="fa fa-edit"></i>',
                '</a>',
                '<a rel="tooltip" title="Remove" class="table-action remove" href="javascript:void(0)" title="Remove">',
                    '<i class="fa fa-remove"></i>',
                '</a>'
            ].join('');
        }
    
            
    </script>
</html>