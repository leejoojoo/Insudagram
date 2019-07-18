<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	.nav-item:not(.active) a{
		color: white!important;
	 }
</style>
<div class="tm-welcome-section"> 
	<div class="container tm-navbar-container">
		<div class="row">
			<div class="col-xl-12">
				<nav class="navbar navbar-expand-sm">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a
						class="nav-link tm-nav-link tm-text-white  active mainBtn" href="/">Main</a>
					</li>
					<li class="nav-item"><a
						class="nav-link tm-nav-link tm-text-white myPageBtn" href="myPage">MyPage</a>
					</li>
					<li class="nav-item"><a
						class="nav-link tm-nav-link tm-text-white findBtn" href="boardAll">Board</a>${ userInfo.m_code }</li>
					
					<li class="nav-item active">
					
					<s:authorize ifNotGranted="ROLE_USER"><!-- 인증받지 않았다면 로그인 버튼을 활성화 시킨다.  -->
					<a class="nav-link tm-nav-link tm-text-white loginBtn _login" href="login">Login</a>
					</s:authorize>
					<s:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN"><!-- 둘 중 아무나 인증을 받았으면 로그아웃 버튼 활성화 시키다.  -->
					    <s:authentication property="name" var="loginUser"/>
						<a class="nav-link tm-nav-link tm-text-white loginBtn _logout" href="${pageContext.request.contextPath }/j_spring_security_logout">Logout</a><!-- 인증받은 계쩡 명 가져오기 -->
					</s:authorize>
					</li>
				</ul>
				</nav>
			</div>
		</div>
	</div>
<script>
$('._logout').on("click",function(){
	alert('로그아웃 하시겠습니까?');
})
</script>
	<div class="container text-center tm-welcome-container">
		<div class="tm-welcome">
			<h1 class="text-uppercase mb-3 tm-site-name">수다스타그램</h1>
		</div>
	</div>

</div>