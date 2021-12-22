<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	Cookie[] cookies = request.getCookies();
	String user = "";
	String pwd = "";
	int co = 0;
	//out.print(cookies[0].getValue());
	if (cookies != null) {
		while (co < cookies.length) {
			if (cookies[co].getName().equals("user")) {
				user = cookies[co].getValue();
			}
			if (cookies[co].getName().equals("pass")) {
				pwd = cookies[co].getValue();
			}
			co++;
		}
	}
	//out.print(user);
	%>
<c:import url="header.jsp">
	<c:param name="title" value="X-Mobile||Login"></c:param>
</c:import>
<div class="loginbody">
		<h1>LOGIN</h1>
		<form action="<c:url value="/login"/>" method="POST" class="login-form"
			onsubmit="return validation()">
			<label for="username">Username:</label> <input type="text"
				name="username" id="username" value="<%out.print(user);%>"
				placeholder="Enter your username..."> <span id="uid-mess"></span>
			<br /> <label for="pwd">Password:</label> <input type="password"
				name="password" id="pwd" value="<%out.print(pwd);%>"
				placeholder="Enter your password..." /> <span id="pwd-mess"></span>
			<br /> <input type="submit" value="Login" class="login-btn" /> <input
				type="checkbox" name="chkRemember" value="ON" /> <label>Remember
				me</label>
			<p>${message}</p>
			<div>
				<p class="account">
					<a href="#">Forgot your password?</a>
				</p>
				<p class="account">
					<a href="${pageContext.request.contextPath}/createaccount.jsp">Don't have an account?</a>
				</p>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/login.js"></script>
<c:import url="footer.jsp"></c:import>
