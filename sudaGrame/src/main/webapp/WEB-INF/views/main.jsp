<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(".nav-item").removeClass("active");
	$(".nav-link").removeClass("active");
	$(".mainBtn").parents().addClass("active");
	$(".mainBtn").addClass("active");
	$(document).ready(function(){
		console.log("test : ${ test }");
	});
</script>

<!DOCTYPE html>
<link rel="stylesheet" href="resources/main/bootstrap.min.css">
<script src="resources/main/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	
	//게시물 수정,삭제
	$('.editDel').click(function(){
		var b_code = $(this).val();
		
		$('#editDel_board_Modal').modal("show");
		
		$('.edit').click(function(){
			//b_content, img_img, img_code
			   $.ajax({
		            url:"selectEditBoard",
		            type:"GET",
		            data:{b_code:b_code},
		            cache: false,
		            success: function (data) {
		            	$(data).each(function(index, i){
// 		            		console.log("b_content: " + i.b_content);
							
// 		            		thtml='<label><b>내용</b></label>                                                                                                                                ';
// 							thtml+='<textarea name="b_content" id="b_content" class="form-control"></textarea>                                                                             ';
// 							thtml+='<br/>                                                                                                                                                  ';
// 							thtml+='<a id="galleryPlus" style="float: right; margin: 15px; ">+사진 추가</a>                                                                                    ';
// 							thtml+='<br>                                                                                                                                                   ';
// 							thtml+='<input type="file" id="writeGallery" class="writeGallery" name="writeGallery" style="border: none;"/>                                                  ';
// 							thtml+='<br>                                                                                                                                                   ';
// 							thtml+='<br>                                                                                                                                                   ';
// 							thtml+='                                                                                                                                                       ';
// 							thtml+='	<div class="file_set box_type03 mgt5" style="width:100%; border:solid 1px gray; padding:5px;" tabindex="0">                                        ';
// 							thtml+='	<ul>                                                                                                                                               ';
// 							thtml+='	<c:forEach items="${main.mainImg}" var="imgs" varStatus="status">                                                                                  ';
// 							thtml+='		<li><label><input type="checkbox" name="${imgs.img_img}" title="파일명" />'+i.img_img+'</label></li>                                            ';
// 							thtml+='	</c:forEach>                                                                                                                                       ';
// 							thtml+='	</ul>                                                                                                                                              ';
// 							thtml+='	</div>                                                                                                                                             ';
// 							thtml+='                                                                                                                                                       ';
// 							thtml+='<br>                                                                                                                                                   ';
// 							thtml+='<input type="submit" name ="insert" id="insert" value="수정" class="btn btn-success" style="left:50%; top:50%; background-color:gray;border-color:gray;"/>';
// 							thtml+='<input type="submit" name ="insert" id="insert" value="삭제" class="btn btn-success" style="left:50%; top:50%; background-color:gray;border-color:gray;"/>';


		            	});
		            	
		            	 // alert(data.editBoard.b_content);
// 						thtml='';
// 						$.each(data.list, function(i,item){
// // 							$('#edit_board_Modal').children('textarea[name=b_content]').text('testtttttttttttttttt');
// // 		            		$(this).attr('name','show');
		            	
		            	
		                alert("게시물 수정이 완료되었습니다.");
		                $('#editDel_board_Modal').modal("hide");
		            },
		            error: function (e) {
		                alert("게시물 수정이 실패하였습니다.");
		            }
		        });
			   
			
		});
		
		$('.delete').click(function(){
			
			   $.ajax({
		            url:"deleteBoard",
		            type:"POST",
		            data:{b_code:b_code},
		            cache: false,
		            success: function (data) {
		                alert("게시물 삭제가 완료되었습니다.");
		                $('#editDel_board_Modal').modal("hide");
		            },
		            error: function (e) {
		                alert("게시물 삭제가 실패하였습니다.");
		            }
		        });
			   
		});
		
		
	});
	
	
	//게시물 작성
	$('.writeBoard').click(function(){
		$('#write_board_Modal').modal("show");
		});
	//사진추가
	var i =2;
	$('#galleryPlus').click(function(){
		if(i<=10){
// 		$('#writeGallery').after('<input type="file" class="writeGallery" name="writeGallery'+i+'" style="border: none;"/><br />');
// 		$('#writeGallery').after('<input type="file" class="writeGallery" name="writeGallery[]" style="border: none;"/><br />');
		$('#writeGallery').after('<input type="file" class="writeGallery" name="writeGallery" style="border: none;"/><br />');
		i++;
		}else{
			alert("최대 10장까지 가능합니다")
		}
	});
	
	
	   //갤러리
	   $('#insert_form_gallery').on('submit',function(event){
				   event.preventDefault();
				   
			 if($('#b_content').val()=='')
			 {
			 $('#b_content').focus();
			 alert("제목을 입력해주세요");
			 }else if($('#writeGallery').val()==''){
			 alert("사진을 선택해주세요");
			 }else{					 
				   var formData = new FormData();
				   formData.append("b_content",$('#b_content').val());
				   for (var i = 0; i < $('input[class=writeGallery]').length ; i++) {
					   console.log("i: " + i);
				   	formData.append("writeGallery",$('input[name=writeGallery]')[i].files[0]);
				   }
// 				   formData.append("picture",$('input[name=writeGallery]')[0].files[0]);
// 				   formData.append("picture",$('input[name=writeGallery['+i+']]')[0].files[0]);
// 				   formData.append("picture",$('input[name=writeGallery'+i+']')[0].files[0]);
// 				   formData.append("picture"+i+"",$('input[name=writeGallery'+i+']')[0].files[0]);
				   
				   $.ajax({
			            url: "writeBoard",
			            type: "POST",
			            data: formData,
			            processData: false,
			            contentType: false,
			            cache: false,
			            success: function (data) {
			                alert("게시물 작성이 완료되었습니다.");
			                $('#b_content').val(null);
			                $('.writeGallery').val(null);
			                $('#write_board_Modal').modal("hide");
			            },
			            error: function (e) {
			                alert("게시물 작성이 실패하였습니다.");
			            }
			        });
				 
			  }
	   
	});
})

