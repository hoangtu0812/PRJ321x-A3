
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,dao.ListProductDAO,model.Product"%>
<%
String pageidd = request.getParameter("page");
if (pageidd == null) {
	pageidd = "1";
}
int pageid = Integer.parseInt(pageidd);
int total = 6;
if (pageid <= 0) {
	pageid = 1;
} else if (pageid > 2) {
	pageid = 2;
}
if (pageid == 1) {

} else {
	pageid = pageid - 1;
	pageid = pageid * total + 1;

}
//out.print(pageid - 1);
//out.print(pageid + total - 2);
List<Product> list = new ListProductDAO().getProductList(pageid - 1, pageid + total - 2);
request.setAttribute("list", list);

/* for (Product p : list) {
	out.print("<div><img src='" + p.getSrc() + "'/><h4>" + p.getBrand() + "</h4><h5>" + p.getName() + "</h5><p>"
	+ p.getPrice() + "</p></div>");
} */
%>

<c:import url="header.jsp">
	<c:param name="title" value="X-Mobile"></c:param>
</c:import>
<div class="index">
	<div class="row">
		<c:forEach var="product" items="${list}">
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
	<span class="pageid"><a href="index.jsp?page=${param.page-1}">&lt;</a></span> <span class="pageid"><a
		href="index.jsp?page=1">1</a></span> <span class="pageid"><a href="index.jsp?page=2">2</a></span>
	<span class="pageid"><a href="index.jsp?page=${param.page+1}">&gt;</a></span>
</div>
<c:import url="footer.jsp"></c:import>