<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="header.jsp">
	<c:param name="title" value="X-Mobile||Register"></c:param>
</c:import>
<div class="create">
	<h1>Register</h1>
	<form action="<c:url value="/createaccount"/>" method="POST" class="create-form"
		onsubmit="return validation()">
		<p style="color:red;">${message}</p>
		<input type="hidden" name="action" value="docreate"/>
		<label for="username">Email: </label> <input type="text"
			name="username" id="username" placeholder="Enter your email...">
		<span id="uid-mess"></span> <br /> <label for="pwd">Password:</label>
		<input type="password" name="password" id="pwd"
			placeholder="Enter your password..." /> <span id="pwd-mess"></span><br/>
		<label for="confirmpwd">Confirm password:</label> <input type="password"
			name="cofirmpassword" id="confirmpwd"
			placeholder="Re-enter your password..." /><span id="confirmpwd-mess"></span>
		<br/>
			<label for="nameOfUser">Fullname:</label>
			<input type="text"
			name="name" id="nameOfUser"
			placeholder="Enter your fullname..." /><span id="name-mess"></span> <br/>
			<label for="address">Address:</label>
			<input type="text"
			name="address" id="address"
			placeholder="Enter your address..." /><span id="address-mess"></span> <br/> 
			<label for="phoneNumber">Phone number:</label>
			<input type="text"
			name="phoneNumber" id="phoneNumber"
			placeholder="Enter your phone number..." /><span id="phone-mess"></span> <br/> 
			 <input
			type="submit" value="Register" class="create-btn" />
		
		<div>
			<p class="account">
				<a href="#">Already have an account?</a>
			</p>
		</div>
	</form>
</div>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/createaccount.js"></script>
<c:import url="footer.jsp"></c:import>
