<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>수다스타그램</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400"
	rel="stylesheet">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/fontawesome-all.min.css" rel="stylesheet">
<link href="resources/LoginAndSignupPage.css/e00d4ae1ffc1.css" rel="stylesheet">
<link href="resources/LandingPage.css/4b3e46257190.css" rel="stylesheet">

<link href="resources/ActivityFeedBox.css/17ec9848762e.css"
	rel="stylesheet">
<link href="resources/Consumer.css/366aad278e6b.css?ver=0" rel="stylesheet">
<link href="resources/ConsumerAsyncCommons.css/6f451cfba8c9.css?var=1"
	rel="stylesheet">
<link href="resources/ConsumerUICommons.css/f054ce685064.css?var=1"
	rel="stylesheet">
<link href="resources/FeedPageContainer.css/35396b34c42a.css"
	rel="stylesheet">
<link href="resources/ProfilePageContainer.css/65ee22995797.css?var=1"
	rel="stylesheet">
<link href="resources/SettingsModules.css/d4d7e200015b.css"
	rel="stylesheet">
<link href="resources/css/tooplate-style.css?var=1" rel="stylesheet">
<script>
	var renderPage = true;

	if (navigator.userAgent.indexOf('MSIE') !== -1
			|| navigator.appVersion.indexOf('Trident/') > 0) {
		/* Microsoft Internet Explorer detected in. */
		alert("Please view this in a modern browser such as Chrome or Microsoft Edge.");
		renderPage = false;
	}
</script>

</head>

<body class="loaded">

	<!-- Loader -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>

	<div class="tm-main">
		<!-- hader -->
		<tiles:insertAttribute name="header" />
		<div class="container" style="margin-top:30px">
			<!-- contnet -->
		<tiles:insertAttribute name="content" />
		</div>
	</div>
	<tiles:insertAttribute name="footer" />
	<!-- load JS -->
	<!-- https://jquery.com/ -->
	<script>
		/* DOM is ready
		------------------------------------------------*/
		$(function() {

			if (renderPage) {
				$('body').addClass('loaded');
			}

			$('.tm-current-year').text(new Date().getFullYear()); // Update year in copyright
		});
	</script>

</body>
</html>