</script>
<main class="SCxLW  o64aR" role="main">
<section class="_1SP8R j9XKR  ">
	<div class="cGcGK">
		<div>
			<div
				style="flex-direction: column; padding-bottom: 4800px; padding-top: 0px;">
				
				<c:forEach items="${ main_all }" var="main" varStatus="status">
				
				<article class="_8Rm4L M9sTE  L_LMM SgTZ1   ePUX4">
					<header class="Ppjfr UE9AK  wdOqh">
						<div class="RR-M-  mrq0Z" role="button" tabindex="0">
							<canvas class="CfWVH" height="36" width="36"
								style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas>
							<a class="_2dbep qNELH kIKUG" href="/${main.m_id}/"
								style="width: 32px; height: 32px;"><img class="_6q-tv"
								src="https://scontent-icn1-1.cdninstagram.com/vp/52696e0b5cb60410f38bd1193624b8bd/5DAD5CA4/t51.2885-19/s150x150/47583290_228436121425179_1191385045571469312_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
								alt="${main.m_id}님의 프로필 사진"></a>
						</div>
						<div class="o-MQd  z8cbW">
							<div class=" RqtMr">
								<div class="e1e1d">
									<h2 class="BrX75">
										<a class="FPmhX notranslate nJAzx" title="${main.m_id}"
											href="/${main.m_id}/">${main.m_id}</a>
									</h2>
								</div>
							</div>
							<div class="M30cS">
								<div></div>
								<div class="JF9hh"></div>
							</div>
						</div>
					</header>
				<c:forEach items="${main.mainImg}" var="img" varStatus="status">
					<div class="_97aPb ">
						<div role="button" tabindex="0" class="ZyFrc">
							<div class="eLAPa kPFhm">
								<div class="KL4Bh" style="padding-bottom: 100%;">
									<img alt="사진 설명이 없습니다." class="FFVAD" decoding="auto"
										sizes="613.9874877929688px"
											src="resources/image/${img.img_img }"
										style="object-fit: cover;">
								</div>
								<div class="_9AhH0"></div>
							</div>
						</div>
					</div>
				</c:forEach>
					<div class="eo2As ">
						<section class="ltpMr Slqrh">
							<span class="fr66n"><button class="dCJp8 afkep _0mzm- heart_button">
									<span id="heart1" class="glyphsSpriteHeart__outline__24__grey_9 u-__7"
										aria-label="좋아요"></span>
								</button></span><span class="_15y0l"><button class="dCJp8 afkep _0mzm-">
									<span class="glyphsSpriteComment__outline__24__grey_9 u-__7"
										aria-label="댓글 달기"></span>
								</button></span><span class="wmtNn"><button class="dCJp8 afkep _0mzm-">
									<span class="glyphsSpriteSave__outline__24__grey_9 u-__7"
										aria-label="저장"></span>
								</button></span>
						</section>
						<section class="EDfFK ygqzn">
							<div
								class="                  Igw0E     IwRSH      eGOV_     ybXk5   vwCYk                                                                                                               ">
								<div class="Nm9Fw">
									<a class="zV_Nj"
										href="/p/BzvVtDlBcOytlU7PgnvX8wrZS6pSqcL0tIe7hs0/liked_by/">좋아요 ${main.g_cnt}개</a>
								</div>
							</div>
						</section>
						<div class="KlCQn  EtaWk">
							<ul class="k59kT">
								<div role="button" class="ZyFrc">
									<li class="gElp9 " role="menuitem"><div class="P9YgZ">
											<div class="C7I1f X7jCj">
												<div class="C4VMK">
													<h2 class="_6lAjh">
														<a class="FPmhX notranslate TlrDj" title="${main.m_id}"
															href="/${main.m_id}/">${main.m_id}</a>
													</h2>
													<span><span>${main.b_content}</span></span>
												</div>
											</div>
										</div></li>
								</div>
								
								<li class="lnrre">
									<button class="Z4IfV _0mzm- sqdOP yWX7d        " type="button">
										댓글 <span>${main.cm_cnt}</span>개 모두 보기
									</button>
								</li>
								<c:forEach items="${main.mainComments}" var="comm" varStatus="status">
								<div role="button" class="ZyFrc">
									<li class="gElp9 " role="menuitem">
										<div class="P9YgZ">
											<div class="C7I1f ">
												<div class="C4VMK">
													<h3 class="_6lAjh">
														<a class="FPmhX notranslate TlrDj" title="${comm.cm_id }" href="${comm.cm_id }">${comm.cm_id }</a>
													</h3>
													<span>
														<span>
														<c:if test="${comm.pm_id!=null}">
															<a class="notranslate" href="/imjina608/">@${comm.pm_id}</a>
														</c:if>
															${comm.cm_content }
														</span>													
													</span>
												</div>
											</div>
										</div>
									</li>
								</div>
								</c:forEach>
								
							</ul>
						</div>
						<div class="k_Q0X NnvRN">
							<a class="c-Yi7"
								href="/p/BzvVtDlBcOytlU7PgnvX8wrZS6pSqcL0tIe7hs0/"><time
									class="_1o9PC Nzb55" datetime="YYYY년MM월dd일 HH:mm"
									title="${main.b_regdate}">${main.b_regdate}</time></a>
						</div>
						<section class="sH9wk  _JgwE ">
							<div class="RxpZH">
								<form class="X7cDz" method="POST">
									<textarea aria-label="댓글 달기..." placeholder="댓글 달기..."
										class="Ypffh" autocomplete="off" autocorrect="off"></textarea>
									<button class="_0mzm- sqdOP yWX7d        "
										type="submit">게시</button>
								</form>
							</div>
						</section>
					</div>
					<div class="MEAGs">
						<button class="dCJp8 afkep _0mzm- editDel" value="${main.b_code}">
							<span
								class="glyphsSpriteMore_horizontal__outline__24__grey_9 u-__7"
								aria-label="옵션 더 보기"></span>
						</button>
					</div>
	
				
				</article>
				</c:forEach>
				
