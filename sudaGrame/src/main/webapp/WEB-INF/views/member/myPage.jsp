<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(".nav-item").removeClass("active");
	$(".nav-link").removeClass("active");
	$(".myPageBtn").parents().addClass("active");
	$(".myPageBtn").addClass("active");
	
	$(document).ready(function(){
		console.log("${ imglist.size() }");
	});
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<main class="SCxLW  o64aR" role="main">
<div class="v9tJq VfzDr">
	<header class="vtbgv ">
	<div class="XjzKX">
		<div class="_4dMfM">
			<div class="M-jxE">
				<button class="IalUJ " title="프로필 사진 추가">
					<img alt="프로필 사진 추가" class="be6sR"
						src="${IDAndProfilePicture.m_picture }">
				</button>
				<div>
					<form enctype="multipart/form-data" method="POST"
						role="presentation">
						<input accept="image/jpeg,image/png" class="tb_sK" type="file">
					</form>
				</div>
			</div>
		</div>
	</div>
	<section class="zwlfE">
	<div class="nZSzR">
		<h1 class="_7UhW9       fKFbl yUEEX   KV-D4            fDxYl     ">${IDAndProfilePicture.m_id }님</h1>
		<a class="thEYr " href="editProfile.htm"><button
				class="_0mzm- sqdOP  L3NKy _4pI4F  _8A5w5    " type="button">프로필
				편집</button></a>
		<div class="AFWDX">
			<button class="dCJp8 afkep _0mzm-">
				<span class="glyphsSpriteSettings__outline__24__grey_9 u-__7"
					aria-label="옵션"></span>
			</button>
		</div>
	</div>
	<ul class="k9GMp ">
		<li class="Y8-fY "><span class="-nal3 ">게시물 <span
				class="g47SY ">${NOP }</span></span></li>
		<li class="Y8-fY "><a class="-nal3 " href="/jjjindong/followers/">팔로워
				<span class="g47SY " title="104">${follower }</span>
		</a></li>
		<li class="Y8-fY "><a class="-nal3 " href="/jjjindong/following/">팔로우
				<span class="g47SY ">${following }</span>
		</a></li>
	</ul>
	<div class="-vDIg">
		<a class="yLUwa"
			href="https://l.instagram.com/?u=https%3A%2F%2Fm.blog.naver.com%2FPostList.nhn%3FblogId%3Dwlsehdgus23&amp;e=ATOlzhnZCqHCA3VXLRQk0IiQLs0_-nezxAa5KfgIIlCN9DFIfCNN8kbufXEXxV4zpjbL0FpGpiFwW_Q6"
			rel="me nofollow noopener noreferrer" target="_blank">${IDAndProfilePicture.m_website }</a>
	</div>
	</section> </header>

	<div class=" _2z6nI">
		<article class="FyNDV">
		<div>
			<div
				style="flex-direction: column; padding-bottom: 0px; padding-top: 0px;">
				<div class="Nnq7C weEfm">
				<c:forEach var="images" items="${imglist }">
					<div class="v1Nh3 kIKUG  _bz0w">
						<a href="/p/BxgXMlVAvdF6VnTXyz2gapLLEgKf4Tdln3WsVQ0/">
							<div class="eLAPa">
								<div class="KL4Bh" style="background: white">
									<img alt="사진 설명이 없습니다." class="FFVAD" decoding="auto"
										sizes="293.0062255859375px"
										src="${images.img_img }"
										style="object-fit: cover; width: 400px; height: 400px; align-content: center;">
								</div>
								<div class="_9AhH0"></div>
							</div></a>
					</div>
					</c:forEach>

