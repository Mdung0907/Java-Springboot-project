<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<script type="text/javascript">
	function Validatedata2() {
		var name = document.frmRegister2.fullname.value;
		var username = document.frmRegister2.username.value;
		var password = document.frmRegister2.password.value;
		var email = document.frmRegister2.email.value;
		if (username == "") {
			document.getElementById("errusname").innerHTML = "User name cannot be left blank"
			return false;
		} else if (password == "") {
			document.getElementById("errpass").innerHTML = "Password cannot be left blank"
			return false;
		} else if (password.length<6||password.length>12) {
			document.getElementById("errpass").innerHTML = "Password must be between 6-12 characters"
			return false;
		} else if (name == '') {
			document.getElementById("errname").innerHTML = "Full name cannot be left blank"
			return false;
		} else if (email == '') {
			document.getElementById("errmail").innerHTML = "Email cannot be left blank"
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>
	<div class="modal fade" id="modalRegisterForm" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title w-100 font-weight-bold">Create Account</h4>
				</div>
				<form:form class="modal-body mx-3" name="frmRegister2"
					action="/account-registerAdmin" method="post"
					modelAttribute="account" onsubmit="return Validatedata2()">
					<div class="form-group">
						<label data-error="wrong" data-success="right"
							for="orangeForm-name">User name</label>
						<form:input path="username" cssStyle="width: 80%; height: 25px" />
						<br> <span id="errusname" style="color: red"></span>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Password</label>
						<form:password path="password" cssStyle="width: 80%; height: 25px" />
						<br> <span id="errpass" style="color: red"></span>
					</div>
					<div class="form-group">
						<label data-error="wrong" data-success="right"
							for="orangeForm-pass">Full name</label>
						<form:input path="fullname" cssStyle="width: 80%; height: 25px" />
						<br> <span id="errname" style="color: red"></span>
					</div>
					<div class="form-group">
						<label data-error="wrong" data-success="right"
							for="orangeForm-pass">Email</label>
						<form:input path="email" cssStyle="width: 80%; height: 25px" />
						<br> <span id="errmail" style="color: red"></span>
					</div>
					<div class="form-group">
						<label data-error="wrong" data-success="right"
							for="orangeForm-pass">Role</label>
						<form:select path="role" id="lang-select"
							style="width: 83%; height: 35px">
							<option value="true">Admin</option>
							<option value="false">User</option>
						</form:select>

					</div>
					<div class="modal-footer d-flex justify-content-center">
						<button class="btn btn-deep-orange" data-dismiss="modal">Cancel</button>
						<button class="btn btn-deep-orange" type="submit">Save</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>

