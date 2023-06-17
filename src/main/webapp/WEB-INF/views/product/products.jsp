<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Twitter Bootstrap shopping cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
</head>
<body>
	<div class="container">
		<div class="row">
			<div id="sidebar" class="span3">
				<div class="well well-small">
					<ul class="nav nav-list">
						<c:forEach var="category" items="${category }">
							<li><a href="/?categoryID=${category.id }"><span
									class="icon-chevron-right"></span>${category.tendanhmuc }</a></li>
						</c:forEach>
						<li><label id="label-1">Sort by Price:</label><select
							onchange="location = this.value;" style="width: 100%">
								<option value="/">Default</option>
								<option value="/?Sort=ASC">ASC</option>
								<option value="/?Sort=DESC">DESC</option>
						</select></li>
						<li><a class="totalInCart" href="cart.html"><strong>Total
									Amount <span class="badge badge-warning pull-right"
									style="line-height: 18px;">$448.42</span>
							</strong></a></li>
					</ul>
				</div>

				<div class="well well-small alert alert-warning cntr">
					<h2>50% Discount</h2>
					<p>
						only valid for online order. <br> <br> <a
							class="defaultBtn" href="#">Click here </a>
					</p>
				</div>
				<div class="well well-small">
					<a href="#"><img src="assets/img/paypal.jpg"
						alt="payment method paypal"></a>
				</div>
				<a class="shopBtn btn-block" href="#">Upcoming products <br>
					<small>Click to view</small></a> <br> <br>
			</div>
			<div class="span9">
				<!-- 
New Products
-->
				<div class="well well-small">
					<h3>Our Products</h3>
					<div class="row-fluid">
						<ul class="thumbnails">
							<c:forEach var="items" items="${page.content }">
								<li class="span4" style="margin: 4px">
									<div class="thumbnail">
										<a href="/product-details?id=${items.id}" class="overlay"></a>
										<a class="zoomTool" href="/product_details?id=${items.id}"
											title="add to cart"><span class="icon-search"></span>
											QUICK VIEW</a> <a href="/product_details?id=${items.id}"><img
											src="/images/${items.image}/${items.image}"></a>
										<div class="caption cntr">
											<p>${items.name}</p>
											<p>
												<strong> $${items.price }</strong>
											</p>


											<h4>
												<a class="shopBtn" id="invokesToastMessage"
													href="/addtoCart?id=${items.id }" title="add to cart">
													Add to cart </a>
											</h4>


											<br class="clr">
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div style="display: flex; justify-content: center;">
						<c:forEach var="i" begin="1" end="${page.totalPages}" step="1">
							<a
								style="text-align: center; font-size: 22px; color: black; font-weight: 600; border: 1px solid #ccc; border-radius: 5px; padding: 5px 10px; margin: 0px 5px;"
								href="/?p=${i}">${i }</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>