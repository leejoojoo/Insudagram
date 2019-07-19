<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE>
<style>
._-1_m6 {
   transition: all .6s;
}

.goodListPop, .deleteCommPop {
	display: none;
}
</style>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
var m_id = "${ pageContext.request.userPrincipal.name}";
   function printChildComm(data, button, cm_group) {
      $(data)
            .each(
                  function(index, x) {
                     var BigDiv = $("<div role='button' class='ZyFrc'></div>");
                     var li = $("<li class='gElp9 rUo9f lDe-V' role='menuitem'></li>");
                     var smallDiv = $("<div class='P9YgZ'></div>");
                     var div = $("<div class='C7I1f '></div>");
                     var div2 = $("<div class='RR-M-  TKzGu' role='button' tabindex='0'><canvas class='CfWVH' height='42' width='42' style='position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;'></canvas><a class='_2dbep qNELH kIKUG' href='/mongboo/' style='width: 32px; height: 32px;'><img class='_6q-tv' src='"+x.m_picture+"' alt='"+x.m_id+"님의 프로필 사진'></a></div>");
                     div.append(div2);
                     var date = new Date(x.cm_date)
                     div2 = $("<div class='C4VMK'><h3 class='_6lAjh'><a class='FPmhX notranslate TlrDj' title='mongboo' href='/"+x.m_id+"/'>"
                           + x.m_id
                           + "</a></h3><span><a class='notranslate' href='/hyxmxn/'>@"
                           + x.pm_id
                           + "</a> "
                           + x.cm_content
                           + "</span><div class='                  Igw0E     IwRSH      eGOV_         _4EzTm   pjcA_                                                         aGBdT                                                  '><div class='_7UhW9  PIoXz       MMzan   _0PwGv       uL8Hv         '><time class='FH9sR Nzb55' style='display:block;' title='"+x.cm_date+"'>                     "
                           + date.getFullYear()
                           + "년"
                           + date.getMonth()
                           + "월"
                           + date.getDate()
                           + "일 "
                           + date.getHours()
                           + ":"
                           + date.getMinutes()
                           + "</time><button class='FH9sR insertChildBtn' value='"+cm_group+","+x.m_id+"'>답글 달기</button></div></div></div>");
                     div.append(div2);
                     smallDiv.append(div);
                     // console.log(x.cm_code);
                     if(m_id == x.m_id){
                    	 div = $("<div class='_4l6NB'><button class='dCJp8 afkep _0mzm- deleteCommBtn' value='"+x.cm_code+"'><span class='glyphsSpriteMore_horizontal__outline__24__grey_5 u-__7' aria-label='댓글 옵션'></span></button></div>");
                         smallDiv.append(div);
                     }
                     li.append(smallDiv);
                     BigDiv.append(li);
                     button.append(BigDiv);
                  });
   };

   function childcomm(cm_group, button) {
      // console.log(cm_group);
      $.ajax({
         url : "childComments",
         dataType : "json",
         type : "post",
         data : {
            cm_group : cm_group
         },
         cache : false // 항상 새로 읽어오겠다.
         ,
         success : function(data) {
            printChildComm(data, button, cm_group);
         },
         error : function() {
            alert("에러~~~~");
         }
      });
   };

   function insertComm(pm_id, content, group) {
      $.ajax({
         url : "insertComm",
         dataType : "json",
         type : "post",
         data : {
            pm_id : pm_id,
            content : content,
            b_code : "${param.b_code}",
            group : group
         },
         cache : false // 항상 새로 읽어오겠다.
         ,
         success : function(data) {
            // alert(data);
            printComm(group);
         },
         error : function(group) {
            alert("에러~~~~");
         }
      });
   };

	function printComm(group) {
		var button = null;
		$
				.ajax({
					url : "printComm",
					dataType : "json",
					type : "post",
					data : {
						b_code : "${param.b_code}"
					},
					cache : false // 항상 새로 읽어오겠다.
					,
					success : function(data) {
						$(".Mr508").remove();
						$(data)
								.each(
										function(index, x) {
											var ul = $("<ul class='Mr508 cmm"+x.cm_code+"'></ul>");
											var BigDiv = $("<div role='button' class='ZyFrc'></div>");
											var li = $("<li class='gElp9 rUo9f' role='menuitem'></li>");
											var smallDiv = $("<div class='P9YgZ'></div>");
											var div = $("<div class='C7I1f '></div>");
											var div1 = $("<div class='RR-M-  TKzGu' role='button' tabindex='0'><canvas class='CfWVH' height='42' width='42' style='position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;'></canvas><a class='_2dbep qNELH kIKUG' href='/jenyshutcheson/' style='width: 32px; height: 32px;'><img class='_6q-tv' src='"+x.m_picture+"' alt='댓글 프로필 사진'></a></div>");
											div.append(div1);
											var date = new Date(x.cm_date)
											div1 = $("<div class='C4VMK'><h3 class='_6lAjh'><a class='FPmhX notranslate TlrDj' title='"+x.m_id+"' href='댓글 프로필'>"
													+ x.m_id
													+ "</a></h3><span>"
													+ x.cm_content
													+ "</span><div class='                  Igw0E     IwRSH      eGOV_         _4EzTm   pjcA_                                                         aGBdT                                                  '><div class='_7UhW9  PIoXz       MMzan   _0PwGv       uL8Hv         '><time class='FH9sR Nzb55' style='display:block;' title='Fri Jul 12 14:32:15 KST 2019'>	"
													+ date.getFullYear()
													+ "년"
													+ date.getMonth()
													+ "월"
													+ date.getDate()
													+ "일 "
													+ date.getHours()
													+ ":"
													+ date.getMinutes()
													+ "	</time><button class='FH9sR insertChildBtn' value='1,"+x.m_id+"'>답글 달기</button></div></div></div>");
											div.append(div1);
											smallDiv.append(div);
											if(m_id == x.m_id){
												div = $("<div class='_4l6NB'><button class='dCJp8 afkep _0mzm- deleteCommBtn' value='"+x.cm_code+"'><span class='glyphsSpriteMore_horizontal__outline__24__grey_5 u-__7' aria-label='댓글 옵션'></span></button></div>");
												smallDiv.append(div);
											}
											li.append(smallDiv);
											BigDiv.append(li);
											ul.append(BigDiv);
											var context = "";
											console.log("cm_code : " + x.cm_code);
											if(x.cm_code == group){
												context = " disabled='disabled' ";
											}
											if (x.cnt_child > 0) {
												li = $("<li><ul class='TCSYW commentArea'><li class='_61Di1'><div class='                  Igw0E     IwRSH      eGOV_     ybXk5    _4EzTm                                                                                                              '><button class='_0mzm- sqdOP yWX7d childBtn' type='button' value='"+x.cm_code+"' "+context+"><div class='_7mCbS'></div><span class='EizgU'>답글 보기("
														+ x.cnt_child
														+ "개)</span></button></div></li></ul></li>");
												ul.append(li);
											}
											$(".XQXOT").append(ul);
										});
						button = $(".cmm" + group).find(".commentArea");
						childcomm(group, button);
					},
					error : function() {
						alert("에러~~~~");
					}
				});
	};

   function copyToClipboard() {
      var temp = $("<input>");
      $("body").append(temp);
      temp.val(location.href).select();
      document.execCommand("copy");
      temp.remove();
   };
   
   function goodList(){
      $.ajax({
         url : "goodList",
         dataType : "json",
         type : "post",
         data : {
            b_code : "${param.b_code}"
         },
         cache : false // 항상 새로 읽어오겠다.
         ,
         success : function(data) {
            // alert(data.length);
            printGoodList(data);
         },
         error : function(group) {
            alert("에러~~~~");
         }
      });
   };
   
   function printGoodList(data){
      $(".listArea").empty();
      $(data).each(function(index, x){
         var info = "";
         if(x.m_introduction != null){
            info = x.m_introduction;
         }
         var div = $("<div style='flex-direction: column; padding-top: 0px;'></div>");
         var div2 = $("<div class='                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                   XfCBB          HVWg4                  _0mzm- ZUqME' aria-labelledby='f1aca81c7a25d5c f36eb1e7c279a14'></div>");
         var div3 = $("<div class='                  Igw0E     IwRSH      eGOV_         _4EzTm                                         yC0tu                                                                     '><div class='RR-M- h5uC0' role='button' tabindex='0'><canvas class='CfWVH' height='54' width='54' style='position: absolute; top: -5px; left: -5px; width: 54px; height: 54px;''></canvas><span class='_2dbep ' role='link' tabindex='0' style='width: 44px; height: 44px;''><img class='_6q-tv' src='"+x.m_picture+"' alt='"+x.m_id+"님의 프로필 사진'></span></div></div>")
         div2.append(div3);
         div3 = $("<div class='                  Igw0E     IwRSH        YBx95      vwCYk                                                                                                               '><div class='                  Igw0E     IwRSH      eGOV_         _4EzTm                                                                                                              ' id='f1aca81c7a25d5c'><div class='_7UhW9   xLCgt      MMzan  KV-D4            fDxYl     '><a title="+x.m_id+" href="+/x.m_id/+"><div class='                  Igw0E     IwRSH      eGOV_     ybXk5    _4EzTm                                                                                                              '><div class='_7UhW9   xLCgt       qyrsm KV-D4            fDxYl      rWtOq'><div class='                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                                              '>"+x.m_id+"</div></div></div></a></div></div><div class='                  Igw0E     IwRSH      eGOV_         _4EzTm                                                          DhRcB                                                    ' id='f36eb1e7c279a14'><div class='_7UhW9   xLCgt      MMzan   _0PwGv           fDxYl     '>"+info+"</div></div></div>");
         div2.append(div3);
         div3 = $("<div class='                  Igw0E   rBNOH          YBx95   ybXk5    _4EzTm                      soMvl                                                                                        '></div>");
         var button;
         if(x.f_cnt == 0){
             button = $("<button class='_0mzm- sqdOP  L3NKy       ' type='button'>팔로우</button>");
         }else{
            button = $("<button class='_0mzm- sqdOP  L3NKy   _8A5w5    ' type='button'>팔로잉</button>");
         }
         div3.append(button);
         div2.append(div3);
         div.append(div2);
         $(".listArea").append(div);
      });
   };
   
   function deleteComm(cm_code){
	   $.ajax({
	         url : "deleteComm",
	         dataType : "json",
	         type : "post",
	         data : {
	            cm_code: cm_code
	         },
	         cache : false // 항상 새로 읽어오겠다.
	         ,
	         success : function(data) {
	        	 printComm(0);
	         },
	         error : function(group) {
	            alert("에러~~~~");
	         }
	      });
   };
