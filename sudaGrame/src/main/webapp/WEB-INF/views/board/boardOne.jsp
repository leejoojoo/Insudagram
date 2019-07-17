<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(".nav-item").removeClass("active");
	$(".nav-link").removeClass("active");
	$(".findBtn").parents().addClass("active");
	$(".findBtn").addClass("active");
	$(document).ready(function() {
		console.log("boardOne size: ${ board_one.m_id}");
		console.log("Imges size: ${ imges.size() }");
		console.log("Comments size: ${ comments.size() }")
	});
</script>
<main class="SCxLW  o64aR" role="main">
<div class="Kj7h1">
	<div class="ltEKP" style="max-width: 815px; border: 1px solid #f1f1f1">
		<article class="QBXjJ M9sTE  L_LMM  JyscU Tgarh ePUX4">
			<header class="Ppjfr UE9AK  wdOqh">
				<div class="RR-M- h5uC0 mrq0Z" role="button" tabindex="0">
					<canvas class="CfWVH" height="42" width="42"
						style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas>
					<span class="_2dbep " role="link" tabindex="0"
						style="width: 32px; height: 32px;"><img class="_6q-tv"
						src="https://scontent-icn1-1.cdninstagram.com/vp/a23dd475ef27f5f84be0e931253d789f/5DA9BB69/t51.2885-19/s150x150/61693030_840345109657510_5301176961203175424_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
						alt="${ board_one.m_id }님의 프로필 사진"></span>
				</div>
				<div class="o-MQd  z8cbW">
					<div class="PQo_0 RqtMr">
						<div class="e1e1d">
							<h2 class="BrX75">
								<a class="FPmhX notranslate nJAzx" title="adelfamarr"
									href="회원 프로필">${ board_one.m_id }</a>
							</h2>
						</div>
						<div class="bY2yH">
							<span class="RPhNB">•</span>
							<button class="oW_lN _0mzm- sqdOP yWX7d        " type="button">팔로우</button>
						</div>
					</div>
					<div class="M30cS">
						<div></div>
						<div class="JF9hh">
							<a class="O4GlU" href="javascript:void(0);">${ board_one.m_name }</a>
						</div>
					</div>
				</div>
			</header>
			<div class="_97aPb wKWK0">
				<div role="button" tabindex="0" class="ZyFrc">
					<div class="rQDP3">
						<div class="pR7Pc">
							<div class="tR2pe" style="padding-bottom: 125%;"></div>
							<div class="tN4sQ zRsZI">
								<div class="NgKI_">
									<div class="MreMs" tabindex="0" role="button"
										style="transition-duration: 0s; transform: translateX(0px);">
										<div class="qqm6D">
											<ul class="YlNGR"
												style="padding-left: 0px; padding-right: 0px;">
												<c:forEach items="${ imges }" var="imge">
													<li class="_-1_m6" style="opacity: 1; width: 478px;"><div
															class="bsGjF" style="margin-left: 0px; width: 478px;">
															<div role="button" tabindex="0" class="ZyFrc">
																<div class="RzuR0 kHt39  plVq-">
																	<div class="eLAPa _23QFA" role="button" tabindex="0">
																		<div class="KL4Bh" style="padding-bottom: 125%;">
																			<img alt="이미지: 사람 1명 이상, 사람들이 앉아 있는 중" class="FFVAD"
																				decoding="auto" sizes="478px" src="${ imge }"
																				style="object-fit: cover;">
																		</div>
																		<div class="_9AhH0"></div>
																	</div>
																	<button class="G_hoz LcKDX _6JfJs">
																		<div class="HBUJV">
																			<span
																				class="glyphsSpriteUser__filled__24__grey_0 u-__7"
																				aria-label="태그"></span>
																		</div>
																	</button>
																</div>
															</div>
														</div></li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
								<c:if test="${ imges.size() > 1 }">
									<button class="  _6CZji" tabindex="-1">
										<div class="    coreSpriteRightChevron"></div>
									</button>
								</c:if>
							</div>
							<div class="JSZAJ  _3eoV-  IjCL9  WXPwG">
								<c:if test="${ imges.size() > 1 }">
									<c:forEach end="${ imges.size() }" items="i">
										<c:if test="${ i eq 0 }">
											<div class="Yi5aA XCodT"></div>
										</c:if>
										<c:if test="${ i ne 0 }">
											<div class="Yi5aA"></div>
										</c:if>
									</c:forEach>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="eo2As ">
				<section class="ltpMr Slqrh">
					<span class="fr66n"><button class="dCJp8 afkep _0mzm- heart_button">
							<span id="heart1" class="glyphsSpriteHeart__outline__24__grey_9 u-__7"
								aria-label="좋아요"></span>
						</button></span><span class="_15y0l"><button class="dCJp8 afkep _0mzm-">
							<span class="glyphsSpriteComment__outline__24__grey_9 u-__7"
								aria-label="댓글 달기"></span>
						</button></span><span class="_5e4p"><button class="dCJp8 afkep _0mzm-">
							<span class="glyphsSpriteShare__outline__24__grey_9 u-__7"
								aria-label="게시물 공유"></span>
						</button></span><span class="wmtNn"><button class="dCJp8 afkep _0mzm-">
							<span class="glyphsSpriteSave__outline__24__grey_9 u-__7"
								aria-label="저장"></span>
						</button></span>
				</section>
				<section class="EDfFK ygqzn">
					<div
						class="                  Igw0E     IwRSH      eGOV_     ybXk5   vwCYk                                                                                                               ">
						<div class="Nm9Fw">
							<a class="zV_Nj" href="/p/Bzx0vGtFI18/liked_by/">좋아요 <span> <fmt:formatNumber value="${ board_one.g_cnt }" pattern="#,###"/> </span>개
							</a>
						</div>
					</div>
				</section>
				<div class="EtaWk">
					<ul class="XQXOT">
						<div role="button" class="ZyFrc">
							<li class="gElp9 rUo9f PpGvg " role="menuitem"><div
									class="P9YgZ">
									<div class="C7I1f X7jCj">
										<div class="RR-M- h5uC0 TKzGu" role="button" tabindex="0">
											<canvas class="CfWVH" height="42" width="42"
												style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas>
											<span class="_2dbep " role="link" tabindex="0"
												style="width: 32px; height: 32px;"><img
												class="_6q-tv"
												src="https://scontent-icn1-1.cdninstagram.com/vp/a23dd475ef27f5f84be0e931253d789f/5DA9BB69/t51.2885-19/s150x150/61693030_840345109657510_5301176961203175424_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
												alt="${ board_one.m_id }님의 프로필 사진"></span>
										</div>
										<div class="C4VMK">
											<h2 class="_6lAjh">
												<a class="FPmhX notranslate TlrDj" title="adelfamarr"
													href="프로필">${ board_one.m_id }</a>
											</h2>
											<span>${ board_one.b_content }</span>
											<div
												class="                  Igw0E     IwRSH      eGOV_         _4EzTm   pjcA_                                                         aGBdT                                                  ">
												<div
													class="_7UhW9  PIoXz       MMzan   _0PwGv       uL8Hv         ">
													<time class="FH9sR Nzb55"
														datetime="2019-07-11T13:40:57.000Z" title="2019년 7월 11일">
														<fmt:formatDate value="${ board_one.b_regdate }"
															pattern="YYYY년MM월dd일 HH:mm" />
													</time>
												</div>
											</div>
										</div>
									</div>
								</div></li>
						</div>
						<hr />
						<c:forEach items="${ comments }" var="comm">
							<ul class="Mr508">
								<div role="button" class="ZyFrc">
									<li class="gElp9 rUo9f" role="menuitem"><div class="P9YgZ">
											<div class="C7I1f ">
												<div class="RR-M-  TKzGu" role="button" tabindex="0">
													<canvas class="CfWVH" height="42" width="42"
														style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas>
													<a class="_2dbep qNELH kIKUG" href="/jenyshutcheson/"
														style="width: 32px; height: 32px;"><img class="_6q-tv"
														src="https://scontent-icn1-1.cdninstagram.com/vp/7fddfc25bddedcf06c1b5e60b97857f1/5DBF260D/t51.2885-19/s150x150/14727610_1800939523481030_3259341799218479104_a.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
														alt="댓글 프로필 사진"></a>
												</div>
												<div class="C4VMK">
													<h3 class="_6lAjh">
														<a class="FPmhX notranslate TlrDj" title="jenyshutcheson"
															href="댓글 프로필">${ comm.m_id }</a>
													</h3>
													<span>${ comm.cm_content }</span>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm   pjcA_                                                         aGBdT                                                  ">
														<div
															class="_7UhW9  PIoXz       MMzan   _0PwGv       uL8Hv         ">
															<time class="FH9sR Nzb55" title="${ comm.cm_date }">
																<fmt:formatDate value="${ comm.cm_date }"
																	pattern="YYYY년MM월dd일 HH:mm" />
															</time>
															<button class="FH9sR">답글 달기</button>
														</div>
													</div>
												</div>
											</div>
											<div class="_4l6NB">
												<button class="dCJp8 afkep _0mzm-">
													<span
														class="glyphsSpriteMore_horizontal__outline__24__grey_5 u-__7"
														aria-label="댓글 옵션"></span>
												</button>
											</div>
										</div></li>
								</div>
								<li><ul class="TCSYW">
										<c:if test="${ comm.childComm.size() > 1 }">
											<li class="_61Di1"><div
													class="                  Igw0E     IwRSH      eGOV_     ybXk5    _4EzTm                                                                                                              ">
													<button class="_0mzm- sqdOP yWX7d        " type="button">
														<div class="_7mCbS"></div>
														<span class="EizgU">답글 보기(${ comm.childComm.size()}개)</span>
													</button>
												</div></li>
											<c:forEach items="${ comm.childComm }" var="childComm">
												<div role="button" class="ZyFrc">
													<li class="gElp9 rUo9f lDe-V" role="menuitem"><div
															class="P9YgZ">
															<div class="C7I1f ">
																<div class="RR-M-  TKzGu" role="button" tabindex="0">
																	<canvas class="CfWVH" height="42" width="42"
																		style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas>
																	<a class="_2dbep qNELH kIKUG" href="/suseilish/"
																		style="width: 32px; height: 32px;"><img
																		class="_6q-tv"
																		src="https://scontent-icn1-1.cdninstagram.com/vp/867ce3af57f66e203c2330a559f57263/5DB6188D/t51.2885-19/s150x150/65771494_2445254209037748_3475011902654906368_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
																		alt="${ childComm.m_id }님의 프로필 사진"></a>
																</div>
																<div class="C4VMK">
																	<h3 class="_6lAjh">
																		<a class="FPmhX notranslate TlrDj" title="suseilish"
																			href="대닷글 프로필 보기">${ childComm.m_id }</a>
																	</h3>
																	<span><a class="notranslate" href="/simonpovoa/" style="font-weight: 600;">@${ comm.m_id }</a>
																		${ childComm.cm_content }</span>
																	<div
																		class="                  Igw0E     IwRSH      eGOV_         _4EzTm   pjcA_                                                         aGBdT                                                  ">
																		<div
																			class="_7UhW9  PIoXz       MMzan   _0PwGv       uL8Hv         ">
																			<time class="FH9sR Nzb55"
																				datetime="2019-07-12T06:08:57.000Z"
																				title="2019년 7월 12일"><fmt:formatDate value="${ childComm.cm_date }"
																	pattern="YYYY년MM월dd일 HH:mm" /></time>
																			<button class="FH9sR">답글 달기</button>
																		</div>
																	</div>
																</div>
															</div>
															<div class="_4l6NB">
																<button class="dCJp8 afkep _0mzm-">
																	<span
																		class="glyphsSpriteMore_horizontal__outline__24__grey_5 u-__7"
																		aria-label="댓글 옵션"></span>
																</button>
															</div>
														</div></li>
												</div>
											</c:forEach>
										</c:if>
									</ul></li>
							</ul>
						</c:forEach>
					</ul>
				</div>
				<div class="k_Q0X NnvRN">
					<a class="c-Yi7" href="/p/Bzx0vGtFI18/"><time
							class="_1o9PC Nzb55" datetime="2019-07-11T13:40:57.000Z"
							title="2019년 7월 11일"><fmt:formatDate value="${ board_one.b_regdate }"
																	pattern="YYYY년MM월dd일 HH:mm" /></time></a>
				</div>
				<section class="sH9wk  _JgwE ">
					<div class="RxpZH">
						<form class="X7cDz" method="POST">
							<textarea aria-label="댓글 달기..." placeholder="댓글 달기..."
								class="Ypffh" autocomplete="off" autocorrect="off"></textarea>
							<button class="_0mzm- sqdOP yWX7d        " disabled=""
								type="submit">게시</button>
						</form>
					</div>
				</section>
			</div>
			<div class="MEAGs">
				<button class="dCJp8 afkep _0mzm-">
					<span
						class="glyphsSpriteMore_horizontal__outline__24__grey_9 u-__7"
						aria-label="옵션 더 보기"></span>
				</button>
			</div>
		</article>
	</div>
</div>
</main>
<script>
$(".dCJp8 afkep _0mzm- heart_button").click(function(){
	var condition = $(this).children().is(".glyphsSpriteHeart__outline__24__grey_9 u-__7");
	var b_code = ${param.b_code};
	if (!condition) {
	$('#heart1').removeClass('glyphsSpriteHeart__outline__24__grey_9 u-__7').addClass('glyphsSpriteHeart__filled__24__red_5 u-__7');
	$.ajax({
		 url : 'fillHeart',
           type : 'POST',
           data : {
           	b_code:b_code
           	},
           dataType : "json",
           success : function(data) {
        	   alert("좋아요추가")
           	}
	 }); 
	}
	if(condition){
		$('#heart1').removeClass('glyphsSpriteHeart__filled__24__red_5 u-__7').addClass('glyphsSpriteHeart__outline__24__grey_9 u-__7');	
		$.ajax({
			 url : 'outLineHeart',
	            type : 'POST',
	            data : {
	               	b_code:b_code,
	            	},
	            dataType : "json",
	            success : function(data) {
	            	alert("좋아요삭제")
	            }
		 }); 
	}

	
});

</script>