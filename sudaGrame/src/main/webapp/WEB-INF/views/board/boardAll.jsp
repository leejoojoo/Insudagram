<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!DOCTYPE html>
<style>
	.sortBoard{
		    width: fit-content;
    		position: relative;
    		left: 100%;
    		transform: translate(-100%, 0);
    		margin-bottom: 10px;
	}
</style>
<script>
	function printBoardAll(data){
		var Bigdiv;
		$(".boardDiv").empty();
		$(data).each(function(index, x){
			if(index % 3 == 0)
				Bigdiv = $("<div class='Nnq7C weEfm'></div>");
			var Onediv = $("<div class='v1Nh3 kIKUG  _bz0w boardOne'></div>");
			var a = $("<a href='boardOne?b_code="+x.b_code+"'></a>");
			var div = $("<div class='eLAPa'><div class='KL4Bh'><img alt='사진 설명이 없습니다.' class='FFVAD' decoding='auto' sizes='293.0062255859375px' src="+x.img_img+" style='object-fit: cover;'></div></div>");
			a.append(div);
			if(x.img_cnt > 1){
				div = $("<div class='u7YqG'><span class='mediatypesSpriteCarousel__filled__32 u-__7' aria-label='슬라이드'></span></div>");
				a.append(div);
			}
			div = ("<div class='model' style='background-color: rgba(0, 0, 0, 0.3); display: none;'><div class='board_info'><pre>좋아요"+x.g_cnt+"		댓글 "+x.cm_cnt+"</pre></div></div>");
			a.append(div);
			Onediv.append(a);
			Bigdiv.append(Onediv);
			if(index % 3 > 0 || index == data.length)
				$(".boardDiv").append(Bigdiv);
			});
	};


	function BoardSort(sort){
		console.log(sort);
		$.ajax({
		   	url:"boardSort"
		   	,dataType:"json"
		   	,type:"post"
		   	,data: {
		   		sort:sort
		   	}
		   	,cache:false // 항상 새로 읽어오겠다.
		   	,success:function(data){
		   		// console.log(data[0].b_code);
		   		printBoardAll(data);
		   	}
		    ,error:function(){
		      alert("에러~~~~")
		     } 
		 });
	};
	
	
</script>
<script>
	$(".nav-item").removeClass("active");
	$(".nav-link").removeClass("active");
	$(".findBtn").parents().addClass("active")
	$(".findBtn").addClass("active")
	$(document).ready(function(){
		// 게시글 가져와지는지 확인
		// console.log("board_all Size = ${board_all.size()}")
		$(".boardOne").on("mouseover", function(){
			$(this).find(".model").css("display", "block");
		});
		
		$(".boardOne").on("mouseout", function(){
			$(this).find(".model").css("display", "none");
		});
		
		$(".sortBoard").on("change", function(){
			var sort = $(".sortBoard option:selected").val();
			BoardSort(sort);
		});
	});
	
	$(document).on("mouseover", ".boardOne", function(){
		$(this).find(".model").css("display", "block");
	});
	
	$(document).on("mouseout", ".boardOne", function(){
		$(this).find(".model").css("display", "none");
	});
