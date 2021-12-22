<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="header.jsp">
	<c:param name="title" value="X-Mobile||Login"></c:param>
</c:import>
<div class="create-success">
	<p>Hi! ${userName}</p>
	<p>Account created with email</p>
	<h4>${user}</h4>
	<a href="${pageContext.request.contextPath}/login.jsp">Log in with this email?</a>
</div>
<c:import url="footer.jsp"></c:import>