</script>
<script>
   var imgMax = "${imges.size()}";
   $(".nav-item").removeClass("active");
   $(".nav-link").removeClass("active");
   $(".findBtn").parents().addClass("active");
   $(".findBtn").addClass("active");
   $(document).ready(
         function() {
        	 console.log("m_g: ${board_one.m_g}");
            // console.log("boardOne size: ${ board_one.m_id}");
            // console.log("Imges size: ${ imges.size() }");
            // console.log("Comments size: ${ comments.size() }")
            $(".goodList").on("click", function(){
               $(".RnEpo").css("display", "block");
               goodList();
            });
            
            $(".closeGood").on("click", function(){
               $(".RnEpo").css("display", "none");
            });

            $(".insertComm").on(
                  "click",
                  function() { // 댓글 달기
                     var buffer = $(".cm_content").val();
                     var pm_id = null;
                     var content = null;
                     if (buffer.indexOf("@") != -1) {
                        pm_id = buffer.substr(buffer.indexOf("@") + 1,
                              buffer.indexOf(" ") - 1);
                        content = buffer
                              .substr(buffer.indexOf(" ") + 1);
                     } else {
                        content = buffer;
                     }
                     var group = $(".cm_group").val();
                     if (group == "")
                        group = 0;
                     console.log("group: " + group);
                     insertComm(pm_id, content, group);
                     $(".cm_content").val("");
                  });

            $(".cm_content").on("keyup", function() {
               if ($(this).val() != "")
                  $(".insertComm").attr("disabled", false);
               else
                  $(".insertComm").attr("disabled", true);
            })

            $(".sharedBoard").on("click", function() {
               copyToClipboard();
               alert("주소가 복사되었습니다.");
            });

            $(".commBtn").on("click", function() {
               $(".cm_content").focus();
            });

				var index = 1;
				$(".nextBtn").on("click", function() {
					// $("._-1_m6:eq("+index+")").css("left", -478*index+"px");
					$("._-1_m6").css("left", -478 * index + "px");
					if (index >= imgMax) {
						index = 0;
						$("._-1_m6").css("left", 0);
					}
					index = index + 1;
					console.log(index);
				});
			$(".closeDC").on("click", function(){
				 $(".deleteCommPop").css("display", "none");
			});
			
			$(".deleteC").on("click", function(){
				// console.log($(this).val());
				deleteComm($(this).val());
				$(".deleteCommPop").css("display", "none");
			});
         });
	var btn = null;
	$(document).on("click", ".childBtn", function() {
		// console.log($(this).val())
		// console.log($(this).parents().parents().parents(".commentArea"));
		var button = $(this).parents().parents().parents(".commentArea");
		// console.log($(this).val());
		childcomm($(this).val(), button);
		btn = $(this);
		$(this).attr("disabled", true);
	});

   $(document).on("click", ".insertChildBtn", function() {
      var buffer = $(this).val().split(",");
      $(".cm_group").val(buffer[0]);
      $(".cm_content").val("@" + buffer[1] + " ");
      $(".insertComm").attr("disabled", false);
   });
   
   $(document).on("click", ".deleteCommBtn", function(){
	   $(".deleteC").val($(this).val());
	   $(".deleteCommPop").css("display", "block");
   });
