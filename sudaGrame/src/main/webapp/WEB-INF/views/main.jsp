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

			$('.edit').unbind("click").bind("click",function(){
				$('#editDel_board_Modal').modal("hide");
				editBoard(b_code);
			});
		 
			$('.delete').unbind("click").bind("click",function(){
				$('#editDel_board_Modal').modal("hide");
				getDelBoard(b_code);
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
		$('#writeGallery').after('<input type="file" class="writeGallery" name="writeGallery" style="border: none;"/><br />');
		i++;
		}else{
			alert("최대 10장까지 가능합니다")
		}
	});
	
	
	   //게시물 수정 get
		function editBoard(b_code){
		   var b_code = b_code;
			   $.ajax({
		           url:"selectEditBoard",
		           type:"GET",
		           data:{b_code:b_code},
		           cache: false,
		           success: function (data) {
						$('#edit_board_Modal').modal("show");
						
						//사진추가
						var i =2;
						$('#galleryEditPlus').click(function(){
							if(i<=10){
							$('#editGallery').after('<input type="file" class="editGallery" name="editGallery" style="border: none;"/><br />');
							i++;
							}else{
								alert("최대 10장까지 가능합니다")
							}
						});
						
						$(data).each(function(index, i){
							$('textarea[id=edit_content]').val(i.b_content);
								thtml='';
								console.log("content: " + i.b_content);
							$(i.mainImg).each(function(index, x){
		// 						thtml+='<ul><li><label><input type="checkbox" name="'+x.img_img+'" title="파일명" />'+x.img_img+'</label></li></ul>';
								thtml+='<ul><li><label><input type="checkbox" name="check" title="파일명" value="'+x.img_img+'" class="'+x.img_img+'"/>'+x.img_img+'</label></li></ul>';
								$('div[name=editImg]').html(thtml);
								console.log("img: " + x.img_img);
							});
						});
		          
			          		 //게시물 수정에서 삭제 버튼
							$('input[name=del]').on('click',function(){
								var list=[];
								$('input[name="check"]:checked').each(function(index, x){
									list.push($(this).val());
									var formData = new FormData();
							        formData.append("editdelBoard",$(this).val());
							        $('#'+list[0]+'').remove();
								   $.ajax({
							           url:"editDeleteBoard",
							           type:"POST",
							           data: formData,
							           processData: false,
							           contentType: false,
							           cache: false,
							           success: function (data) {
							               alert("게시물 삭제가 완료되었습니다.");
							               window.location.href="";
							           },
							           error: function (e) {
							               alert("게시물 삭제가 실패하였습니다.");
							           }
							       });
								});
							});	
							
	
						   //게시물 수정에서 수정 버튼
// 						   $('input[name=ins]').on('click',function(){
							$('input[name=ins]').unbind("click").bind("click",function(){
								 event.preventDefault();
								 if($('#edit_content').val()=='')
								 {
								 $('#edit_content').focus();
								 alert("제목을 입력해주세요");
								 }else if($('#editGallery').val()==''){
								 alert("사진을 선택해주세요");
								 }else{					 
									   var formData = new FormData();
									   formData.append("b_content",$('#edit_content').val());
									   formData.append("b_code",b_code);
									   for (var i = 0; i < $('input[class=editGallery]').length ; i++) {
										   console.log("i: " + i);
									   	formData.append("editGallery",$('input[name=editGallery]')[i].files[0]);
									   }
									   
									   $.ajax({
								            url: "selectEditBoard",
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
								                window.location.href="";
								            },
								            error: function (e) {
								                alert("게시물 작성이 실패하였습니다.");
								            }
								        });
									 
								  }
						   
						});
						   	
		           
		           
		           
		           
		           },
		           error: function (e) {
		//                alert("게시물 수정이 실패하였습니다.");
		           }
		       });
		}
			
	   //게시물 작성 POST
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
				   formData.append("my_code",$('.writeBoard').val());
				   formData.append("b_content",$('#b_content').val());
				   for (var i = 0; i < $('input[class=writeGallery]').length ; i++) {
					   console.log("i: " + i);
				   	formData.append("writeGallery",$('input[name=writeGallery]')[i].files[0]);
				   }
				   
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
			                window.location.href="";
			            },
			            error: function (e) {
			                alert("게시물 작성이 실패하였습니다.");
			            }
			        });
				 
			  }
	   
	});
	   
});


// function postEditDelBoard(b_code){
// 	   $.ajax({
//            url:"selectEditBoard",
//            type:"GET",
//            data:{b_code:b_code},
//            cache: false,
//            success: function (data) {
//         	   postDelBoard(data);
//            },
//            error: function (e) {
//            }
//        });
// }