<%-- 
				<c:forEach items="${ imglist }" var="imglist" varStatus="status">
					<c:if test="${ status.index % 3 eq 0 }">
						<div class="Nnq7C weEfm">
					</c:if>
						<div class="v1Nh3 kIKUG  _bz0w">
							<a href="/p/BxgXMlVAvdF6VnTXyz2gapLLEgKf4Tdln3WsVQ0/">
								<div class="eLAPa">
									<div class="KL4Bh">
										<img alt="사진 설명이 없습니다." class="FFVAD" decoding="auto"
											sizes="293.0062255859375px" src="${imglist.img_img }"
										style="object-fit: cover; width: 400px; height: 400px; align-content: center;">
									</div>
									<div class="_9AhH0"></div>
								</div>
							</a>
						</div>

 --%>
					<!-- 
					<div class="v1Nh3 kIKUG  _bz0w">
						<a href="/p/BuYG-a7BcBSSO_KDNE_h8CwiKwsrCLX4N2qYpc0/">
							<div class="eLAPa">
								<div class="KL4Bh">
									<img alt="이미지: 전화" class="FFVAD" decoding="auto"
										sizes="293.0062255859375px"
										srcset="https://scontent-icn1-1.cdninstagram.com/vp/2fedde1e838daeee3756080097f7ded4/5DAC7604/t51.2885-15/e35/s150x150/51487302_2216033385085117_4472134657555984683_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 150w,https://scontent-icn1-1.cdninstagram.com/vp/de6cab485986a8231e9ca7edc3fe04ae/5DAE7602/t51.2885-15/e35/s240x240/51487302_2216033385085117_4472134657555984683_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 240w,https://scontent-icn1-1.cdninstagram.com/vp/0e941398ac66b52707585acaee9a94de/5DB87D7C/t51.2885-15/e35/s320x320/51487302_2216033385085117_4472134657555984683_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 320w,https://scontent-icn1-1.cdninstagram.com/vp/ba5f28fa73844289de1419c3f86a3034/5DAF923B/t51.2885-15/e35/s480x480/51487302_2216033385085117_4472134657555984683_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 480w,https://scontent-icn1-1.cdninstagram.com/vp/0a637bd3d9415a2a1b8572216f6795ff/5DA86481/t51.2885-15/sh0.08/e35/s640x640/51487302_2216033385085117_4472134657555984683_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 640w"
										src="https://scontent-icn1-1.cdninstagram.com/vp/0a637bd3d9415a2a1b8572216f6795ff/5DA86481/t51.2885-15/sh0.08/e35/s640x640/51487302_2216033385085117_4472134657555984683_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
										style="object-fit: cover;">
								</div>
								<div class="_9AhH0"></div>
							</div></a>
					</div>
					
					<div class="v1Nh3 kIKUG  _bz0w">
						<a href="/p/BspV2aGB6kLoZUdxsLQsHvqYkdx-Xr9mxGJb-40/">
							<div class="eLAPa">
								<div class="KL4Bh">
									<img alt="이미지: 사람 1명 이상" class="FFVAD" decoding="auto"
										sizes="293.0062255859375px"
										srcset="https://scontent-icn1-1.cdninstagram.com/vp/4e9e04c7aee8a362c7e717f3bffef426/5DBFA8BD/t51.2885-15/e35/s150x150/49389864_305295913453020_4792620570044996961_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 150w,https://scontent-icn1-1.cdninstagram.com/vp/30e661b6681d8f1bbb791eef1b050224/5DBF0EF7/t51.2885-15/e35/s240x240/49389864_305295913453020_4792620570044996961_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 240w,https://scontent-icn1-1.cdninstagram.com/vp/e5800e4182cfbca2576def797722316f/5DBAAF4D/t51.2885-15/e35/s320x320/49389864_305295913453020_4792620570044996961_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 320w,https://scontent-icn1-1.cdninstagram.com/vp/45a276c9440a0678b1a708164ca70320/5DC64A17/t51.2885-15/e35/s480x480/49389864_305295913453020_4792620570044996961_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 480w,https://scontent-icn1-1.cdninstagram.com/vp/315c4f4d78469be41f8bb7bbe5925e79/5DC02E1A/t51.2885-15/sh0.08/e35/s640x640/49389864_305295913453020_4792620570044996961_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 640w"
										src="https://scontent-icn1-1.cdninstagram.com/vp/315c4f4d78469be41f8bb7bbe5925e79/5DC02E1A/t51.2885-15/sh0.08/e35/s640x640/49389864_305295913453020_4792620570044996961_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
										style="object-fit: cover;">
								</div>
								<div class="_9AhH0"></div>
							</div></a>
					</div>
					 -->
					<%-- <c:if test="${ status.index % 3 eq 2 }"> --%>
			</div>
			<%-- </c:if>
			</c:forEach> --%>
		</div>
	</div>
	</article>
</div>
</div>
</main>