</script>
<main class="SCxLW  o64aR" role="main">
<div class="Kj7h1">
	<div class="ltEKP" style="max-width: 815px; border: 1px solid #f1f1f1; left: 50%;transform: translate(-50%);">
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
							<button id="followButton" class="oW_lN _0mzm- sqdOP yWX7d        " type="button">팔로우</button>
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
													<li class="_-1_m6"
														style="opacity: 1; width: 478px; position: relative; left: 0px;"><div
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
					<span class="fr66n"><button
							class="dCJp8 afkep _0mzm- heart_button">
							<c:if test="${ board_one.m_g > 0}">
								<span id="heart1"
									class="glyphsSpriteHeart__filled__24__red_5 u-__7"
									aria-label="좋아요"></span>
							</c:if>
							<c:if test="${ board_one.m_g <= 0}">
								<span id="heart1"
									class="glyphsSpriteHeart__outline__24__grey_9 u-__7"
									aria-label="좋아요"></span>
							</c:if>
						</button></span><span class="_15y0l"><button class="dCJp8 afkep _0mzm-">
							<span
								class="glyphsSpriteComment__outline__24__grey_9 u-__7 commBtn"
								aria-label="댓글 달기"></span>
						</button></span><span class="_5e4p"><button class="dCJp8 afkep _0mzm-">
							<span
								class="glyphsSpriteShare__outline__24__grey_9 u-__7 sharedBoard"
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
							<a class="zV_Nj goodList" href="javascript:void(0);">좋아요 <span id="g_cnt">${ board_one.g_cnt }</span>개
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
							<ul class="Mr508 comm${comm.cm_code }">
								<div role="button" class="ZyFrc">
									<li class="gElp9 rUo9f" role="menuitem"><div class="P9YgZ">
											<div class="C7I1f ">
												<div class="RR-M-  TKzGu" role="button" tabindex="0">
													<canvas class="CfWVH" height="42" width="42"
														style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas>
													<a class="_2dbep qNELH kIKUG" href="/jenyshutcheson/"
														style="width: 32px; height: 32px;"><img class="_6q-tv"
														src="${ comm.m_picture }" alt="댓글 프로필 사진"></a>
												</div>
												<div class="C4VMK">
													<h3 class="_6lAjh">
														<a class="FPmhX notranslate TlrDj" title="jenyshutcheson"
															href="댓글 프로필">${ comm.m_id }</a>
													</h3>
													<span> <c:if test="${ not empty comm.pm_id }">
															<a class="notranslate" href="/hyxmxn/">@${ comm.pm_id }</a>
														</c:if> ${ comm.cm_content }
													</span>
													<div
														class="                  Igw0E     IwRSH      eGOV_         _4EzTm   pjcA_                                                         aGBdT                                                  ">
														<div
															class="_7UhW9  PIoXz       MMzan   _0PwGv       uL8Hv         ">
															<time class="FH9sR Nzb55" title="${ comm.cm_date }">
																<fmt:formatDate value="${ comm.cm_date }"
																	pattern="YYYY년MM월dd일 HH:mm" />
															</time>
															<button class="FH9sR insertChildBtn"
																value="${ comm.cm_code },${comm.m_id}">답글 달기</button>
														</div>
													</div>
												</div>
											</div>
											<c:if test="${ pageContext.request.userPrincipal.name eq comm.m_id }">
											<div class="_4l6NB">
												<button class="dCJp8 afkep _0mzm- deleteCommBtn" value="${ comm.cm_code }">
													<span
														class="glyphsSpriteMore_horizontal__outline__24__grey_5 u-__7 commOption"
														aria-label="댓글 옵션"></span>
												</button>
											</div>
											</c:if>
										</div></li>
								</div>
								<li><ul class="TCSYW commentArea">
										<c:if test="${ comm.cnt_child > 0 }">
											<li class="_61Di1"><div
													class="                  Igw0E     IwRSH      eGOV_     ybXk5    _4EzTm                                                                                                              ">
													<button class="_0mzm- sqdOP yWX7d childBtn type="
														button" value="${ comm.cm_code }">
														<div class="_7mCbS"></div>
														<span class="EizgU">답글 보기(${ comm.cnt_child}개)</span>
													</button>
												</div></li>
											<!-- 대댓글들 들어가는 자리 -->
										</c:if>
									</ul></li>
							</ul>
						</c:forEach>
					</ul>
				</div>
				<div class="k_Q0X NnvRN">
					<a class="c-Yi7" href="/p/Bzx0vGtFI18/"><time
							class="_1o9PC Nzb55" datetime="2019-07-11T13:40:57.000Z"
							title="2019년 7월 11일">
							<fmt:formatDate value="${ board_one.b_regdate }"
								pattern="YYYY년MM월dd일 HH:mm" />
						</time></a>
				</div>
				<section class="sH9wk  _JgwE ">
					<div class="RxpZH">
						<form class="X7cDz insertForm" method="POST">
							<input type="hidden" name="cm_group" class="cm_group" />
							<textarea aria-label="댓글 달기..." placeholder="댓글 달기..."
								class="Ypffh cm_content" autocomplete="off" autocorrect="off"
								name="cm_content"></textarea>
							<button class="_0mzm- sqdOP yWX7d   insertComm " disabled=""
								type="button">게시</button>
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
<div class="RnEpo Yx5HN  goodListPop " role="presentation">
	<div class="pbNvD fPMEg " role="dialog"
		style="margin: auto; margin-top: 200px;">
		<div>
			<div class="eiUFA">
				<div class="WaOAr"></div>
				<h1 class="m82CD">좋아요</h1>
				<div class="WaOAr">
					<button class="dCJp8 afkep _0mzm- closeGood">
						<span class="glyphsSpriteX__outline__24__grey_9 u-__7"
							aria-label="닫기"></span>
					</button>
				</div>
			</div>
		</div>
		<div
			class="                  Igw0E     IwRSH      eGOV_        vwCYk                                                                            i0EQd                                   "
			style="max-height: 356px; min-height: 200px;">
			<div style="height: 356px; overflow: hidden auto;" class="listArea">
			</div>
		</div>
	</div>