<!-- 				<article class="_8Rm4L M9sTE  L_LMM SgTZ1   ePUX4"> -->
<!-- 					<header class="Ppjfr UE9AK  wdOqh"> -->
<!-- 						<div class="RR-M- mrq0Z" role="button" tabindex="0"> -->
<%-- 							<canvas class="CfWVH" height="36" width="36" --%>
<%-- 								style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas> --%>
<!-- 							<span class="_2dbep " role="link" tabindex="0" -->
<!-- 								style="width: 32px; height: 32px;"><img class="_6q-tv" -->
<!-- 								src="https://scontent-icn1-1.cdninstagram.com/vp/80cb49cec27bf5f32a18507f0db765e8/5DA3583F/t51.2885-19/s150x150/56531410_2341301716101472_3124717612693454848_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com" -->
<!-- 								alt="luvdungii님의 프로필 사진"></span> -->
<!-- 						</div> -->
<!-- 						<div class="o-MQd  z8cbW"> -->
<!-- 							<div class=" RqtMr"> -->
<!-- 								<div class="e1e1d"> -->
<!-- 									<h2 class="BrX75"> -->
<!-- 										<a class="FPmhX notranslate nJAzx" title="luvdungii" -->
<!-- 											href="/luvdungii/">luvdungii</a> -->
<!-- 									</h2> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="M30cS"> -->
<!-- 								<div></div> -->
<!-- 								<div class="JF9hh"></div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</header> -->
<!-- 					<div class="_97aPb "> -->
<!-- 						<div role="button" tabindex="0" class="ZyFrc"> -->
<!-- 							<div class="eLAPa kPFhm"> -->
<!-- 								<div class="KL4Bh" style="padding-bottom: 124.907%;"> -->
<!-- 									<img alt="이미지: 사람 1명 이상, 실내" class="FFVAD" decoding="auto" -->
<!-- 										sizes="613.9874877929688px" -->
<!-- 										srcset="https://scontent-icn1-1.cdninstagram.com/vp/226261ebb62ff1ea492ec661d72c4795/5DA9A6FE/t51.2885-15/sh0.08/e35/p640x640/62402815_468340257263482_4356957293303685007_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 640w,https://scontent-icn1-1.cdninstagram.com/vp/349437ef5ee202037cf995f6f920ea84/5DA364FE/t51.2885-15/sh0.08/e35/p750x750/62402815_468340257263482_4356957293303685007_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 750w,https://scontent-icn1-1.cdninstagram.com/vp/c712cffbc838892cd47c4f06db0dc846/5DB9331B/t51.2885-15/e35/p1080x1080/62402815_468340257263482_4356957293303685007_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 1080w" -->
<!-- 										src="https://scontent-icn1-1.cdninstagram.com/vp/c712cffbc838892cd47c4f06db0dc846/5DB9331B/t51.2885-15/e35/p1080x1080/62402815_468340257263482_4356957293303685007_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com" -->
<!-- 										style="object-fit: cover;"> -->
<!-- 								</div> -->
<!-- 								<div class="_9AhH0"></div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="eo2As "> -->
<!-- 						<section class="ltpMr Slqrh"> -->
<!-- 							<span class="fr66n"><button class="dCJp8 afkep _0mzm-"> -->
<!-- 									<span class="glyphsSpriteHeart__outline__24__grey_9 u-__7" -->
<!-- 										aria-label="좋아요"></span> -->
<!-- 								</button></span><span class="_15y0l"><button class="dCJp8 afkep _0mzm-"> -->
<!-- 									<span class="glyphsSpriteComment__outline__24__grey_9 u-__7" -->
<!-- 										aria-label="댓글 달기"></span> -->
<!-- 								</button></span><span class="wmtNn"><button class="dCJp8 afkep _0mzm-"> -->
<!-- 									<span class="glyphsSpriteSave__outline__24__grey_9 u-__7" -->
<!-- 										aria-label="저장"></span> -->
<!-- 								</button></span> -->
<!-- 						</section> -->
<!-- 						<section class="EDfFK ygqzn"> -->
<!-- 							<div -->
<!-- 								class="                  Igw0E     IwRSH      eGOV_     ybXk5   vwCYk                                                                                                               "> -->
<!-- 								<div class="Nm9Fw"> -->
<!-- 									<a class="zV_Nj" -->
<!-- 										href="/p/BzvXpU6pN33oZ9FVEr7_G7jtHMQrqQnQ6jJr-E0/liked_by/">좋아요 -->
<!-- 										<span>2</span>개 -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</section> -->
<!-- 						<div class="KlCQn  EtaWk"> -->
<!-- 							<ul class="k59kT"> -->
<!-- 								<div role="button" class="ZyFrc"> -->
<!-- 									<li class="gElp9 " role="menuitem"><div class="P9YgZ"> -->
<!-- 											<div class="C7I1f X7jCj"> -->
<!-- 												<div class="C4VMK"> -->
<!-- 													<h2 class="_6lAjh"> -->
<!-- 														<a class="FPmhX notranslate TlrDj" title="luvdungii" -->
<!-- 															href="/luvdungii/">luvdungii</a> -->
<!-- 													</h2> -->
<!-- 													<span><span>지난 날🍃</span></span> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div></li> -->
<!-- 								</div> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 						<div class="k_Q0X NnvRN"> -->
<!-- 							<a class="c-Yi7" -->
<!-- 								href="/p/BzvXpU6pN33oZ9FVEr7_G7jtHMQrqQnQ6jJr-E0/"><time -->
<!-- 									class="_1o9PC Nzb55" datetime="2019-07-10T14:48:16.000Z" -->
<!-- 									title="2019년 7월 10일">2분 전</time></a> -->
<!-- 						</div> -->
<!-- 						<section class="sH9wk  _JgwE "> -->
<!-- 							<div class="RxpZH"> -->
<!-- 								<form class="X7cDz" method="POST"> -->
<!-- 									<textarea aria-label="댓글 달기..." placeholder="댓글 달기..." -->
<!-- 										class="Ypffh" autocomplete="off" autocorrect="off"></textarea> -->
<!-- 									<button class="_0mzm- sqdOP yWX7d        " disabled="" -->
<!-- 										type="submit">게시</button> -->
<!-- 								</form> -->
<!-- 							</div> -->
<!-- 						</section> -->
<!-- 					</div> -->
<!-- 					<div class="MEAGs"> -->
<!-- 						<button class="dCJp8 afkep _0mzm-"> -->
<!-- 							<span -->
<!-- 								class="glyphsSpriteMore_horizontal__outline__24__grey_9 u-__7" -->
<!-- 								aria-label="옵션 더 보기"></span> -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 				</article> -->
<!-- 				<article class="_8Rm4L M9sTE  L_LMM SgTZ1   ePUX4"> -->
<!-- 					<header class="Ppjfr UE9AK  wdOqh"> -->
<!-- 						<div class="RR-M- h5uC0 mrq0Z" role="button" tabindex="0"> -->
<%-- 							<canvas class="CfWVH" height="36" width="36" --%>
<%-- 								style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas> --%>
<!-- 							<span class="_2dbep " role="link" tabindex="0" -->
<!-- 								style="width: 32px; height: 32px;"><img class="_6q-tv" -->
<!-- 								src="https://scontent-icn1-1.cdninstagram.com/vp/9e0f659ae8050f889ccd19af96427e05/5DC10AD0/t51.2885-19/s150x150/45517846_1956294808005540_8341003776492044288_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com" -->
<!-- 								alt="meeeensoo님의 프로필 사진"></span> -->
<!-- 						</div> -->
<!-- 						<div class="o-MQd  z8cbW"> -->
<!-- 							<div class=" RqtMr"> -->
<!-- 								<div class="e1e1d"> -->
<!-- 									<h2 class="BrX75"> -->
<!-- 										<a class="FPmhX notranslate nJAzx" title="meeeensoo" -->
<!-- 											href="/meeeensoo/">meeeensoo</a> -->
<!-- 									</h2> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="M30cS"> -->
<!-- 								<div></div> -->
<!-- 								<div class="JF9hh"> -->
<!-- 									<a class="O4GlU" -->
<!-- 										href="/explore/locations/625433517661333/invited/">인바이티드, -->
<!-- 										invited.</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</header> -->
<!-- 					<div class="_97aPb "> -->
<!-- 						<div role="button" tabindex="0" class="ZyFrc"> -->
<!-- 							<div class="kPFhm kHt39  plVq-"> -->
<!-- 								<div class="eLAPa _23QFA" role="button" tabindex="0"> -->
<!-- 									<div class="KL4Bh" style="padding-bottom: 115.185%;"> -->
<!-- 										<img alt="이미지: 사람 1명 이상, 사람들이 서 있음, 실외" class="FFVAD" -->
<!-- 											decoding="auto" sizes="613.9874877929688px" -->
<!-- 											srcset="https://scontent-icn1-1.cdninstagram.com/vp/0430abbf35d3759b130094c726badc6c/5DA2F660/t51.2885-15/sh0.08/e35/p640x640/67080299_123027441993041_3773757460864725880_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 640w,https://scontent-icn1-1.cdninstagram.com/vp/2c13db4c356586d53d71afb11c266536/5DB3F960/t51.2885-15/sh0.08/e35/p750x750/67080299_123027441993041_3773757460864725880_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 750w,https://scontent-icn1-1.cdninstagram.com/vp/5c0ec22cb3cfcd40f0e8664dbb9c75fa/5DA60885/t51.2885-15/e35/p1080x1080/67080299_123027441993041_3773757460864725880_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 1080w" -->
<!-- 											src="https://scontent-icn1-1.cdninstagram.com/vp/5c0ec22cb3cfcd40f0e8664dbb9c75fa/5DA60885/t51.2885-15/e35/p1080x1080/67080299_123027441993041_3773757460864725880_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com" -->
<!-- 											style="object-fit: cover;"> -->
<!-- 									</div> -->
<!-- 									<div class="_9AhH0"></div> -->
<!-- 								</div> -->
<!-- 								<div class="xUdfV" -->
<!-- 									style="left: 49.3333%; margin-top: -6px; top: 90.3111%; transform: translate(-50%, -100%);"> -->
<!-- 									<a class="JYWcJ" href="/nike/"><span class="wCuNw"><div -->
<!-- 												class="Mu0TI  _6XC01" style="left: 50%;"></div> <span -->
<!-- 											class="eg3Fv">nike</span></span></a> -->
<!-- 								</div> -->
<!-- 								<div class="xUdfV" -->
<!-- 									style="left: 50.8444%; margin-top: 6px; top: 35.6444%; transform: translate(-50%, 0%);"> -->
<!-- 									<a class="JYWcJ" href="/enuff_seoul/"><span class="wCuNw"><div -->
<!-- 												class="Mu0TI Vj5NV " style="left: 50%;"></div> <span -->
<!-- 											class="eg3Fv">enuff_seoul</span></span></a> -->
<!-- 								</div> -->
<!-- 								<button class="G_hoz LcKDX _6JfJs"> -->
<!-- 									<div class="HBUJV"> -->
<!-- 										<span class="glyphsSpriteUser__filled__24__grey_0 u-__7" -->
<!-- 											aria-label="태그"></span> -->
<!-- 									</div> -->
<!-- 								</button> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="eo2As "> -->
<!-- 						<section class="ltpMr Slqrh"> -->
<!-- 							<span class="fr66n"><button class="dCJp8 afkep _0mzm-"> -->
<!-- 									<span class="glyphsSpriteHeart__outline__24__grey_9 u-__7" -->
<!-- 										aria-label="좋아요"></span> -->
<!-- 								</button></span><span class="_15y0l"><button class="dCJp8 afkep _0mzm-"> -->
<!-- 									<span class="glyphsSpriteComment__outline__24__grey_9 u-__7" -->
<!-- 										aria-label="댓글 달기"></span> -->
<!-- 								</button></span><span class="_5e4p"><button class="dCJp8 afkep _0mzm-"> -->
<!-- 									<span class="glyphsSpriteShare__outline__24__grey_9 u-__7" -->
<!-- 										aria-label="게시물 공유"></span> -->
<!-- 								</button></span><span class="wmtNn"><button class="dCJp8 afkep _0mzm-"> -->
<!-- 									<span class="glyphsSpriteSave__outline__24__grey_9 u-__7" -->
<!-- 										aria-label="저장"></span> -->
<!-- 								</button></span> -->
<!-- 						</section> -->
<!-- 						<section class="EDfFK ygqzn"> -->
<!-- 							<div -->
<!-- 								class="                  Igw0E     IwRSH      eGOV_     ybXk5   vwCYk                                                                                                               "> -->
<!-- 								<div class="Nm9Fw"> -->
<!-- 									<a class="zV_Nj" href="/p/BzvU3KqHGhK/liked_by/">좋아요 <span>92</span>개 -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</section> -->
<!-- 						<div class="KlCQn  EtaWk"> -->
<!-- 							<ul class="k59kT"> -->
<!-- 								<div role="button" class="ZyFrc"> -->
<!-- 									<li class="gElp9 " role="menuitem"><div class="P9YgZ"> -->
<!-- 											<div class="C7I1f X7jCj"> -->
<!-- 												<div class="C4VMK"> -->
<!-- 													<h2 class="_6lAjh"> -->
<!-- 														<a class="FPmhX notranslate TlrDj" title="meeeensoo" -->
<!-- 															href="/meeeensoo/">meeeensoo</a> -->
<!-- 													</h2> -->
<!-- 													<span><span>뜻 깊고 뜻 깊은 하루였다</span></span> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div></li> -->
<!-- 								</div> -->
<!-- 								<li class="lnrre"><button -->
<!-- 										class="Z4IfV _0mzm- sqdOP yWX7d        " type="button"> -->
<!-- 										댓글 <span>3</span>개 모두 보기 -->
<!-- 									</button></li> -->
<!-- 								<div role="button" class="ZyFrc"> -->
<!-- 									<li class="gElp9 " role="menuitem"><div class="P9YgZ"> -->
<!-- 											<div class="C7I1f "> -->
<!-- 												<div class="C4VMK"> -->
<!-- 													<h3 class="_6lAjh"> -->
<!-- 														<a class="FPmhX notranslate TlrDj" title="ryian678912" -->
<!-- 															href="/ryian678912/">ryian678912</a> -->
<!-- 													</h3> -->
<!-- 													<span><span>Nice one</span></span> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<span class="jdtwu"><button class="_2ic5v"> -->
<!-- 													<span class="glyphsSpriteComment_like u-__7" -->
<!-- 														aria-label="좋아요"></span> -->
<!-- 												</button></span> -->
<!-- 										</div></li> -->
<!-- 								</div> -->
<!-- 								<div role="button" class="ZyFrc"> -->
<!-- 									<li class="gElp9 " role="menuitem"><div class="P9YgZ"> -->
<!-- 											<div class="C7I1f "> -->
<!-- 												<div class="C4VMK"> -->
<!-- 													<h3 class="_6lAjh"> -->
<!-- 														<a class="FPmhX notranslate TlrDj" title="someday.outfit" -->
<!-- 															href="/someday.outfit/">someday.outfit</a> -->
<!-- 													</h3> -->
<!-- 													<span><span>정말 보석같은 피드네요!! 소통하고 싶은데 제 누추한 제 -->
<!-- 															피드에 와주실수 있나요? (´Д｀*)</span></span> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<span class="jdtwu"><button class="_2ic5v"> -->
<!-- 													<span class="glyphsSpriteComment_like u-__7" -->
<!-- 														aria-label="좋아요"></span> -->
<!-- 												</button></span> -->
<!-- 										</div></li> -->
<!-- 								</div> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 						<div class="k_Q0X NnvRN"> -->
<!-- 							<a class="c-Yi7" href="/p/BzvU3KqHGhK/"><time -->
<!-- 									class="_1o9PC Nzb55" datetime="2019-07-10T14:23:57.000Z" -->
<!-- 									title="2019년 7월 10일">27분 전</time></a> -->
<!-- 						</div> -->
<!-- 						<section class="sH9wk  _JgwE "> -->
<!-- 							<div class="RxpZH"> -->
<!-- 								<form class="X7cDz" method="POST"> -->
<!-- 									<textarea aria-label="댓글 달기..." placeholder="댓글 달기..." -->
<!-- 										class="Ypffh" autocomplete="off" autocorrect="off"></textarea> -->
<!-- 									<button class="_0mzm- sqdOP yWX7d        " disabled="" -->
<!-- 										type="submit">게시</button> -->
<!-- 								</form> -->
<!-- 							</div> -->
<!-- 						</section> -->
<!-- 					</div> -->
<!-- 					<div class="MEAGs"> -->
<!-- 						<button class="dCJp8 afkep _0mzm-"> -->
<!-- 							<span -->
<!-- 								class="glyphsSpriteMore_horizontal__outline__24__grey_9 u-__7" -->
<!-- 								aria-label="옵션 더 보기"></span> -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 				</article> -->
<!-- 				<article class="_8Rm4L M9sTE  L_LMM SgTZ1   ePUX4"> -->
<!-- 					<header class="Ppjfr UE9AK  wdOqh"> -->
<!-- 						<div class="RR-M-  mrq0Z" role="button" tabindex="0"> -->
<%-- 							<canvas class="CfWVH" height="36" width="36" --%>
<%-- 								style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas> --%>
<!-- 							<a class="_2dbep qNELH kIKUG" href="/soso.case/" -->
<!-- 								style="width: 32px; height: 32px;"><img class="_6q-tv" -->
<!-- 								src="https://scontent-icn1-1.cdninstagram.com/vp/c6927e983249d1db506d1299c275abe0/5DC49966/t51.2885-19/s150x150/50331168_1933860523379262_8114664643579871232_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com" -->
<!-- 								alt="soso.case님의 프로필 사진"></a> -->
<!-- 						</div> -->
<!-- 						<div class="o-MQd  z8cbW"> -->
<!-- 							<div class=" RqtMr"> -->
<!-- 								<div class="e1e1d"> -->
<!-- 									<h2 class="BrX75"> -->
<!-- 										<a class="FPmhX notranslate nJAzx" title="soso.case" -->
<!-- 											href="/soso.case/">soso.case</a> -->
<!-- 									</h2> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="M30cS"> -->
<!-- 								<div></div> -->
<!-- 								<div class="JF9hh"></div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</header> -->
<!-- 					<div class="_97aPb "> -->
<!-- 						<div role="button" tabindex="0" class="ZyFrc"> -->
<!-- 							<div class="ZyFrc" role="dialog"> -->
<!-- 								<div class="OAXCp "> -->
<!-- 									<div class="GRtmf wymO0 "> -->
<!-- 										<div class="_5wCQW"> -->
<!-- 											<video class="tWeCl" playsinline="" -->
<!-- 												poster="https://scontent-icn1-1.cdninstagram.com/vp/cc268a12b046cf991262704ae93ca424/5D291641/t51.2885-15/e35/66988522_637437413427510_7173014940705078133_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com" -->
<!-- 												preload="none" -->
<!-- 												src="https://scontent-icn1-1.cdninstagram.com/vp/f3e4d1975a3d2f07551e07d22e41d2aa/5D288183/t50.2886-16/66451634_2359164721008579_5846717755813403187_n.mp4?_nc_ht=scontent-icn1-1.cdninstagram.com" -->
<!-- 												type="video/mp4"></video> -->
<!-- 											<img alt="" class="_8jZFn" -->
<!-- 												src="https://scontent-icn1-1.cdninstagram.com/vp/cc268a12b046cf991262704ae93ca424/5D291641/t51.2885-15/e35/66988522_637437413427510_7173014940705078133_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="oujXn"> -->
<!-- 										<div class="B2xwy P6lRB ">소리를 켜려면 동영상을 클릭하세요</div> -->
<!-- 										<div class="y4vpg VXgpI"> -->
<!-- 											<span class="mediatypesSpriteVideo__filled__32 u-__7" -->
<!-- 												aria-label="동영상"></span> -->
<!-- 										</div> -->
<!-- 										<span class="B2xwy _3G0Ji PTIMp videoSpritePlayButton" -->
<!-- 											role="button"><span class="jNBsH">재생</span></span> -->
<!-- 									</div> -->
<!-- 									<a class="QvAa1 " href="javascript:;" role="button" target=""><span -->
<!-- 										class="jNBsH">제어</span></a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="eo2As "> -->
<!-- 						<section class="ltpMr Slqrh"> -->
<!-- 							<span class="fr66n"><button class="dCJp8 afkep _0mzm-"> -->
<!-- 									<span class="glyphsSpriteHeart__outline__24__grey_9 u-__7" -->
<!-- 										aria-label="좋아요"></span> -->
<!-- 								</button></span><span class="_15y0l"><button class="dCJp8 afkep _0mzm-"> -->
<!-- 									<span class="glyphsSpriteComment__outline__24__grey_9 u-__7" -->
<!-- 										aria-label="댓글 달기"></span> -->
<!-- 								</button></span><span class="_5e4p"><button class="dCJp8 afkep _0mzm-"> -->
<!-- 									<span class="glyphsSpriteShare__outline__24__grey_9 u-__7" -->
<!-- 										aria-label="게시물 공유"></span> -->
<!-- 								</button></span><span class="wmtNn"><button class="dCJp8 afkep _0mzm-"> -->
<!-- 									<span class="glyphsSpriteSave__outline__24__grey_9 u-__7" -->
<!-- 										aria-label="저장"></span> -->
<!-- 								</button></span> -->
<!-- 						</section> -->
<!-- 						<section class="EDfFK ygqzn"> -->
<!-- 							<div class="HbPOm _9Ytll"> -->
<!-- 								<span class="vcOH2" role="button" tabindex="0">조회 <span>196</span>회 -->
<!-- 								</span> -->
<!-- 							</div> -->
<!-- 						</section> -->
<!-- 						<div class="KlCQn  EtaWk"> -->
<!-- 							<ul class="k59kT"> -->
<!-- 								<div role="button" class="ZyFrc"> -->
<!-- 									<li class="gElp9 " role="menuitem"><div class="P9YgZ"> -->
<!-- 											<div class="C7I1f X7jCj"> -->
<!-- 												<div class="C4VMK"> -->
<!-- 													<h2 class="_6lAjh"> -->
<!-- 														<a class="FPmhX notranslate TlrDj" title="soso.case" -->
<!-- 															href="/soso.case/">soso.case</a> -->
<!-- 													</h2> -->
<!-- 													<span><span>소소 신상🎈드라이플라워💐 에어팟키링</span><span -->
<!-- 														class="_2UvmX">...&nbsp; -->
<!-- 															<button class="sXUSN">더 보기</button> -->
<!-- 													</span></span> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div></li> -->
<!-- 								</div> -->
<!-- 								<div role="button" class="ZyFrc"> -->
<!-- 									<li class="gElp9 " role="menuitem"><div class="P9YgZ"> -->
<!-- 											<div class="C7I1f "> -->
<!-- 												<div class="C4VMK"> -->
<!-- 													<h3 class="_6lAjh"> -->
<!-- 														<a class="FPmhX notranslate TlrDj" title="soso.case" -->
<!-- 															href="/soso.case/">soso.case</a> -->
<!-- 													</h3> -->
<!-- 													<span><span><a class="" -->
<!-- 															href="/explore/tags/아이폰케이스/">#아이폰케이스</a><a class="" -->
<!-- 															href="/explore/tags/열쇠고리/">#열쇠고리</a><a class="" -->
<!-- 															href="/explore/tags/키링/">#키링</a><a class="" -->
<!-- 															href="/explore/tags/일상/">#일상</a><a class="" -->
<!-- 															href="/explore/tags/데일리/">#데일리</a><a class="" -->
<!-- 															href="/explore/tags/셀피/">#셀피</a><a class="" -->
<!-- 															href="/explore/tags/소통/">#소통</a><a class="" -->
<!-- 															href="/explore/tags/커플키링/">#커플키링</a><a class="" -->
<!-- 															href="/explore/tags/키홀더/">#키홀더</a><a class="" -->
<!-- 															href="/explore/tags/차키링/">#차키링</a><a class="" -->
<!-- 															href="/explore/tags/슬라임/">#슬라임</a><a class="" -->
<!-- 															href="/explore/tags/핸드메이드/">#핸드메이드</a><a class="" -->
<!-- 															href="/explore/tags/마카롱/">#마카롱</a><a class="" -->
<!-- 															href="/explore/tags/패디/">#패디</a><a class="" -->
<!-- 															href="/explore/tags/네일/">#네일</a><a class="" -->
<!-- 															href="/explore/tags/태슬케이스/">#태슬케이스</a><a class="" -->
<!-- 															href="/explore/tags/여름네일/">#여름네일</a></span></span> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 											<span class="jdtwu"><button class="_2ic5v"> -->
<!-- 													<span class="glyphsSpriteComment_like u-__7" -->
<!-- 														aria-label="좋아요"></span> -->
<!-- 												</button></span> -->
<!-- 										</div></li> -->
<!-- 								</div> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 						<div class="k_Q0X NnvRN"> -->
<!-- 							<a class="c-Yi7" href="/p/BzvUD-_neIG/"><time -->
<!-- 									class="_1o9PC Nzb55" datetime="2019-07-10T14:17:04.000Z" -->
<!-- 									title="2019년 7월 10일">34분 전</time></a> -->
<!-- 						</div> -->
<!-- 						<section class="sH9wk  _JgwE "> -->
<!-- 							<div class="RxpZH"> -->
<!-- 								<form class="X7cDz" method="POST"> -->
<!-- 									<textarea aria-label="댓글 달기..." placeholder="댓글 달기..." -->
<!-- 										class="Ypffh" autocomplete="off" autocorrect="off"></textarea> -->
<!-- 									<button class="_0mzm- sqdOP yWX7d        " disabled="" -->
<!-- 										type="submit">게시</button> -->
<!-- 								</form> -->
<!-- 							</div> -->
<!-- 						</section> -->
<!-- 					</div> -->
<!-- 					<div class="MEAGs"> -->
<!-- 						<button class="dCJp8 afkep _0mzm-"> -->
<!-- 							<span -->
<!-- 								class="glyphsSpriteMore_horizontal__outline__24__grey_9 u-__7" -->
<!-- 								aria-label="옵션 더 보기"></span> -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 				</article> -->
<!-- 				<article class="_8Rm4L M9sTE  L_LMM SgTZ1   ePUX4"> -->
<!-- 					<header class="Ppjfr UE9AK  wdOqh"> -->
<!-- 						<div class="RR-M- h5uC0 mrq0Z" role="button" tabindex="0"> -->
<%-- 							<canvas class="CfWVH" height="36" width="36" --%>
<%-- 								style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas> --%>
<!-- 							<span class="_2dbep " role="link" tabindex="0" -->
<!-- 								style="width: 32px; height: 32px;"><img class="_6q-tv" -->
<!-- 								src="https://scontent-icn1-1.cdninstagram.com/vp/146c70fd4248d1c59c4f12ad8e8cef78/5DA7B9A8/t51.2885-19/s150x150/13188031_1450184498340305_2052978675_a.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com" -->
<!-- 								alt="hiphoper_com님의 프로필 사진"></span> -->
<!-- 						</div> -->
<!-- 						<div class="o-MQd  z8cbW"> -->
<!-- 							<div class=" RqtMr"> -->
<!-- 								<div class="e1e1d"> -->
<!-- 									<h2 class="BrX75"> -->
<!-- 										<a class="FPmhX notranslate nJAzx" title="hiphoper_com" -->
<!-- 											href="/hiphoper_com/">hiphoper_com</a> -->
<!-- 									</h2> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="M30cS"> -->
<!-- 								<div></div> -->
<!-- 								<div class="JF9hh"></div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</header> -->
<!-- 					<div class="_97aPb "> -->
<!-- 						<div role="button" tabindex="0" class="ZyFrc"> -->
<!-- 							<div class="eLAPa kPFhm"> -->
<!-- 								<div class="KL4Bh" style="padding-bottom: 100%;"> -->
<!-- 									<img alt="이미지: 사람 1명 이상, 사람들이 앉아 있는 중, 거실, 실내" class="FFVAD" -->
<!-- 										decoding="auto" sizes="613.9874877929688px" -->
<!-- 										srcset="https://scontent-icn1-1.cdninstagram.com/vp/e88c254a03666591031d03a3b08416a6/5DB957EA/t51.2885-15/sh0.08/e35/s640x640/66350294_138912377306370_415673690860066614_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 640w,https://scontent-icn1-1.cdninstagram.com/vp/6b0893b8a445d58701f1004254099179/5DACF115/t51.2885-15/sh0.08/e35/s750x750/66350294_138912377306370_415673690860066614_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 750w,https://scontent-icn1-1.cdninstagram.com/vp/bbe72b2a52aa83d01a9c17aef05f4ec6/5DA52099/t51.2885-15/e35/66350294_138912377306370_415673690860066614_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com 1080w" -->
<!-- 										src="https://scontent-icn1-1.cdninstagram.com/vp/bbe72b2a52aa83d01a9c17aef05f4ec6/5DA52099/t51.2885-15/e35/66350294_138912377306370_415673690860066614_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com" -->
<!-- 										style="object-fit: cover;"> -->
<!-- 								</div> -->
<!-- 								<div class="_9AhH0"></div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="eo2As "> -->
<!-- 						<section class="ltpMr Slqrh"> -->
<!-- 							<span class="fr66n"><button class="dCJp8 afkep _0mzm-"> -->
<!-- 									<span class="glyphsSpriteHeart__outline__24__grey_9 u-__7" -->
<!-- 										aria-label="좋아요"></span> -->
<!-- 								</button></span><span class="_15y0l"><button class="dCJp8 afkep _0mzm-"> -->
<!-- 									<span class="glyphsSpriteComment__outline__24__grey_9 u-__7" -->
<!-- 										aria-label="댓글 달기"></span> -->
<!-- 								</button></span><span class="_5e4p"><button class="dCJp8 afkep _0mzm-"> -->
<!-- 									<span class="glyphsSpriteShare__outline__24__grey_9 u-__7" -->
<!-- 										aria-label="게시물 공유"></span> -->
<!-- 								</button></span><span class="wmtNn"><button class="dCJp8 afkep _0mzm-"> -->
<!-- 									<span class="glyphsSpriteSave__outline__24__grey_9 u-__7" -->
<!-- 										aria-label="저장"></span> -->
<!-- 								</button></span> -->
<!-- 						</section> -->
<!-- 						<section class="EDfFK ygqzn"> -->
<!-- 							<div -->
<!-- 								class="                  Igw0E     IwRSH      eGOV_     ybXk5   vwCYk                                                                                                               "> -->
<!-- 								<div class="Nm9Fw"> -->
<!-- 									<a class="zV_Nj" href="/p/BzuieeUHymf/liked_by/">좋아요 <span>91</span>개 -->
<!-- 									</a> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</section> -->
<!-- 						<div class="KlCQn  EtaWk"> -->
<!-- 							<ul class="k59kT"> -->
<!-- 								<div role="button" class="ZyFrc"> -->
<!-- 									<li class="gElp9 " role="menuitem"><div class="P9YgZ"> -->
<!-- 											<div class="C7I1f X7jCj"> -->
<!-- 												<div class="C4VMK"> -->
<!-- 													<h2 class="_6lAjh"> -->
<!-- 														<a class="FPmhX notranslate TlrDj" title="hiphoper_com" -->
<!-- 															href="/hiphoper_com/">hiphoper_com</a> -->
<!-- 													</h2> -->
<!-- 													<span><span>⠀</span><span class="_2UvmX">...&nbsp; -->
<!-- 															<button class="sXUSN">더 보기</button> -->
<!-- 													</span></span> -->
<!-- 												</div> -->
<!-- 											</div> -->
<!-- 										</div></li> -->
<!-- 								</div> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 						<div class="k_Q0X NnvRN"> -->
<!-- 							<a class="c-Yi7" href="/p/BzuieeUHymf/"><time -->
<!-- 									class="_1o9PC Nzb55" datetime="2019-07-10T07:03:40.000Z" -->
<!-- 									title="2019년 7월 10일">7시간 전</time></a> -->
<!-- 						</div> -->
<!-- 						<section class="sH9wk  _JgwE "> -->
<!-- 							<div class="RxpZH"> -->
<!-- 								<form class="X7cDz" method="POST"> -->
<!-- 									<textarea aria-label="댓글 달기..." placeholder="댓글 달기..." -->
<!-- 										class="Ypffh" autocomplete="off" autocorrect="off"></textarea> -->
<!-- 									<button class="_0mzm- sqdOP yWX7d        " disabled="" -->
<!-- 										type="submit">게시</button> -->
<!-- 								</form> -->
<!-- 							</div> -->
<!-- 						</section> -->
<!-- 					</div> -->
<!-- 					<div class="MEAGs"> -->
<!-- 						<button class="dCJp8 afkep _0mzm-"> -->
<!-- 							<span -->
<!-- 								class="glyphsSpriteMore_horizontal__outline__24__grey_9 u-__7" -->
<!-- 								aria-label="옵션 더 보기"></span> -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 				</article> -->
			</div>
		</div>
		<div class="Id0Rh">
			<div
				class="                  Igw0E     IwRSH        YBx95       _4EzTm                                                                                                               _9qQ0O ZUqME"
				style="height: 32px; width: 32px;">
				<svg class="  By4nA" viewBox="0 0 100 100">
								<rect fill="#555555" height="6" opacity="0" rx="3" ry="3"
						transform="rotate(-90 50 50)" width="25" x="72" y="47"></rect>
								<rect fill="#555555" height="6" opacity="0.08333333333333333"
						rx="3" ry="3" transform="rotate(-60 50 50)" width="25" x="72"
						y="47"></rect>
								<rect fill="#555555" height="6" opacity="0.16666666666666666"
						rx="3" ry="3" transform="rotate(-30 50 50)" width="25" x="72"
						y="47"></rect>
								<rect fill="#555555" height="6" opacity="0.25" rx="3" ry="3"
						transform="rotate(0 50 50)" width="25" x="72" y="47"></rect>
								<rect fill="#555555" height="6" opacity="0.3333333333333333"
						rx="3" ry="3" transform="rotate(30 50 50)" width="25" x="72"
						y="47"></rect>
								<rect fill="#555555" height="6" opacity="0.4166666666666667"
						rx="3" ry="3" transform="rotate(60 50 50)" width="25" x="72"
						y="47"></rect>
								<rect fill="#555555" height="6" opacity="0.5" rx="3" ry="3"
						transform="rotate(90 50 50)" width="25" x="72" y="47"></rect>
								<rect fill="#555555" height="6" opacity="0.5833333333333334"
						rx="3" ry="3" transform="rotate(120 50 50)" width="25" x="72"
						y="47"></rect>
								<rect fill="#555555" height="6" opacity="0.6666666666666666"
						rx="3" ry="3" transform="rotate(150 50 50)" width="25" x="72"
						y="47"></rect>
								<rect fill="#555555" height="6" opacity="0.75" rx="3" ry="3"
						transform="rotate(180 50 50)" width="25" x="72" y="47"></rect>
								<rect fill="#555555" height="6" opacity="0.8333333333333334"
						rx="3" ry="3" transform="rotate(210 50 50)" width="25" x="72"
						y="47"></rect>
								<rect fill="#555555" height="6" opacity="0.9166666666666666"
						rx="3" ry="3" transform="rotate(240 50 50)" width="25" x="72"
						y="47"></rect></svg>
			</div>
		</div>
	</div>
	<div class="XmSS_"></div>
	
	<div class="COOzN ">
		<div class="m0NAq">
			<div class="nwXS6">
				<div class="RR-M-  _2NjG_" role="button" tabindex="0">
					<canvas class="CfWVH" height="51" width="51"
						style="position: absolute; top: -5px; left: -5px; width: 60px; height: 60px;"></canvas>
					<a class="_2dbep qNELH kIKUG" href="/jjjindong/"
						style="width: 50px; height: 50px;"><img class="_6q-tv"
						src="https://instagram.fbkk2-7.fna.fbcdn.net/vp/b85731ac007d1c0469f42c542c593daa/5DA39AF1/t51.2885-19/44884218_345707102882519_2446069589734326272_n.jpg?_nc_ht=instagram.fbkk2-7.fna.fbcdn.net"
						alt="jjjindong님의 프로필 사진"></a>
				</div>
				<div class="_0v2O4">
					<div class="SKguc">
						<a class="gmFkV" href="/jjjindong/">jjjindong</a>
					</div>
				</div>
			</div>
		</div>
		<button class="writeBoard">게시글 작성</button>
		<div
			class="  _6Rvw2      DPiy6          Igw0E     IwRSH      eGOV_         _4EzTm     _22l1                                                      _49XvD                                                    b2rUF ZUqME">
			<div
				class="                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                           _49XvD                        XfCBB         XTCZH                   ZUqME">
				<div
					class="                  Igw0E     IwRSH      eGOV_        vwCYk                                                                                                               ">
					<div
						class="_7UhW9   xLCgt       qyrsm  _0PwGv       uL8Hv          fTMOG">회원님을
						위한 추천</div>
				</div>
				<a class="_0mzm- sqdOP yWX7d    _8A5w5   ZIAjV "
					href="/explore/people/"><div
						class="_7UhW9  PIoXz        qyrsm KV-D4        uL8Hv         ">모두
						보기</div></a>
			</div>
			<div
				class="                  Igw0E     IwRSH      eGOV_         _4EzTm   pjcA_                  WKY0a                                                                                         ">
				<div
					class="        DPiy6          Igw0E     IwRSH      eGOV_         _4EzTm                                                                                             HVWg4                 ">
					<div style="height: auto; overflow: hidden auto;">
						<div
							style="flex-direction: column; padding-bottom: 0px; padding-top: 0px;">
							<div
								class="                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                   XfCBB          HVWg4                  _0mzm- ZUqME"
								aria-labelledby="f3361adf16a4a5c fbb4c70faef91c">
								<div
									class="                  Igw0E     IwRSH      eGOV_         _4EzTm                                         yC0tu                                                                     ">
									<div class="RR-M- " role="button" tabindex="0">
										<canvas class="CfWVH" height="36" width="36"
											style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas>
										<a class="_2dbep qNELH kIKUG" href="/yunsang771/"
											style="width: 32px; height: 32px;"><img class="_6q-tv"
											src="https://scontent-icn1-1.cdninstagram.com/vp/66f5f0d41eefae692edc9cad0bcea197/5DAE626D/t51.2885-19/s150x150/60988056_2427229434219452_5346493689424248832_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
											alt="yunsang771님의 프로필 사진"></a>
									</div>
								</div>
								<div
									class="                  Igw0E     IwRSH        YBx95      vwCYk                                                                                                               ">
									<div
										class="                  Igw0E     IwRSH      eGOV_         _4EzTm                                                                                                              "
										id="f3361adf16a4a5c">
										<div
											class="_7UhW9   xLCgt      MMzan  KV-D4            fDxYl     ">
											<a title="yunsang771" href="/yunsang771/"><div
													class="                  Igw0E     IwRSH      eGOV_     ybXk5    _4EzTm                                                                                                              ">
													<div
														class="_7UhW9   xLCgt       qyrsm KV-D4            fDxYl      rWtOq">
														<div
															class="                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                                              ">yunsang771</div>
													</div>
												</div></a>
										</div>
									</div>
									<div
										class="                  Igw0E     IwRSH      eGOV_         _4EzTm                                                          DhRcB                                                    ">
										<div
											class="_7UhW9  PIoXz       MMzan   _0PwGv           fDxYl     ">y_sh__님이
											팔로우합니다</div>
									</div>
								</div>
								<div
									class="                  Igw0E   rBNOH          YBx95   ybXk5    _4EzTm                      soMvl                                                                                        ">
									<button class="PoNcp _0mzm- sqdOP yWX7d        " type="button">팔로우</button>
								</div>
							</div>
							<div
								class="                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                   XfCBB          HVWg4                  _0mzm- ZUqME"
								aria-labelledby="f16f127374c9c8 f3d63be6f70dcfc">
								<div
									class="                  Igw0E     IwRSH      eGOV_         _4EzTm                                         yC0tu                                                                     ">
									<div class="RR-M- " role="button" tabindex="0">
										<canvas class="CfWVH" height="36" width="36"
											style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas>
										<a class="_2dbep qNELH kIKUG" href="/94_kmuk/"
											style="width: 32px; height: 32px;"><img class="_6q-tv"
											src="https://scontent-icn1-1.cdninstagram.com/vp/f12bd7caef3fc5326442be956189056d/5DA764E4/t51.2885-19/s150x150/57284768_180358399511415_5559840340107591680_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
											alt="94_kmuk님의 프로필 사진"></a>
									</div>
								</div>
								<div
									class="                  Igw0E     IwRSH        YBx95      vwCYk                                                                                                               ">
									<div
										class="                  Igw0E     IwRSH      eGOV_         _4EzTm                                                                                                              "
										id="f16f127374c9c8">
										<div
											class="_7UhW9   xLCgt      MMzan  KV-D4            fDxYl     ">
											<a title="94_kmuk" href="/94_kmuk/"><div
													class="                  Igw0E     IwRSH      eGOV_     ybXk5    _4EzTm                                                                                                              ">
													<div
														class="_7UhW9   xLCgt       qyrsm KV-D4            fDxYl      rWtOq">
														<div
															class="                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                                              ">94_kmuk</div>
													</div>
												</div></a>
										</div>
									</div>
									<div
										class="                  Igw0E     IwRSH      eGOV_         _4EzTm                                                          DhRcB                                                    ">
										<div
											class="_7UhW9  PIoXz       MMzan   _0PwGv           fDxYl     ">sseung_s2님
											외 17명이 팔로우합니다</div>
									</div>
								</div>
								<div
									class="                  Igw0E   rBNOH          YBx95   ybXk5    _4EzTm                      soMvl                                                                                        ">
									<button class="PoNcp _0mzm- sqdOP yWX7d        " type="button">팔로우</button>
								</div>
							</div>
							<div
								class="                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                   XfCBB          HVWg4                  _0mzm- ZUqME"
								aria-labelledby="f3d38da0268d02c ffb65a9fda7da">
								<div
									class="                  Igw0E     IwRSH      eGOV_         _4EzTm                                         yC0tu                                                                     ">
									<div class="RR-M- " role="button" tabindex="0">
										<canvas class="CfWVH" height="36" width="36"
											style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas>
										<a class="_2dbep qNELH kIKUG" href="/wuuuuuoooo/"
											style="width: 32px; height: 32px;"><img class="_6q-tv"
											src="https://scontent-icn1-1.cdninstagram.com/vp/8d649433bbd423f833026c0d4121ba66/5DA064CF/t51.2885-19/s150x150/61771292_319448168985303_7655175787984715776_n.jpg?_nc_ht=scontent-icn1-1.cdninstagram.com"
											alt="wuuuuuoooo님의 프로필 사진"></a>
									</div>
								</div>
								<div
									class="                  Igw0E     IwRSH        YBx95      vwCYk                                                                                                               ">
									<div
										class="                  Igw0E     IwRSH      eGOV_         _4EzTm                                                                                                              "
										id="f3d38da0268d02c">
										<div
											class="_7UhW9   xLCgt      MMzan  KV-D4            fDxYl     ">
											<a title="wuuuuuoooo" href="/wuuuuuoooo/"><div
													class="                  Igw0E     IwRSH      eGOV_     ybXk5    _4EzTm                                                                                                              ">
													<div
														class="_7UhW9   xLCgt       qyrsm KV-D4            fDxYl      rWtOq">
														<div
															class="                  Igw0E   rBNOH        eGOV_     ybXk5    _4EzTm                                                                                                              ">wuuuuuoooo</div>
													</div>
												</div></a>
										</div>
									</div>
									<div
										class="                  Igw0E     IwRSH      eGOV_         _4EzTm                                                          DhRcB                                                    ">
										<div
											class="_7UhW9  PIoXz       MMzan   _0PwGv           fDxYl     ">zzang_minimini님이
											팔로우합니다</div>
									</div>
								</div>
								<div
									class="                  Igw0E   rBNOH          YBx95   ybXk5    _4EzTm                      soMvl                                                                                        ">
									<button class="PoNcp _0mzm- sqdOP yWX7d        " type="button">팔로우</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<div class="vgS-T"></div>
