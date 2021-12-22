
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="header.jsp">
	<c:param name="title" value="X-Mobile||Product Detail"></c:param>
</c:import>
<div class="cart">
	<table>
		<tr>
			<th>Products in cart: ${cart.items.size()}</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Amount</th>
		</tr>
		<c:forEach var="product" items="${cart.getItems()}">
			<tr>
				<td>${product.name}</td>
				<td>${product.price}$</td>
				<td>${product.number}</td>
				<td>${product.getProductAmount()}$</td>
			</tr>
		</c:forEach>
		<tr><td colspan="4" style="text-align:right;">Total: ${cart.getAmount()}$</td></tr>
	</table>
	<form action="${pageContext.request.contextPath}/pay" method="post" class="pay-form">
		<label for="userMail" class="col-md-6">Customer email:</label>
		<input type="text" name="name" id="userMail" class="col-md-6" value="${user}"/>
		<label for="userMail" class="col-md-6">Customer address:</label>
		<input type="text" name="address" id="address" class="col-md-6"/>
		<label for="userMail" class="col-md-6">Discount code(if any):</label>
		<input type="text" name="discount" id="discount" class="col-md-6"/>
		<input type="submit" value="Submit"/>
	</form>
</div>
<c:import url="footer.jsp"></c:import>