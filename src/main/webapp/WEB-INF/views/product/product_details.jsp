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
	<!-- 
	Upper Header Section 
-->

	<!-- 
Body Section 
-->
<c:set var="items" value="${details}"></c:set>
	<div class="container">
		<div class="row">
			<div id="sidebar" class="span3">
				<div class="well well-small">
					<ul class="nav nav-list">
						<li><a href="products.html"><span
								class="icon-chevron-right"></span>Fashion</a></li>
						<li><a href="products.html"><span
								class="icon-chevron-right"></span>Watches</a></li>
						<li><a href="products.html"><span
								class="icon-chevron-right"></span>Fine Jewelry</a></li>
						<li><a href="products.html"><span
								class="icon-chevron-right"></span>Fashion Jewelry</a></li>
						<li><a href="products.html"><span
								class="icon-chevron-right"></span>Engagement & Wedding</a></li>
						<li><a href="products.html"><span
								class="icon-chevron-right"></span>Men's Jewelry</a></li>
						<li><a href="products.html"><span
								class="icon-chevron-right"></span>Vintage & Antique</a></li>
						<li><a href="products.html"><span
								class="icon-chevron-right"></span>Loose Diamonds </a></li>
						<li><a href="products.html"><span
								class="icon-chevron-right"></span>Loose Beads</a></li>
						<li><a href="products.html"><span
								class="icon-chevron-right"></span>See All Jewelry & Watches</a></li>
						<li style="border: 0">&nbsp;</li>
						
					</ul>
				</div>


					

			</div>
			<div class="span9">
				<ul class="breadcrumb">
					<li><a href="index.html">Home</a> <span class="divider">/</span></li>
					<li><a href="products.html">Items</a> <span class="divider">/</span></li>
					<li class="active">Preview</li>
				</ul>
				<div class="well well-small">
					<div class="row-fluid">
						<div class="span5">
							<div id="myCarousel" class="carousel slide cntr">
								<div class="carousel-inner">
									<div class="item active">
										<a href="#"> <img src="/images/${items.get().image}/${items.get().image}" alt=""
											style="width: 100%"></a>
									</div>
								</div>
								<a class="left carousel-control" href="#myCarousel"
									data-slide="prev">‹</a> <a class="right carousel-control"
									href="#myCarousel" data-slide="next">›</a>
							</div>
						</div>
						<div class="span7">
							<h3>${items.get().name}</h3>
							<hr class="soft" />

							<form class="form-horizontal qtyFrm">
								<div class="control-group">
									<label class="control-label"><span>$${items.get().price}</span></label>
									<div class="controls">
										<input type="number" class="span6" placeholder="Qty.">
									</div>
								</div>

								<div class="control-group">
									<label class="control-label"><span>Color</span></label>
									<div class="controls">
										<select class="span11">
											<option>Red</option>
											<option>Purple</option>
											<option>Pink</option>
											<option>Red</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><span>Materials</span></label>
									<div class="controls">
										<select class="span11">
											<option>Material 1</option>
											<option>Material 2</option>
											<option>Material 3</option>
											<option>Material 4</option>
										</select>
									</div>
								</div>
								<h4>${items.get().quantity } items in stock</h4>
								<p>${items.get().description }
								<p>
									<button type="submit" class="shopBtn">
										<span class=" icon-shopping-cart"></span> Add to cart
									</button>
							</form>
						</div>
					</div>
					
						</div>
					</div>

				</div>
			</div>


	<%@include file="/include/footer.jsp"%>
	<%@include file="/include/js.jsp"%>
</body>
</html>