</main>

<script>
$(".heart_button").click(function(){
	var condition = $(this).children().is(".glyphsSpriteHeart__outline__24__grey_9 u-__7");

	if (condition == true) {
	$('#heart1').removeClass('glyphsSpriteHeart__outline__24__grey_9 u-__7').addClass('glyphsSpriteHeart__filled__24__red_5 u-__7');
	$.ajax({
		 url : 'fillHeart',
           type : 'POST',
           data : {
           	b_code:1
           	},
           dataType : "json",
           success : function(data) {
        	   alert("좋아요추가")
           	}
	 }); 
	}else if(condition == false){
		$('#heart1').removeClass('glyphsSpriteHeart__filled__24__red_5 u-__7').addClass('glyphsSpriteHeart__outline__24__grey_9 u-__7');	
		$.ajax({
			 url : 'outLineHeart',
	            type : 'POST',
	            data : {
	               	b_code:1,
	            	},
	            dataType : "json",
	            success : function(data) {
	            	alert("좋아요삭제")
	            }
		 }); 
	}

	
});

</script>
			
				<div id="edit_board_Modal" class="modal" >
					<div class="modal-dialog">
				
						<div class="modal-content">
							<div class="modal-header" style="text-align: center; background: gray; color:white; padding: 10px;height: 60px;">
						<h3 style="position:absolute; left:50%; top:50%;margin-left:-45px;margin-top:-10px;">게시물 수정</h3>
							</div>
				<!-- 모달 바디 -->
							<div class="modal-body">
							
							<form method="post" enctype="multipart/form-data" id="insert_form_gallery">
							<label><b>내용</b></label>
							<textarea name="b_content" id="b_content" class="form-control"></textarea>
							<br/>
							<a id="galleryPlus" style="float: right; margin: 15px; ">+사진 추가</a>
							<br>
							<input type="file" id="writeGallery" class="writeGallery" name="writeGallery" style="border: none;"/>
							<br>
							<br>
							
								<div class="file_set box_type03 mgt5" style="width:100%; border:solid 1px gray; padding:5px;" tabindex="0">
								<ul>
								<c:forEach items="${main.mainImg}" var="imgs" varStatus="status">
									<li><label><input type="checkbox" name="${imgs.img_img}" title="파일명" />${imgs.img_img}</label></li>
								</c:forEach>
								</ul>
								</div>
							
							<br>
							<input type="submit" name ="insert" id="insert" value="수정" class="btn btn-success" style="left:50%; top:50%; background-color:gray;border-color:gray;"/>
							<input type="submit" name ="insert" id="insert" value="삭제" class="btn btn-success" style="left:50%; top:50%; background-color:gray;border-color:gray;"/>
							</form>
							
							</div>
				<!-- 모달 풋터 -->
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
						
						</div>
					</div>
				</div>
			