</div>

<div class="RnEpo Yx5HN   deleteCommPop" role="presentation">
	<button aria-hidden="true" class="yvwbg" tabindex="-1"></button>
	<div class="pbNvD fPMEg " role="dialog" style="margin: auto; margin-top: 200px;">
		<div class="piCib">
			<div class="mt3GC">
				<button class="aOOlW -Cab_ deleteC" tabindex="0">댓글 삭제</button>
				<button class="aOOlW   HoLwm closeDC" tabindex="0">취소</button>
			</div>
		</div>
	</div>
</div>

<%-- // 	var element = ${".glyphsSpriteHeart__outline__24__grey_9 u-__7"}; --%>
<!-- // 	var elementClass = element.attr('class'); -->
<!-- // 	elementClass == "glyphsSpriteHeart__outline__24__grey_9 u-__7"; -->
<!-- //	버튼 클릭 시 아웃라인이면 하트를 채워라 조건 1. -->
<script>
$(".heart_button").click(function(){
	// console.log("클릭");
	var condition = $(this).children().is(".glyphsSpriteHeart__outline__24__grey_9");
	var b_code = ${param.b_code};
	var g_cnt = ${ board_one.g_cnt };
	// console.log(condition);
	if (condition == true) {
	$('#heart1').removeClass('glyphsSpriteHeart__outline__24__grey_9').addClass('glyphsSpriteHeart__filled__24__red_5');
	$.ajax({
		 url : 'fillHeart',
           type : 'POST',
           data : {
           	b_code:b_code,
           	m_code: ${userInfo.m_code}
           	},
           dataType : "json",
           success : function(data) {
        	   // alert("좋아요추가")
        	   $('#g_cnt').html(data);
           	}
	 }); 
	}
	if(condition == false){
		$('#heart1').removeClass('glyphsSpriteHeart__filled__24__red_5').addClass('glyphsSpriteHeart__outline__24__grey_9');	
		$.ajax({
			 url : 'outLineHeart',
	            type : 'POST',
	            data : {
	            	b_code:b_code,
	               	m_code: ${userInfo.m_code}
	            	},
	            dataType : "json",
	            success : function(data) {
	            	// alert("좋아요삭제")
	            	$('#g_cnt').html(data);
	            }
		 }); 
	}
});

$("#followButton").click(function() {
	if ($(this).html()=='팔로우') {
		$.ajax({
			  url : 'insertFollow',
	          type : 'POST',
	          data : {
	        	  m_code:${userInfo.m_code},
	        	  m_code2:${ board_one.m_code }
	          	},
	          	dataType : "json",
				success : function(data) {
					$("#followButton").html('팔로잉');
				}
	        });
	}
	if($(this).html()=='팔로잉'){
		 $.ajax({
			  url : 'deleteFollow',
	          type : 'POST',
	          data : {
	        	  m_code:${userInfo.m_code},
	        	  m_code2:${ board_one.m_code }
	          	},
	          	dataType : "json",
				success : function(data) {
					$("#followButton").html('팔로우');
				}
	        });
	}
});


</script>
