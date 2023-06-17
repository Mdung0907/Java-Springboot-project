<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Twitter Bootstrap shopping cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<%@include file="/include/head.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<%@include file="/include/header.jsp"%>
<%@include file="./CreateAccount.jsp"%>
<%@include file="./UpdateAccount.jsp"%>
<%@include file="./DeleteAccount.jsp"%>
<body>
	<div class="container">
		<div class="row">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="/">Home</a> <span class="divider">/</span></li>
					<li class="active">Account Management</li>
				</ul>
				<div class="well well-small">
					<h1>Account Management</h1>
					<hr class="soften" />
					<button style="padding: 5px; margin-bottom: 1.5%"
						data-toggle="modal" data-target="#modalRegisterForm">New
						Account</button>
					<table class="table table-bordered table-condensed">
						<thead>
							<tr>
								<th>ID</th>
								<th>User name</th>
								<th>Password</th>
								<th>Full name</th>
								<th>Email</th>
								<th>Role</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="items" items="${accounts}">
								<tr>
									<td>${items.id }</td>
									<td>${items.username }</td>
									<td>${items.password}</td>
									<td>${items.fullname}</td>
									<td>${items.email}</td>
									<td>${items.role}</td>

									<td><a href="/account-updateAdmin?id=${items.id}"><i
											class="fas fa-edit fa-2x" style="margin-left: 5px"></i></a> <a
										href="/account-management?iddelete=${items.id}"><i
											class="fa fa-trash fa-2x" style="padding-left: 10px"
											aria-hidden="true"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
	<%@include file="/include/js.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#modalRegisterForm').hide();
			$('#modalRegisterFormupdate').hide();
			$('#modalRegisterFormdelete').hide();
		});
	</script>
</body>
</html>
