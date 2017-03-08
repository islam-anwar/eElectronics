<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="Entites.Product"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from demos.wpexpand.com/html/eElectronics/ by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 18 Feb 2017 20:07:29 GMT -->
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
						<li class="active"><a href="index-2.jsp">Home</a></li>
						<li><a href="shop.jsp">Shop page</a></li>
						
						<%if(session.getAttribute("logedin")!=null)
						{
							if(session.getAttribute("logedin").equals("user"))
							{
							
							%>

						<li><a href="cart.jsp">Cart</a></li>
						<li><a href="checkout.jsp">Checkout</a></li>
						
						<%} 
						}%>
						<%
							try {
								RequestDispatcher dispatch = request
										.getRequestDispatcher("/ViewProducts");
								dispatch.include(request, response);

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
										dispatch.forward(request, response);
									}
								%>
							</ul></li>
							<%if(session.getAttribute("logedin")!=null)
						{
							if(session.getAttribute("logedin").equals("user"))
							{
							
							%>

						<li><a href="http://localhost:8080/eElectronics/LogOutServlet">Log Out</a></li>
						
						<%} 
						}%>
							
							<%if(session.getAttribute("logedin")==null)
							{
								%>
					<li ><a href="Registeration.html">Registeration</a></li>
						<li><a href="Login.jsp">Login</a></li>
						<%} %>
						
							<%if(session.getAttribute("logedin")!=null)
						{
							if(session.getAttribute("logedin").equals("admin"))
							{
							
							%>

						<li><a href="Admin_home.jsp">Admin Home</a></li>
						<li><a href="http://localhost:8080/eElectronics/LogOutServlet">Log Out</a></li>
						
						<%} 
						}%>
				</div>
			</div>
		</div>
	</div>
	<!-- End mainmenu area -->

	<div class="slider-area">
		<div class="zigzag-bottom"></div>
		<div id="slide-list" class="carousel carousel-fade slide"
			data-ride="carousel">

			<div class="slide-bulletz">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<ol class="carousel-indicators slide-indicators">
								<li data-target="#slide-list" data-slide-to="0" class="active"></li>
								<li data-target="#slide-list" data-slide-to="1"></li>
								<li data-target="#slide-list" data-slide-to="2"></li>
							</ol>
						</div>
					</div>
				</div>
			</div>

			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<div class="single-slide">
						<div class="slide-bg slide-one"></div>
						<div class="slide-text-wrapper">
							<div class="slide-text">
								<div class="container">
									<div class="row">
										<div class="col-md-6 col-md-offset-6">
											<div class="slide-content">
												<h2>We are awesome</h2>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing
													elit. Consequuntur, dolorem, excepturi. Dolore aliquam
													quibusdam ut quae iure vero exercitationem ratione!</p>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing
													elit. Modi ab molestiae minus reiciendis! Pariatur ab
													rerum, sapiente ex nostrum laudantium.</p>
												<a href="#" class="readmore">Learn more</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="single-slide">
						<div class="slide-bg slide-two"></div>
						<div class="slide-text-wrapper">
							<div class="slide-text">
								<div class="container">
									<div class="row">
										<div class="col-md-6 col-md-offset-6">
											<div class="slide-content">
												<h2>We are great</h2>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing
													elit. Saepe aspernatur, dolorum harum molestias tempora
													deserunt voluptas possimus quos eveniet, vitae voluptatem
													accusantium atque deleniti inventore. Enim quam placeat
													expedita! Quibusdam!</p>
												<a href="#" class="readmore">Learn more</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="single-slide">
						<div class="slide-bg slide-three"></div>
						<div class="slide-text-wrapper">
							<div class="slide-text">
								<div class="container">
									<div class="row">
										<div class="col-md-6 col-md-offset-6">
											<div class="slide-content">
												<h2>We are superb</h2>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing
													elit. Dolores, eius?</p>
												<p>Lorem ipsum dolor sit amet, consectetur adipisicing
													elit. Deleniti voluptates necessitatibus dicta recusandae
													quae amet nobis sapiente explicabo voluptatibus rerum nihil
													quas saepe, tempore error odio quam obcaecati suscipit
													sequi.</p>
												<a href="#" class="readmore">Learn more</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- End slider area -->

	<div class="promo-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row"></div>
		</div>
	</div>
	<!-- End promo area -->

	<div class="maincontent-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="latest-product">
						<h2 class="section-title">Latest Products</h2>
						<div class="product-carousel">

							<%
								try {

									RequestDispatcher dispatch = request
											.getRequestDispatcher("/ProductsOrderd");
									dispatch.include(request, response);
									HashSet<Integer> productsOrderdList = (HashSet<Integer>) session
											.getAttribute("productsOrderdList");

									Iterator itProductsOrdered = productsOrderdList.iterator();
									ArrayList<Product> productsList = (ArrayList<Product>) session
											.getAttribute("ProductsList");
									

									while (itProductsOrdered.hasNext()) {
										int productId = (Integer) itProductsOrdered.next();
										Iterator iterator = productsList.iterator();
										while (iterator.hasNext()) {
											
											Product p = (Product) iterator.next();
											if (p.getId() == productId) {
							%>




							<div class="single-product">
								<div class="product-f-image">
									<img src="<%=p.getProductImage()%>" alt="">
									<div class="product-hover">
									<%if(session.getAttribute("logedin")!=null){
										
										if(session.getAttribute("logedin").equals("user"))
										{
										
										
										
										%>
									
										<a href="http://localhost:8080/eElectronics/AddToCartServlet?productId=<%=p.getId()%> " class="add-to-cart-link"><i
											class="fa fa-shopping-cart"></i> Add to cart</a>
											
											<%}
										}%>
											
											 <a
											href="single-product.jsp?productId=<%=p.getId()%>"
											class="view-details-link"><i class="fa fa-link"></i> See
											details</a>
									</div>
								</div>

								<h2>
									<a href="single-product.jsp?productId=<%=p.getId()%>"><%=p.getProductName()%></a>
								</h2>

								<div class="product-carousel-price">
									<ins><%=p.getProductPrice()%></ins>
								</div>
							</div>

							<%
								}
										}
									}
								} catch (Exception e) {

									e.printStackTrace();
									RequestDispatcher dispatch = request
											.getRequestDispatcher("error.jsp");
									dispatch.forward(request, response);

								}
							%>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End main content area -->

	<div class="brands-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="brand-wrapper">
						<h2 class="section-title">Brands</h2>
						<div class="brand-list">
							<img src="img/services_logo__1.jpg" alt=""> <img
								src="img/services_logo__2.jpg" alt=""> <img
								src="img/services_logo__3.jpg" alt=""> <img
								src="img/services_logo__4.jpg" alt=""> <img
								src="img/services_logo__1.jpg" alt=""> <img
								src="img/services_logo__2.jpg" alt=""> <img
								src="img/services_logo__3.jpg" alt=""> <img
								src="img/services_logo__4.jpg" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End brands area -->

	<div class="product-widget-area">
		<div class="zigzag-bottom"></div>
		<div class="container">
			<div class="row"></div>
		</div>
	</div>
	<!-- End product widget area -->

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

<!-- Mirrored from demos.wpexpand.com/html/eElectronics/ by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 18 Feb 2017 20:08:36 GMT -->
</html>