<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="Entites.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from demos.wpexpand.com/html/eElectronics/single-product.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 18 Feb 2017 20:08:53 GMT -->
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
							<li><a href="EditProfile.jsp"><i class="fa fa-user"></i> My Account</a></li>
							<li><a href="#"><i class="fa fa-heart"></i> Wishlist</a></li>
							<li><a href="cart.jsp"><i class="fa fa-user"></i> My
									Cart</a></li>
							<li><a href="checkout.jsp"><i class="fa fa-user"></i>
									Checkout</a></li>
							<li><a href="Login.jsp"><i class="fa fa-user"></i> Login</a></li>
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
						
						<li><a href="cart.jsp">Cart</a></li>
						<li><a href="checkout.jsp">Checkout</a></li>
						<%
							try {
								
								HttpSession session1 = request.getSession();
								HashSet<String> categoriesList=(HashSet<String>)session1.getAttribute("categoriesList");
								
								Iterator itCategory=categoriesList.iterator();
								
								
						%>
						<li class="dropdown dropdown-small"><a data-toggle="dropdown"
							data-hover="dropdown" class="dropdown-toggle" href="#"><span
								class="key">Category<b class="caret"></b></a>
							<ul class="dropdown-menu">
							
							<%
							
							while(itCategory.hasNext()){
								String category=(String)itCategory.next();
					
							%>
								<li><a href="shop.jsp?productCategory=<%=category%> "><%=category%></a></li>
								
								
								<%}
							
							}catch(Exception e){
								
								
								e.printStackTrace();
								RequestDispatcher dispatch = request
										.getRequestDispatcher("error.jsp");
								dispatch.include(request, response);
							}
							
							
							%>
						<li ><a href="Registeration.html">Registeration</a></li>
						<li><a href="Login.jsp">Login</a></li>
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
						<h2>Shop</h2>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="single-product-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">


				<div class="col-md-8">
					<div class="product-content-right">
						<%
							try {
								int productId = Integer.parseInt(request
										.getParameter("productId"));
								System.out.println("id>>request: "+productId);
								HttpSession session1 = request.getSession();
								ArrayList<Product> productsList = (ArrayList<Product>) session1
										.getAttribute("ProductsList");
								//System.out.println(productsList);
								Iterator iterator = productsList.iterator();

								while (iterator.hasNext()) {
									Product p = (Product) iterator.next();
									System.out.println("p.getId"+p.getId());

									if (p.getId() == productId) {
										System.out.println("p.getId"+p.getId());
						%>


						<div class="row">
							<div class="col-sm-6">
								<div class="product-images">
									<div class="product-main-img">
										<img src="<%=p.getProductImage() %>" alt="">
									</div>

									<div class="product-gallery">
										<img src="img/product-thumb-1.jpg" alt=""> <img
											src="img/product-thumb-2.jpg" alt=""> <img
											src="img/product-thumb-3.jpg" alt=""> <img
											src="img/product-thumb-4.jpg" alt="">
									</div>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="product-inner">
									<h2 class="product-name"><%=p.getProductName() %></h2>
									<div class="product-inner-price">
										<ins><%=p.getProductPrice() %></ins>
										
									</div>

									<form action="#" class="cart">

										<button class="add_to_cart_button" type="submit">Add
											to cart</button>
									</form>



									<div role="tabpanel">
										<ul class="product-tab" role="tablist">
											<li role="presentation" class="active"><a href="#home"
												aria-controls="home" role="tab" data-toggle="tab">Description</a></li>
											<li role="presentation"><a href="#profile"
												aria-controls="profile" role="tab" data-toggle="tab">Reviews</a></li>
										</ul>
										<div class="tab-content">
											<div role="tabpanel" class="tab-pane fade in active"
												id="home">
												<h2>Product Description</h2>
												<p><%=p.getDescription() %></p>
											</div>
											<div role="tabpanel" class="tab-pane fade" id="profile">
												<h2>Reviews</h2>
												<div class="submit-review">
													<p>
														<label for="name">Name</label> <input name="name"
															type="text">
													</p>
													<p>
														<label for="email">Email</label> <input name="email"
															type="email">
													</p>
													<div class="rating-chooser">
														<p>Your rating</p>

														<div class="rating-wrap-post">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i>
														</div>
													</div>
													<p>
														<label for="review">Your review</label>
														<textarea name="review" id="" cols="30" rows="10"></textarea>
													</p>
													<p>
														<input type="submit" value="Submit">
													</p>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>

						<%
						break;}
									

								}
							} catch (Exception e) {

								e.printStackTrace();
								RequestDispatcher dispatch = request
										.getRequestDispatcher("error.jsp");
								dispatch.include(request, response);
							}
						%>

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
							<input type="email" placeholder="Type your email"> <input
								type="submit" value="Subscribe">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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

<!-- Mirrored from demos.wpexpand.com/html/eElectronics/single-product.jsp by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 18 Feb 2017 20:08:53 GMT -->
</html>