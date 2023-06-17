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
<%@include file="./Confirmitem.jsp"%>
</head>
<body>
	<%@include file="/include/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="index.html">Home</a> <span class="divider">/</span></li>
					<li class="active">Check Out</li>
				</ul>
				<div class="well well-small">

					<hr class="soften" />

					<table class="table table-bordered table-condensed">
						<thead>
							<tr>
								<th>Product</th>
								<th>Description</th>
								<th>Date Created</th>
								<th>User</th>
								<th>Address</th>
								<th>PhoneNumber</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Total</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="items" items="${orderanddetail }">
								<tr>
									<td><img width="100"
										src="/images/${items.productid.image }/${items.productid.image }"
										alt=""></td>
									<td>Name: ${items.productid.name }<br>Model :
										${items.productid.category.tendanhmuc }
									</td>
									<td>${items.createdate }</td>
									<td>${items.orderid.user.fullname }</td>
									<td>${items.orderid.address }</td>
									<td>${items.orderid.phonenumber }</td>
									<td>$${items.price }</td>
									<td>${items.quantity }</td>
									<td>$${items.quantity*items.price}</td>
									<td><a href="/cartManagement?id=${items.id }">${items.checkstatus }</a></td>
								</tr>
							</c:forEach>



						</tbody>
					</table>
					<br />






				</div>
			</div>
		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
	<%@include file="/include/js.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#modalRegisterConfirm').hide();
		});
	</script>
</body>
</html>
