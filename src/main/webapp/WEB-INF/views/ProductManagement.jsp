<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Twitter Bootstrap shopping cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<%@include file="../../include/head.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<%@include file="../../include/header.jsp"%>
<%@include file="./product/CreateProduct.jsp"%>
<%@include file="./product/UpdateProduct.jsp"%>
<%@include file="./product/DeleteProduct.jsp"%>
<body>

	<div class="container">
		<div class="row">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="/">Home</a> <span class="divider">/</span></li>
					<li class="active">Product Management</li>
				</ul>
				<div class="well well-small">
					<h1>Product Management</h1>
					<hr class="soften" />
					<button style="padding: 5px; margin-bottom: 1.5%"
						data-toggle="modal" data-target="#modalRegisterForm">New
						Product</button>
					<table class="table table-bordered table-condensed">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Category</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Status</th>
								<th>Description</th>
								<th>Date created</th>
								<th>Image</th>
								<th>Option</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="items" items="${products}">
								<tr>
									<td>${items.id }</td>
									<td>${items.name }</td>
									<td>${items.category.tendanhmuc}</td>
									<td>${items.price}</td>
									<td>${items.quantity}</td>
									<td>${items.status}</td>
									<td>${items.description}</td>
									<td>${items.datecreated}</td>
									<td><img src="images/${items.image}/${items.image}"
										class="avatar" alt="Avatar" width="70px"></td>
									<td><a href="/product-update?id=${items.id}"><i
											class="fas fa-edit fa-2x" style="margin-left: 5px"></i></a> 
											<a href="/product-delete?iddelete=${items.id}"><i
										class="fa fa-trash fa-2x" style="padding-left: 10px"
										aria-hidden="true"></i></a> </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../../include/footer.jsp"%>
	<%@include file="../../include/js.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#modalRegisterForm').hide();
			$('#modalRegisterFormupdate').hide();
			$('#modalRegisterFormdelete').hide();
		});
	</script>
</body>
</html>
