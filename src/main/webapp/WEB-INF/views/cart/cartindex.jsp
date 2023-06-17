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

								<th>Unit price</th>
								<th>Qty</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="items" items="${orderdetail }">
								<tr>
									<td><img width="100"
										src="/images/${items.productid.image }/${items.productid.image }"
										alt=""></td>
									<td>Name: ${items.productid.name }<br>Model :
										${items.productid.category.tendanhmuc }
									</td>
									<td>${items.createdate }</td>

									<td>$${items.price }</td>
									<td>
										<form action="/cart/update?"
											style="margin: 0; margin-right: 40px; width: 10px; display: inline-block;">
											<input type="hidden" name="id" value=${items.id }> <input
												class="span1" style="max-width: 34px" placeholder="1"
												id="appendedInputButtons" size="16" type="text"
												value="${items.quantity}" name="qty"
												onblur="this.form.submit()">

										</form>
										<div class="input-append">
											<a href="/cart/update-1?id=${items.id}&qty=${items.quantity}">
												<button class="btn btn-mini" type="button">-</button>
											</a> <a
												href="/cart/update+1?id=${items.id}&qty=${items.quantity}"><button
													class="btn btn-mini" type="button">+</button></a> <a
												href="/deleteItem?id=${items.id }"><button
													class="btn btn-mini btn-danger" type="button">
													<span class="icon-remove"></span>
												</button></a>
										</div>
									</td>
									<td>$${items.quantity*items.price}</td>
								</tr>
							</c:forEach>



						</tbody>
					</table>
					<br />


					<table class="table table-bordered">
						<tbody>
							<tr>
								<td>
									<form class="form-inline">
										<label style="min-width: 159px"> VOUCHERS Code: </label> <input
											type="text" class="input-medium" placeholder="CODE">
										<button type="submit" class="shopBtn">ADD</button>
									</form>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td>ESTIMATE YOUR SHIPPING & TAXES</td>
							</tr>
							<tr>
								<td>
									<form class="form-horizontal" action="Pay" method="post">
										<div class="control-group">
											<label class="span2 control-label" for="inputEmail">Address</label>
											<div class="controls">
												<input type="text" placeholder="Address" name="address">
												<br> <span id="erradd" style="color: red"></span>
											</div>
										</div>
										<div class="control-group">
											<label class="span2 control-label" for="inputPassword">Phone
												Number</label>
											<div class="controls">
												<input type="password" placeholder="Phone Number"
													name="phonenumber"> <br> <span id="errphone"
													style="color: red"></span>
											</div>
										</div>
										<div class="control-group">
											<div class="controls">
												<button type="submit" class="shopBtn">Click to Pay</button>
											</div>
										</div>
									</form>
								</td>
							</tr>
						</tbody>
					</table>
					<a href="/" class="shopBtn btn-large"><span
						class="icon-arrow-left"></span> Continue Shopping </a> <a
						href="login.html" class="shopBtn btn-large pull-right">Next <span
						class="icon-arrow-right"></span></a>

				</div>
			</div>
		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
	<%@include file="/include/js.jsp"%>

</body>
</html>
