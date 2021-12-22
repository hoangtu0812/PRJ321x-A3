
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,dao.ListProductDAO,model.Product"%>
<c:import url="header.jsp">
	<c:param name="title" value="X-Mobile"></c:param>
</c:import>
<div class="index">
	<div class="row">
		<c:if test="${results.size() == 0}">
			<div class="not-found"><h2>No product found</h2></div>
		</c:if>
		<c:forEach var="product" items="${results}">

			<div class="col-lg-4">
				<div class="product">
					<a href='<c:url value="/productinfo?id=${product.id}"/>'><img
						src="${product.src}"></a>
					<h4>${product.type}</h4>
					<a href='<c:url value="/productinfo?id=${product.id}"/>'><h5>${product.name}</h5></a>
					<p>${product.price}</p>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<c:import url="footer.jsp"></c:import>