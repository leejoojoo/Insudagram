<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<script>
	$(".tm-text-white").removeClass("active");
	$(".myPageBtn").addClass("active")
</script>


<main class="SCxLW  o64aR" role="main">
<div class="BvMHM EzUlV">
	<ul class="wW1cu">
		<li><a class="h-aRd -HRM- " style="border-left: none; font-weight: 200;" href="<%= request.getContextPath() %>/editProfile">프로필 편집</a></li>
		<li><a class="h-aRd  fuQUr" style="border-left: 2px solid; font-weight: 600;" href="<%= request.getContextPath() %>/changePassword">비밀번호
				변경</a></li>
	</ul>
	<article class="PVkFi">
		<div class="C_9MP">
			<div class="LqNQc">
				<div class="M-jxE">
					<button class="IalUJ " title="프로필 사진 추가">
						<<img alt="프로필 사진 추가" class="be6sR"
							src="resources/image/${myPictureAndId.m_picture }" name="m_picture"> 
							<!-- https://instagram.fisb5-1.fna.fbcdn.net/vp/952cda0aaecf724403d1da985c1dcf84/5DA39AF1/t51.2885-19/44884218_345707102882519_2446069589734326272_n.jpg?_nc_ht=instagram.fisb5-1.fna.fbcdn.net -->
					</button>
					<div>
						<form enctype="multipart/form-data" method="POST"
							role="presentation">
							<input accept="image/jpeg,image/png" class="tb_sK" type="file">
						</form>
					</div>
				</div>
			</div>
			<div class="XX1Wc">
				<h1 class="kHYQv " title="jjjindong">${myPictureAndId.m_id }</h1>
			</div>
		</div>
		<form action="<%= request.getContextPath() %>/submitNewPassword" class="kWXsT" method="POST">
			<div class="eE-OA">
				<aside class="sxIVS  ">
					<label for="pepName">이전 비밀번호</label>
				</aside>
				<div class="ada5V">
					<input class="JLJ-B zyHYP" aria-required="false" id="pepName" name="old_password"
						type="text" value="">
				</div>
			</div>
			<div class="eE-OA">
				<aside class="sxIVS  ">
					<label for="pepUsername">새 비밀번호</label>
				</aside>
				<div class="ada5V">
					<input class="JLJ-B zyHYP" aria-required="true" id="pepUsername" name="new_password"
						type="text" value="">
				</div>
			</div>
			<div class="eE-OA">
				<aside class="sxIVS  ">
					<label for="pepWebsite">새 비밀번호 확인</label>
				</aside>
				<div class="ada5V">
					<input class="JLJ-B zyHYP" aria-required="false" id="pepWebsite"
						type="text"
						value="" name="m_password">
				</div>
			</div>
			<div class="eE-OA">
				<aside class="sxIVS  tvweK">
					<label></label>
				</aside>
				<div class="ada5V">
					<div class="fi8zo">
						<button class="_0mzm- sqdOP  L3NKy       "
							type="submit">비밀번호 변경</button>
					</div>
				</div>
			</div>
		</form>
	</article>
</div>
</main>