
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="Entites.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from demos.wpexpand.com/html/eElectronics/cart.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 18 Feb 2017 20:08:48 GMT -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>eElectronics - HTML eCommerce Template</title>

<!-- Google Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,100'
	rel='stylesheet' type='text/css'>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/responsive.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	<div class="header-area">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="user-menu">
						<ul>
							<%if(session.getAttribute("logedin")!=null){
							%>
						
							<li><a href="EditProfile.jsp"><i class="fa fa-user"></i> My Account</a></li>
							
							<li><a href="cart.jsp"><i class="fa fa-user"></i> My
									Cart</a></li>
							<li><a href="checkout.jsp"><i class="fa fa-user"></i>
									Checkout</a></li>
									<%} %>
							<li><a href="#"><i class="fa fa-user"></i> Login</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-4">
					<div class="header-right">
						<ul class="list-unstyled list-inline">
							<li class="dropdown dropdown-small"><a
								data-toggle="dropdown" data-hover="dropdown"
								class="dropdown-toggle" href="#"><span class="key">currency
										:</span><span class="value">USD </span><b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a href="#">USD</a></li>
									<li><a href="#">INR</a></li>
									<li><a href="#">GBP</a></li>
								</ul></li>

							<li class="dropdown dropdown-small"><a
								data-toggle="dropdown" data-hover="dropdown"
								class="dropdown-toggle" href="#"><span class="key">language
										:</span><span class="value">English </span><b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a href="#">English</a></li>
									<li><a href="#">French</a></li>
									<li><a href="#">German</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End header area -->

	<div class="site-branding-area">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="logo">
						<h1>
							<a href="index-2.jsp">e<span>Electronics</span></a>
						</h1>
					</div>
				</div>

				<div class="col-sm-6">
					<div class="shopping-item">
						<a href="cart.jsp">Cart - <span class="cart-amunt">$800</span>
							<i class="fa fa-shopping-cart"></i> <span class="product-count">5</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End site branding area -->

	<div class="mainmenu-area">
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">

						<li><a href="index-2.jsp">Home</a></li>
						<li><a href="shop.jsp">Shop page</a></li>

						<li class="active"><a href="cart.jsp">Cart</a></li>
						<li><a href="checkout.jsp">Checkout</a></li>
						<%
							try {

								HttpSession session1 = request.getSession();
								HashSet<String> categoriesList = (HashSet<String>) session1
										.getAttribute("categoriesList");

								Iterator itCategory = categoriesList.iterator();
						%>
						<li class="dropdown dropdown-small"><a data-toggle="dropdown"
							data-hover="dropdown" class="dropdown-toggle" href="#"><span
								class="key">Category<b class="caret"></b></a>
							<ul class="dropdown-menu">

								<%
									while (itCategory.hasNext()) {
											String category = (String) itCategory.next();
								%>
								<li><a href="shop.jsp?productCategory=<%=category%> "><%=category%></a></li>


								<%
									}

									} catch (Exception e) {

										e.printStackTrace();
										RequestDispatcher dispatch = request
												.getRequestDispatcher("error.jsp");
										dispatch.include(request, response);
									}
								%>
							</ul></li>
					
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End mainmenu area -->

	<div class="product-big-title-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="product-bit-title text-center">
						<h2>Shopping Cart</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Page title area -->


	<div class="single-product-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">


				<div class="col-md-8">
					<div class="product-content-right">
						<div class="woocommerce">
							<form method="post" action="http://localhost:8080/eElectronics/UpdateCart">
								<table cellspacing="0" class="shop_table cart">
									<thead>
										<tr>
											<th class="product-remove">&nbsp;</th>
											<th class="product-thumbnail">&nbsp;</th>
											<th class="product-name">Product</th>
											<th class="product-price">Price</th>
											<th class="product-quantity">Quantity</th>
											<th class="product-subtotal">Total</th>
											<th class="product-subtotal">Delete Item</th>
										</tr>
									</thead>
									<tbody>
										<%double total=0;
											try {
												int i=1;
												
												
												ArrayList<ProductCount> pContList=(ArrayList<ProductCount>)session
														.getAttribute("productCountList");
												

												ArrayList<Product> productsList = (ArrayList<Product>) session
														.getAttribute("ProductsList");
												

												HashSet<String> productIdHaseSet = (HashSet<String>) session
														.getAttribute("productsIdHashSet");
												Iterator pCListIterator=pContList.iterator();
												Iterator productIdSetIterator = productIdHaseSet.iterator();

												while (productIdSetIterator.hasNext()&&pCListIterator.hasNext()) {
													
													ProductCount pCount=(ProductCount)pCListIterator.next();
													int count=pCount.getProductCount();
													String pId=(String)productIdSetIterator.next();
													int productId = Integer.parseInt(pId);
													//Iterator orderCartItertor=orderCartList.iterator();
													
											
													
													Iterator productItrator = productsList.iterator();
													

													while (productItrator.hasNext()) {

														Product p = (Product) productItrator.next();
														if (p.getId() == productId) {
															total+=(p.getProductPrice())*count;
										%>
										<tr class="cart_item">
											<td class="product-remove"><a title="Remove this item"
												class="remove" href="#"><%=i++ %></a></td>

											<td class="product-thumbnail"><a
												href="single-product.jsp?productId=<%=p.getId()%>"><img width="145" height="145"
													alt="poster_1_up" class="shop_thumbnail"
													src="<%=p.getProductImage()%>"></a></td>

											<td class="product-name"><%=p.getProductName() %></td>

											<td class="product-price"><span class="amount"><%=p.getProductPrice() %></span>
											</td>

											<td class="product-quantity">
												<div class="quantity buttons_added">
													<input type="button" class="minus" value="-"> <input
														type="number" size="4" class="input-text qty text"
														title="Qty" value="<%=count %>" min="0" step="1" max="<%=p.getQuantity() %>" name="quantity"> <input
														type="button" class="plus" value="+">
												</div>
											</td>

											<td   class="product-subtotal"><span class="amount"><%=p.getProductPrice()*count %></span>
											</td>
											<td><a href="http://localhost:8080/eElectronics/DeleteItemServlet?productId=<%=p.getId()%>">DELETE</a></td>
										</tr>

										<%
											}
													}
												}
												
												session.setAttribute("totalPrice", total);
												
											} catch (Exception e) {

												e.printStackTrace();
												RequestDispatcher dispatch = request
														.getRequestDispatcher("error.jsp");
												dispatch.forward(request, response);

											}
										%>
										<tr>
											<td class="actions" colspan="3">

												<div class="cart-collaterals">
													<h2>Cart Totals</h2>

												</div>




											</td>
											<td class="actions" colspan="4">

												<div class="cart-collaterals" id="total">
													<h2><%=total %></h2>

												</div>




											</td>
										</tr>

									</tbody>
								</table>
								<div class="product-option-shop">
								
								<input type="submit" value="Udate Cart" class="add_to_cart_button">
							
						</div>
							<div class="product-option-shop">
							<a class="add_to_cart_button" data-quantity="1"
								data-product_sku="" 
								rel="nofollow"
								href="http://localhost:8080/eElectronics/CheckOutServlet"> CheckOut</a>
						</div>


							</form>




						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="footer-top-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="footer-about-us">
						<h2>
							e<span>Electronics</span>
						</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Perferendis sunt id doloribus vero quam laborum quas alias
							dolores blanditiis iusto consequatur, modi aliquid eveniet
							eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit,
							debitis, quisquam. Laborum commodi veritatis magni at?</p>
						<div class="footer-social">
							<a href="#" target="_blank"><i class="fa fa-facebook"></i></a> <a
								href="#" target="_blank"><i class="fa fa-twitter"></i></a> <a
								href="#" target="_blank"><i class="fa fa-youtube"></i></a> <a
								href="#" target="_blank"><i class="fa fa-linkedin"></i></a> <a
								href="#" target="_blank"><i class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="footer-menu">
						<h2 class="footer-wid-title">User Navigation</h2>
						<ul>
							<li><a href="#">My account</a></li>
							<li><a href="#">Order history</a></li>
							<li><a href="#">Wishlist</a></li>
							<li><a href="#">Vendor contact</a></li>
							<li><a href="#">Front page</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="footer-menu">
						<h2 class="footer-wid-title">Categories</h2>
						<ul>
							<li><a href="#">Mobile Phone</a></li>
							<li><a href="#">Home accesseries</a></li>
							<li><a href="#">LED TV</a></li>
							<li><a href="#">Computer</a></li>
							<li><a href="#">Gadets</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="footer-newsletter">
						<h2 class="footer-wid-title">Newsletter</h2>
						<p>Sign up to our newsletter and get exclusive deals you wont
							find anywhere else straight to your inbox!</p>
						<div class="newsletter-form">
							<form action="#">
								<input type="email" placeholder="Type your email"> <input
									type="submit" value="Subscribe">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End footer top area -->

	<div class="footer-bottom-area">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="copyright">
						<p>
							&copy; 2015 eElectronics. All Rights Reserved. Coded with <i
								class="fa fa-heart"></i> by <a href="http://wpexpand.com/"
								target="_blank">WP Expand</a>
						</p>
					</div>
				</div>

				<div class="col-md-4">
					<div class="footer-card-icon">
						<i class="fa fa-cc-discover"></i> <i class="fa fa-cc-mastercard"></i>
						<i class="fa fa-cc-paypal"></i> <i class="fa fa-cc-visa"></i>

					</div>

				</div>
			</div>
		</div>

	</div>
	<!-- End footer bottom area -->

	<!-- Latest jQuery form server -->
	<script src="code.jquery.com/jquery.min.js"></script>

	<!-- Bootstrap JS form CDN -->
	<script
		src="maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

	<!-- jQuery sticky menu -->
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.sticky.js"></script>

	<!-- jQuery easing -->
	<script src="js/jquery.easing.1.3.min.js"></script>

	<!-- Main Script -->
	<script src="js/main.js"></script>
</body>

<!-- Mirrored from demos.wpexpand.com/html/eElectronics/cart.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 18 Feb 2017 20:08:48 GMT -->
</html>