</script>
<link href="resources/css/boardAll.css" rel="stylesheet">
<main class="SCxLW  o64aR" role="main">
<div class="BSqtQ X6NdS">
	<div class="Xt-CQ">
		<h2 class="yQ0j1">인기 계정 둘러보기</h2>
		<div
			class="      tHaIX            Igw0E     IwRSH      eGOV_         _4EzTm                                                                                                              ">
			<div
				class="                  Igw0E     IwRSH      eGOV_         _4EzTm                                                                                               g6RW6               ">
				<div class="_0T_XJ zRsZI">
					<div class="NgKI_">
						<div class="MreMs" tabindex="0" role="button"
							style="transition-duration: 0s; transform: translateX(-1600px);">
							<div class="qqm6D">
								<ul class="YlNGR"
									style="padding-left: 0px; padding-right: 24px;">
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"><div
											class="bsGjF" style="margin-left: 24px; width: 176px;">
											<div role="button" tabindex="0">
												<div
													class="pV7Qt  _6Rvw2      DPiy6          Igw0E   rBNOH        eGOV_         _4EzTm                                                                                   XfCBB            g6RW6               ">
													<a class="_2dbep qNELH kIKUG" href="/hyeonsu671/"
														style="width: 56px; height: 56px;"><img class="_6q-tv"
														src="https://scontent-icn1-1.cdninstagram.com/vp/b1d4b1eff90cf6e6c39e38f3d36ff2cd/5DB160E8/t51.2885-19/s150x150/62654837_2320864671501964_3390176433019027456_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
														alt="hyeonsu671님의 프로필 사진"></a>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                        aGBdT                                                  ">
														<a class="FPmhX notranslate wWBVx" title="hyeonsu671"
															href="/hyeonsu671/"><div
																class="                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                                              ">
																<div
																	class="_7UhW9   xLCgt       qyrsm KV-D4            fDxYl l4b0S   T0kll ">hyeonsu671</div>
															</div></a>
													</div>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                                                                          "
														style="height: 28px;">
														<div
															class="_7UhW9  PIoXz       MMzan   _0PwGv          p1tLr  l4b0S    ">lhyzzzzz님
															외 1명이 팔로우합니다</div>
													</div>
													<button class="_0mzm- sqdOP  L3NKy       " type="button">팔로우</button>
												</div>
											</div>
										</div></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"><div
											class="bsGjF" style="margin-left: 24px; width: 176px;">
											<div role="button" tabindex="0">
												<div
													class="pV7Qt  _6Rvw2      DPiy6          Igw0E   rBNOH        eGOV_         _4EzTm                                                                                   XfCBB            g6RW6               ">
													<a class="_2dbep qNELH kIKUG" href="/hanmin0811/"
														style="width: 56px; height: 56px;"><img class="_6q-tv"
														src="https://scontent-icn1-1.cdninstagram.com/vp/452dba684a59f5d9e7d32f36417384f4/5DAA52EB/t51.2885-19/s150x150/52280222_2070144736373439_3482699846870106112_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
														alt="hanmin0811님의 프로필 사진"></a>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                        aGBdT                                                  ">
														<a class="FPmhX notranslate wWBVx" title="hanmin0811"
															href="/hanmin0811/"><div
																class="                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                                              ">
																<div
																	class="_7UhW9   xLCgt       qyrsm KV-D4            fDxYl l4b0S   T0kll ">hanmin0811</div>
															</div></a>
													</div>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                                                                          "
														style="height: 28px;">
														<div
															class="_7UhW9  PIoXz       MMzan   _0PwGv          p1tLr  l4b0S    ">회원님을
															팔로우합니다</div>
													</div>
													<button class="_0mzm- sqdOP  L3NKy       " type="button">팔로우</button>
												</div>
											</div>
										</div></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"><div
											class="bsGjF" style="margin-left: 24px; width: 176px;">
											<div role="button" tabindex="0">
												<div
													class="pV7Qt  _6Rvw2      DPiy6          Igw0E   rBNOH        eGOV_         _4EzTm                                                                                   XfCBB            g6RW6               ">
													<a class="_2dbep qNELH kIKUG" href="/wolfy_jjc/"
														style="width: 56px; height: 56px;"><img class="_6q-tv"
														src="https://scontent-icn1-1.cdninstagram.com/vp/fff2c5339c2e77e8b221e7910443ab56/5DB06DDD/t51.2885-19/s150x150/60036947_433322657214693_625530538911858688_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
														alt="wolfy_jjc님의 프로필 사진"></a>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                        aGBdT                                                  ">
														<a class="FPmhX notranslate wWBVx" title="wolfy_jjc"
															href="/wolfy_jjc/"><div
																class="                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                                              ">
																<div
																	class="_7UhW9   xLCgt       qyrsm KV-D4            fDxYl l4b0S   T0kll ">wolfy_jjc</div>
															</div></a>
													</div>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                                                                          "
														style="height: 28px;">
														<div
															class="_7UhW9  PIoXz       MMzan   _0PwGv          p1tLr  l4b0S    ">mo__jung2님이
															팔로우합니다</div>
													</div>
													<button class="_0mzm- sqdOP  L3NKy       " type="button">팔로우</button>
												</div>
											</div>
										</div></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"><div
											class="bsGjF" style="margin-left: 24px; width: 176px;">
											<div role="button" tabindex="0">
												<div
													class="pV7Qt  _6Rvw2      DPiy6          Igw0E   rBNOH        eGOV_         _4EzTm                                                                                   XfCBB            g6RW6               ">
													<a class="_2dbep qNELH kIKUG" href="/junghoyoun__/"
														style="width: 56px; height: 56px;"><img class="_6q-tv"
														src="https://scontent-icn1-1.cdninstagram.com/vp/b84fc9ecd94dbffad96aa65944633ff7/5DA95EA0/t51.2885-19/s150x150/60471478_457885178358290_8726489022727192576_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
														alt="junghoyoun__님의 프로필 사진"></a>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                        aGBdT                                                  ">
														<a class="FPmhX notranslate wWBVx" title="junghoyoun__"
															href="/junghoyoun__/"><div
																class="                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                                              ">
																<div
																	class="_7UhW9   xLCgt       qyrsm KV-D4            fDxYl l4b0S   T0kll ">junghoyoun__</div>
															</div></a>
													</div>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                                                                          "
														style="height: 28px;">
														<div
															class="_7UhW9  PIoXz       MMzan   _0PwGv          p1tLr  l4b0S    ">hack_ckck님이
															팔로우합니다</div>
													</div>
													<button class="_0mzm- sqdOP  L3NKy       " type="button">팔로우</button>
												</div>
											</div>
										</div></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"><div
											class="bsGjF" style="margin-left: 24px; width: 176px;">
											<div role="button" tabindex="0">
												<div
													class="pV7Qt  _6Rvw2      DPiy6          Igw0E   rBNOH        eGOV_         _4EzTm                                                                                   XfCBB            g6RW6               ">
													<a class="_2dbep qNELH kIKUG" href="/l_young_ho_/"
														style="width: 56px; height: 56px;"><img class="_6q-tv"
														src="https://scontent-icn1-1.cdninstagram.com/vp/1ecee8235bb6fa3bb550e04f3270d911/5DB9C905/t51.2885-19/s150x150/23421859_291948267962897_3691282249245786112_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
														alt="l_young_ho_님의 프로필 사진"></a>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                        aGBdT                                                  ">
														<a class="FPmhX notranslate wWBVx" title="l_young_ho_"
															href="/l_young_ho_/"><div
																class="                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                                              ">
																<div
																	class="_7UhW9   xLCgt       qyrsm KV-D4            fDxYl l4b0S   T0kll ">l_young_ho_</div>
															</div></a>
													</div>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                                                                          "
														style="height: 28px;">
														<div
															class="_7UhW9  PIoXz       MMzan   _0PwGv          p1tLr  l4b0S    ">seunguri2님
															외 4명이 팔로우합니다</div>
													</div>
													<button class="_0mzm- sqdOP  L3NKy       " type="button">팔로우</button>
												</div>
											</div>
										</div></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"><div
											class="bsGjF" style="margin-left: 24px; width: 176px;">
											<div role="button" tabindex="0">
												<div
													class="pV7Qt  _6Rvw2      DPiy6          Igw0E   rBNOH        eGOV_         _4EzTm                                                                                   XfCBB            g6RW6               ">
													<a class="_2dbep qNELH kIKUG" href="/daeryongmun/"
														style="width: 56px; height: 56px;"><img class="_6q-tv"
														src="https://scontent-icn1-1.cdninstagram.com/vp/f67a3da343a8ac9dd10b4fa89eb9ac1a/5DA656AC/t51.2885-19/s150x150/56894588_372453776812421_5888181755139063808_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
														alt="daeryongmun님의 프로필 사진"></a>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                        aGBdT                                                  ">
														<a class="FPmhX notranslate wWBVx" title="daeryongmun"
															href="/daeryongmun/"><div
																class="                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                                              ">
																<div
																	class="_7UhW9   xLCgt       qyrsm KV-D4            fDxYl l4b0S   T0kll ">daeryongmun</div>
															</div></a>
													</div>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                                                                          "
														style="height: 28px;">
														<div
															class="_7UhW9  PIoXz       MMzan   _0PwGv          p1tLr  l4b0S    ">회원님을
															팔로우합니다</div>
													</div>
													<button class="_0mzm- sqdOP  L3NKy       " type="button">팔로우</button>
												</div>
											</div>
										</div></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"><div
											class="bsGjF" style="margin-left: 24px; width: 176px;">
											<div role="button" tabindex="0">
												<div
													class="pV7Qt  _6Rvw2      DPiy6          Igw0E   rBNOH        eGOV_         _4EzTm                                                                                   XfCBB            g6RW6               ">
													<a class="_2dbep qNELH kIKUG" href="/gimgweonsu6996/"
														style="width: 56px; height: 56px;"><img class="_6q-tv"
														src="https://scontent-icn1-1.cdninstagram.com/vp/d66c9d1107ee5a53ab67a7fc5bc91928/5DBD6020/t51.2885-19/s150x150/18011264_599007046959339_6933697247343280128_a.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
														alt="gimgweonsu6996님의 프로필 사진"></a>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                        aGBdT                                                  ">
														<a class="FPmhX notranslate wWBVx" title="gimgweonsu6996"
															href="/gimgweonsu6996/"><div
																class="                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                                              ">
																<div
																	class="_7UhW9   xLCgt       qyrsm KV-D4            fDxYl l4b0S   T0kll ">gimgweonsu6996</div>
															</div></a>
													</div>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                                                                          "
														style="height: 28px;">
														<div
															class="_7UhW9  PIoXz       MMzan   _0PwGv          p1tLr  l4b0S    ">회원님을
															팔로우합니다</div>
													</div>
													<button class="_0mzm- sqdOP  L3NKy       " type="button">팔로우</button>
												</div>
											</div>
										</div></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
									<li class="_-1_m6" style="opacity: 1; width: 200px;"></li>
								</ul>
							</div>
						</div>
					</div>
					<button class="Szr5J POSa_ " tabindex="-1">
						<div class="LA45P  coreSpritePagingChevron  "></div>
					</button>
					<button class="Szr5J  _6CZji" tabindex="-1">
						<div class=" Kf8kP coreSpritePagingChevron  "></div>
					</button>
				</div>
			</div>
		</div>
	</div>
	<h2 class="yQ0j1" style="margin-top: 20px">게시글 둘러보기</h2>
	<select class="sortBoard">
		<option value="b.b_code desc">선택하기</option>
		<option value="b.b_code desc">최신순</option>
		<option value="g_cnt desc">인기순</option>
		<option value="cm_cnt desc">댓글순</option>
	</select>
	<article class="v1pSD">
		<div>
			<!-- 게시글 영역 -->
			<div class="boardDiv"
				style="flex-direction: column; padding-bottom: 1200px; padding-top: 0px;">
				<c:forEach items="${ board_all }" var="board" varStatus="status">
					<c:if test="${ status.index % 3 eq 0 }">
						<div class="Nnq7C weEfm">
					</c:if>
					<div class="v1Nh3 kIKUG  _bz0w boardOne">
						<a href="boardOne?b_code=${ board.b_code }"><div class="eLAPa">
								<div class="KL4Bh">
									<img alt="사진 설명이 없습니다." class="FFVAD" decoding="auto"
										sizes="293.0062255859375px" src="${ board.img_img }"
										style="object-fit: cover;">
								</div>
								<div class="_9AhH0"></div>
								</div>
								<c:if test="${ board.img_cnt > 1 }">
									<div class="u7YqG">
										<span class="mediatypesSpriteCarousel__filled__32 u-__7"
											aria-label="슬라이드"></span>
									</div>
								</c:if>
								<div class="model" style="background-color: rgba(0, 0, 0, 0.3)">
									<div class="board_info">
									<pre>좋아요 ${ board.g_cnt }		댓글 ${ board.cm_cnt }</pre>
									</div>
								</div>
							</a>
					</div>
					<c:if test="${ status.index % 3 eq 2 }">
			</div>
			</c:if>
			</c:forEach>
		</div>
</div>
</article>
</div>
</main>