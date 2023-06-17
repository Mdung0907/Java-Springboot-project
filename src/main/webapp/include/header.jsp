<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="topNav">
			<div class="container">
				<div class="alignR">
					<div class="pull-left socialNw">
						<a href="#"><span class="icon-twitter"></span></a> <a href="#"><span
							class="icon-facebook"></span></a> <a href="#"><span
							class="icon-youtube"></span></a> <a href="#"><span
							class="icon-tumblr"></span></a>
					</div>
					<c:choose>
						<c:when test="${accountlogin==null}">
							<div>
								<a href="/"> <span class="icon-home"></span> Home
								</a> <a href="register"><span class="icon-edit"></span> Free
									Register </a> <a href="contact"><span class="icon-envelope"></span>
									Contact us</a>
							</div>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${accountlogin.role==true }">
									<div>
										<a href="/"> <span class="icon-home"></span> Home
										</a> <a href="/account-management"><span class="icon-user"></span>
											Management Account</a> <a href="/product-management"><span
											class="icon-user"></span> Management Product</a><a href="contact"><span
											class="icon-envelope"></span> Contact us</a> <a href="cartManagement"><span
											class="icon-shopping-cart"></span> 2 Item(s) - <span
											class="badge badge-warning"> $448.42</span></a>
									</div>
								</c:when>
								<c:otherwise>
									<div>
										<a href="/"> <span class="icon-home"></span> Home
										</a> <a href="#"><span class="icon-user"></span> My Account</a> <a
											href="contact"><span class="icon-envelope"></span>
											Contact us</a> <a href="cart"><span
											class="icon-shopping-cart"></span> 2 Item(s) - <span
											class="badge badge-warning"> $448.42</span></a>
									</div>
								</c:otherwise>
							</c:choose>

						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
	</div>

	<!--
Lower Header Section 
-->
	<div class="container">
		<div id="gototop"></div>
		<header id="header">
			<div class="row">
				<div class="span4">
					<h1>
						<a class="logo" href="index.html"><span>Twitter
								Bootstrap ecommerce template</span> <img
							src="assets/img/logo-bootstrap-shoping-cart.png"
							alt="bootstrap sexy shop"> </a>
					</h1>
				</div>
				<div class="span4">
					<div class="offerNoteWrapper">
						<h1 class="dotmark">
							<i class="icon-cut"></i> Twitter Bootstrap shopping cart HTML
							template is available @ $14
						</h1>
					</div>
				</div>
				<div class="span4 alignR">
					<p>
						<br> <strong> Support (24/7) : 0800 1234 678 </strong><br>
						<br>
					</p>
					<span class="btn btn-mini">[ 2 ] <span
						class="icon-shopping-cart"></span></span> <span
						class="btn btn-warning btn-mini">$</span> <span
						class="btn btn-mini">&pound;</span> <span class="btn btn-mini">&euro;</span>
				</div>
			</div>
		</header>

		<!--
Navigation Bar Section 
-->
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<a data-target=".nav-collapse" data-toggle="collapse"
						class="btn btn-navbar"> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
					</a>
					<div class="nav-collapse">
						<ul class="nav">
							<li class="active"><a href="/"
								style="background: none; border: none">Home </a></li>
							<li class=""><a href="list-view">List View</a></li>
							<li class=""><a href="grid-view">Grid View</a></li>



						</ul>

						<form action="/" method="get" class="navbar-search pull-left">
							<input name="keywords" value="${keywords}" type="text"
								placeholder="Search" class="search-query span2">
						</form>
						<%@include file="/WEB-INF/views/PriceRangerSearch.jsp"%>
						<c:choose>
							<c:when test="${accountlogin==null }">
								<ul class="nav pull-right">
									<li class="dropdown"><a data-toggle="dropdown"
										class="dropdown-toggle" href="#" style="margin-top: -57%"><span
											class="icon-lock"></span> Login <b class="caret"></b></a>
										<div class="dropdown-menu">
											<form class="form-horizontal loginFrm"
												action="/account-login" method="post">
												<div class="control-group">
													<input name="username" type="text" class="span2"
														id="inputEmail" placeholder="Username" name="username">
												</div>
												<div class="control-group">
													<input name="password" type="password" class="span2"
														id="inputPassword" placeholder="Password">
												</div>
												<div class="control-group">
													<label class="checkbox"> <input type="checkbox"
														name="remember" value="true"> Remember me
													</label>
													<a href="/forgotPassword">Forgot Password</a>
													<button type="submit" class="shopBtn btn-block">Sign
														in</button>
												</div>
											</form>
										</div></li>
								</ul>
							</c:when>
							<c:otherwise>

								<ul class="nav pull-right">
									<li class="dropdown"><a data-toggle="dropdown"
										class="dropdown-toggle" href="#" style="margin-top: -50px"><span
											class="icon-lock"></span> ${accountlogin.fullname } <b
											class="caret"></b></a>
										<div class="dropdown-menu">
											<form class="form-horizontal loginFrm">
												<div class="control-group">
													<a href="/ViewOrders">View Order</a>
												</div>
												<div class="control-group">
													<a href="/History">View History</a>
												</div>
												<div class="control-group">
													<a href="/logout">Log out</a>
												</div>

											</form>
										</div></li>
								</ul>

							</c:otherwise>
						</c:choose>

					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>