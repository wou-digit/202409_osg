<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact</title>
</head>
<body>
	<header>
		<h2>Contact Us - OneStopGroceries</h2>
		<p>Thank you for visiting Locate Me! @OneStopGroceries We're here to help with any questions, feedback, or assistance you may need. Feel free to reach out to us through any of the methods below.</p>
	</header>
	<section class="content-support">
		<h2>Customer Support</h2>
		<p>For general inquiries, store information, or assistance with locating a store, our customer support team is available to help.</p>
		<ul>
			<li>Phone: +1 (800) 123-4567</li>
			<li>Email: support@onestopgroceries.com</li>
			<li>Hours: Monday - Friday, 8:00 AM - 8:00 PM</li>
		</ul>
	</section>
	<section class="content-social">
		<h2>Connect with Us on Social Media</h2>
		<p>Stay updated with our latest store openings, promotions, and community events. Follow us on our social media channels:</p>
		<ul>
			<li>Facebook: facebook.com/OneStopGroceries</li>
			<li>Twitter: twitter.com/OneStopGroceries</li>
			<li>Instagram: instagram.com/OneStopGroceries</li>
		</ul>
	</section>
	<section class="content-form">
		<h2>Feedback Form</h2>
		<form action="/feedback" method="post" modelattribute="feedbackform">
			<div class="form-group">
				<label>Your Name:</label>
				<input type="text" name="name" required />
			</div>
			<div class="form-group">
				<label>Email Address:</label>
				<input type="email" name="email" required />
			</div>
			<div class="form-group">
				<label>Message:</label>
				<input type="textarea" name="message" required />
			</div>
			<div class="form-group">
				<button type="submit">Submit</button>
			</div>
		</form>
	</section>
	<section class="content-end">
		<p>Thank you for choosing One Stop Groceries. We’re here to help make your shopping experience as easy and enjoyable as possible!</p>
	</section>
</body>
</html>