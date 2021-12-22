<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="header.jsp">
	<c:param name="title" value="X-Mobile||Product Detail"></c:param>
</c:import>
<div class="infoProduct">
	<h2>${product.name}</h2>
	<hr/>
	<div class="display-product row">
		<div class="col-lg-6">
			<img src="${product.src}">
		</div>
		<div class="col-lg-6">
			<h2 style="color:red;">${product.price} USD</h2>
			<p>${product.description}</p>
			<form action="<c:url value="/addtocart"/>" method="get">
				<input type="hidden" name="action" value="add"/>
				<input type="hidden" name="id" value="${product.id}"/>
				<button type="submit" class="add-cart-btn">Add to cart</button>
			</form>
		</div>
	</div>
</div>
<c:import url="footer.jsp"></c:import>
