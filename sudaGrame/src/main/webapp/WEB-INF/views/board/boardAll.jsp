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
							style="transition-duration: 0s;">
							<div class="qqm6D">
								<ul class="YlNGR"
									style="padding-left: 0px; padding-right: 24px;">
									<c:forEach items="${ rcommFollow }" var="rcomm">
									<li class="_-1_m6" style="opacity: 1; width: 200px;"><div
											class="bsGjF" style="margin-left: 24px; width: 176px;">
											<div role="button" tabindex="0">
												<div
													class="pV7Qt  _6Rvw2      DPiy6          Igw0E   rBNOH        eGOV_         _4EzTm                                                                                   XfCBB            g6RW6               ">
													<a class="_2dbep qNELH kIKUG" href="/gimgweonsu6996/"
														style="width: 56px; height: 56px;"><img class="_6q-tv"
														src="${ rcomm.m_picture }"
														alt="${ rcomm.m_id }님의 프로필 사진"></a>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                        aGBdT                                                  ">
														<a class="FPmhX notranslate wWBVx" title="gimgweonsu6996"
															href="/gimgweonsu6996/"><div
																class="                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                                              ">
																<div
																	class="_7UhW9   xLCgt       qyrsm KV-D4            fDxYl l4b0S   T0kll ">${ rcomm.m_id }</div>
															</div></a>
													</div>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                                                                                                          "
														style="height: 28px;">
													</div>
													<button class="_0mzm- sqdOP  L3NKy       " type="button">팔로우</button>
												</div>
											</div>
										</div></li>
										</c:forEach>
								</ul>
							</div>
						</div>
					</div>
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