<!-- 				<div id="edit_board_Modal" class="modal" > -->
<!-- 					<div class="modal-dialog"> -->
				
<!-- 						<div class="modal-content"> -->
<!-- 							<div class="modal-header" style="text-align: center; background: gray; color:white; padding: 10px;height: 60px;"> -->
<!-- 						<h3 style="position:absolute; left:50%; top:50%;margin-left:-45px;margin-top:-10px;">게시물 수정</h3> -->
<!-- 							</div> -->
<!-- 				모달 바디 -->
<!-- 							<div class="modal-body"> -->
<!-- 							<form method="post" enctype="multipart/form-data" id="insert_form_gallery"> -->
<!-- 							<label><b>내용</b></label> -->
<%-- 							<textarea name="b_content" id="b_content" class="form-control">${main.b_content}</textarea> --%>
<!-- 							<br/> -->
<!-- 							<a id="galleryPlus" style="float: right; margin: 15px; ">+사진 추가</a> -->
<!-- 							<br> -->
<!-- 							<input type="file" id="writeGallery" class="writeGallery" name="writeGallery" value="aaa" style="border: none;"/> -->
<!-- 							<br> -->
<!-- 							<br> -->
							
<!-- 								<div class="file_set box_type03 mgt5" style="width:100%; border:solid 1px gray; padding:5px;" tabindex="0"> -->
<!-- 								<ul> -->
<%-- 								<c:forEach items="${main.mainImg}" var="imgs" varStatus="status"> --%>
<%-- 									<li><label><input type="checkbox" name="${imgs.img_img}" title="파일명" />${imgs.img_img}</label></li> --%>
<%-- 								</c:forEach> --%>
<!-- 								</ul> -->
<!-- 								</div> -->
							
