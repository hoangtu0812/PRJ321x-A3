
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var="ds" dataSource="jdbc/ShoppingDB" />
<sql:query dataSource="${ds}"
	sql="select Account.user_mail,Orders.order_date,Orders.order_address,Orders_detail.amount_product,Products.product_name,Products.product_price from Account
inner join Orders on Account.user_mail = Orders.user_mail
inner join Orders_detail on Orders.order_id = Orders_detail.order_id
inner join Products on Orders_detail.product_id = Products.product_id
where Account.user_mail = ?"
	var="results">
	<sql:param>${user}</sql:param>
</sql:query>

<c:import url="header.jsp">
	<c:param name="title" value="X-Mobile||Product Detail"></c:param>
</c:import>
<div class="history">
	<h2>Your history</h2>
	<table>
		<tr>
			<th>Product</th>
			<th>Quantity</th>
			<th>Price</th>
			<th>Address</th>
			<th>Order date</th>
		</tr>
		<c:forEach var="list" items="${results.rows}">
		<tr><td>${list.product_name}</td>
		<td>${list.amount_product}</td>
		<td>${list.product_price}</td>
		<td>${list.order_address}</td>
		<td>${list.order_date}</td></tr>
	</c:forEach>
	</table>
</div>
<c:import url="footer.jsp"></c:import>