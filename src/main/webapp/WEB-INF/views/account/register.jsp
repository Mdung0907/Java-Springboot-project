<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Twitter Bootstrap shopping cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<%@include file="/include/head.jsp"%>
<style type="text/css">
*[id$=errors] {
	color: red;
}
</style>
<script type="text/javascript">
	function Validatedata() {
		var password = document.frmRegister.password.value;
		var confilm = document.frmRegister.confirm.value;
		if (confilm == '') {
			document.getElementById("errconfirm").innerHTML = "Confirm Password cannot be left blank"
			return false;
		} else if (confilm != password) {
			document.getElementById("errconfirm").innerHTML = "Confirm Password the password must match the password"
			return false;
		} else {
			return true;
		}
	}
</script>
</head>
<body>
	<%@include file="/include/header.jsp"%>
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
				<ul class="nav nav-list promowrapper">
					<li>
						<div class="thumbnail">
							<a class="zoomTool" href="product_details.html"
								title="add to cart"><span class="icon-search"></span> QUICK
								VIEW</a> <img src="assets/img/bootstrap-ecommerce-templates.png"
								alt="bootstrap ecommerce templates">
							<div class="caption">
								<h4>
									<a class="defaultBtn" href="product_details.html">VIEW</a> <span
										class="pull-right">$22.00</span>
								</h4>
							</div>
						</div>
					</li>
					<li style="border: 0">&nbsp;</li>
					<li>
						<div class="thumbnail">
							<a class="zoomTool" href="product_details.html"
								title="add to cart"><span class="icon-search"></span> QUICK
								VIEW</a> <img src="assets/img/shopping-cart-template.png"
								alt="shopping cart template">
							<div class="caption">
								<h4>
									<a class="defaultBtn" href="product_details.html">VIEW</a> <span
										class="pull-right">$22.00</span>
								</h4>
							</div>
						</div>
					</li>
					<li style="border: 0">&nbsp;</li>
					<li>
						<div class="thumbnail">
							<a class="zoomTool" href="product_details.html"
								title="add to cart"><span class="icon-search"></span> QUICK
								VIEW</a> <img src="assets/img/bootstrap-template.png"
								alt="bootstrap template">
							<div class="caption">
								<h4>
									<a class="defaultBtn" href="product_details.html">VIEW</a> <span
										class="pull-right">$22.00</span>
								</h4>
							</div>
						</div>
					</li>
				</ul>

			</div>
			<div class="span9">
				<ul class="breadcrumb">
					<li><a href="index.html">Home</a> <span class="divider">/</span></li>
					<li class="active">Registration</li>
				</ul>
				<h3>Registration</h3>
				<hr class="soft" />
				<div class="well">
					<form:form class="form-horizontal" name="frmRegister"
						action="/account-register" method="post" modelAttribute="account"
						onsubmit="return Validatedata()">
						<h3>Your information</h3>
						<div class="control-group">
							<label class="control-label">Full name<sup>*</sup></label>
							<form:input path="fullname" />
							<br>
							<form:errors path="fullname"></form:errors>
						</div>
						<div class="control-group">
							<label class="control-label">User name<sup>*</sup></label>
							<form:input path="username" />
							<br>
							<form:errors path="username"></form:errors>
						</div>
						<div class="control-group">
							<label class="control-label">Password<sup>*</sup></label>
							<form:input path="password" />
							<br>
							<form:errors path="password"></form:errors>
						</div>
						<div class="control-group">
							<label class="control-label">Confirm Password<sup>*</sup></label>
							<input name="confirm"
								style="border: 1px solid #cccccc; height: 20px; padding: 4px 6px; margin-bottom: 10px; font-size: 14px; line-height: 20px; color: #555555; vertical-align: middle; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px;" />
							<br> <span id="errconfirm" style="color: red"></span>
						</div>
						<div class="control-group">
							<label class="control-label">Email<sup>*</sup></label>
							<form:input path="email" />
							<br>
							<form:errors path="email"></form:errors>
						</div>
						<div class="control-group">
							<div class="controls">
								<input type="submit" name="submitAccount" value="Register"
									class="exclusive shopBtn">
							</div>
						</div>
					</form:form>
				</div>




			</div>
		</div>
	</div>
	<%@include file="/include/footer.jsp"%>
	<%@include file="/include/js.jsp"%>
</body>
</html>