<!-- 							<br> -->
<!-- 							<input type="submit" name ="insert" id="insert" value="수정" class="btn btn-success" style="left:50%; top:50%; background-color:gray;border-color:gray;"/> -->
<!-- 							<input type="submit" name ="insert" id="insert" value="삭제" class="btn btn-success" style="left:50%; top:50%; background-color:gray;border-color:gray;"/> -->
<!-- 							</form> -->
<!-- 							</div> -->
<!-- 				모달 풋터 -->
<!-- 						<div class="modal-footer"> -->
<!-- 							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button> -->
<!-- 						</div> -->
						
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
				
				<div id="editDel_board_Modal" class="modal ">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header" style="text-align: center; background: gray; color:white; padding: 10px;height: 40px;">
								<h3 style="position:absolute; left:50%; top:50%;margin-left:-17px;margin-top:-10px;">설정</h3>
							</div>
							<button style="background-color:white;" type="button" class="btn btn-default edit" data-dismiss="modal">수정</button>
							<button style="background-color:white;" type="button" class="btn btn-default delete" data-dismiss="modal" value="${main.b_code}">삭제</button>
							<button style="background-color:white;" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>				
								
				<div id="write_board_Modal" class="modal ">
					<div class="modal-dialog">
				
						<div class="modal-content">
							<div class="modal-header" style="text-align: center; background: gray; color:white; padding: 10px;height: 60px;">
						<h3 style="position:absolute; left:50%; top:50%;margin-left:-45px;margin-top:-10px;">게시물 작성</h3>
							</div>
				<!-- 모달 바디 -->
							<div class="modal-body">
							<form method="post" enctype="multipart/form-data" id="insert_form_gallery">
							<label><b>내용</b></label>
							<textarea name="b_content" id="b_content" class="form-control"></textarea>
							<br />
							<a id="galleryPlus" style="float: right; margin: 15px; ">+사진 추가</a>
							<br>
							<input type="file" id="writeGallery" class="writeGallery" name="writeGallery" style="border: none;"/>
							<br>
							<br>
							<input type="submit" name ="insert" id="insert" value="작성" class="btn btn-success" style="left:50%; top:50%; background-color:gray;border-color:gray;"/>
							</form>
							</div>
				<!-- 모달 풋터 -->
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
						
						</div>
					</div>
				</div>


</main>