function getDelBoard(b_code){
	   $.ajax({
           url:"selectEditBoard",
           type:"GET",
           data:{b_code:b_code},
           cache: false,
           success: function (data) {
        	   postDelBoard(data);
           },
           error: function (e) {
           }
       });
}

function postDelBoard(data){
	   var formData = new FormData();
		$(data).each(function(index, i){
		    formData.append("b_code",i.b_code);
		    	console.log("b_code  : "+i.b_code);
			$(i.mainImg).each(function(index, x){
			   	formData.append("deleteGallery",x.img_img);
				console.log("img: " + x.img_img);
			});
		});
	
	   $.ajax({
           url:"deleteBoard",
           type:"POST",
           data: formData,
           processData: false,
           contentType: false,
           cache: false,
           success: function (data) {
               alert("게시물 삭제가 완료되었습니다.");
               window.location.href="";
           },
           error: function (e) {
               alert("게시물 삭제가 실패하였습니다.");
           }
       });
}

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
								src="/resources/image/${main.m_picture }"
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
					<div class="_97aPb${main.b_code}" name="${img.img_img}">
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
								</button></span><span class="_15y0l"><a href="boardOne?b_code=${ main.b_code }"><button class="dCJp8 afkep _0mzm-">
									<span class="glyphsSpriteComment__outline__24__grey_9 u-__7"
										aria-label="댓글 달기"></a></span>
								</button></span><span class="wmtNn"><a href="boardOne?b_code=${ main.b_code }"><button class="dCJp8 afkep _0mzm-">
									<span class="glyphsSpriteSave__outline__24__grey_9 u-__7"
										aria-label="저장"></a></span>
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
									<a href="boardOne?b_code=${ main.b_code }"><button class="Z4IfV _0mzm- sqdOP yWX7d        " type="button">
										댓글 <span>${main.cm_cnt}</span>개 모두 보기
									</button></a>
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
										class="Ypffh" autocomplete="off" autocorrect="off" disabled></textarea>
									<button class="_0mzm- sqdOP yWX7d"><a href="boardOne?b_code=${ main.b_code }">이동</a></button>
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
<%-- 	<c:forEach items="${ main_all }" var="nick" varStatus="status"> --%>
		<div class="m0NAq">
			<div class="nwXS6">
				<div class="RR-M-  _2NjG_" role="button" tabindex="0">
					<canvas class="CfWVH" height="51" width="51"
						style="position: absolute; top: -5px; left: -5px; width: 60px; height: 60px;"></canvas>
					<a class="_2dbep qNELH kIKUG" href="/${nickName}/"
						style="width: 50px; height: 50px;"><img class="_6q-tv"
						src="https://instagram.fbkk2-7.fna.fbcdn.net/vp/b85731ac007d1c0469f42c542c593daa/5DA39AF1/t51.2885-19/44884218_345707102882519_2446069589734326272_n.jpg?_nc_ht=instagram.fbkk2-7.fna.fbcdn.net"
						alt="${nickName}님의 프로필 사진"></a>
				</div>
				<div class="_0v2O4">
					<div class="SKguc">
						<a class="gmFkV" href="/${nickName}/" style="text-align: center;">${nickName}</a>
					</div>
				</div>
			</div>
		</div>
<%-- 	</c:forEach> --%>
		<button class="writeBoard" value="${my_code}">게시글 작성</button>
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
							<div class="modal-body">
							
							<form method="post" enctype="multipart/form-data" id="edit_form_gallery">
							<label><b>내용</b></label>
							<textarea name="edit_content" id="edit_content" class="form-control"></textarea>
							<br/>
							<a id="galleryEditPlus" style="float: right; margin: 15px; ">+사진 추가</a>
							<br>
							<input type="file" id="editGallery" class="editGallery" name="editGallery" style="border: none;"/>
							<br>
							<br>
							
								<div class="file_set box_type03 mgt5" name="editImg" style="width:100%; border:solid 1px gray; padding:5px;" tabindex="0">
<!-- 								<ul> -->
<%-- 								<c:forEach items="" var="imgs" varStatus="status"> --%>
<!-- 									<li><label><input type="checkbox" name="" title="파일명" /></label></li> -->
<%-- 								</c:forEach> --%>
<!-- 								</ul> -->
								</div>
							
							<br>
							<input type="submit" name ="ins" value="수정" class="btn btn-success" style="left:50%; top:50%; background-color:gray;border-color:gray;"/>
							<input type="submit" name ="del" value="삭제" class="btn btn-success" style="left:50%; top:50%; background-color:gray;border-color:gray;weight:34px;"/>
							</form>
							
							</div>
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
							<button style="background-color:white;" type="button" class="btn btn-default delete" data-dismiss="modal">삭제</button>
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
							<input type="submit" id="insert" value="작성" class="btn btn-success" style="left:50%; top:50%; background-color:gray;border-color:gray;"/>
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
