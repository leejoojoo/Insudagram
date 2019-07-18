<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(".nav-item").removeClass("active");
	$(".nav-link").removeClass("active");
	$(".loginBtn").parents().addClass("active");
	$(".loginBtn").addClass("active");
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="tbpKJ">
	<article class="agXmL">
	<div class="rgFsT ">
		<div class="gr27e ">
			<h1 class="NXVPg Szr5J  coreSpriteLoggedOutWordmark">Instagram</h1>
			<div class="EPjEi">
			<c:if test="${ param.login_error ne null }">
	    <div style="color:red">
	     아이디 또는 패스워드가 일치하지 않습니다. 
	    </div>
	  </c:if>
			
				<form class="HmktE" method="post" action='<c:url value="/j_spring_security_check" />'>
					<div
						class="                  Igw0E     IwRSH      eGOV_         _4EzTm        FBi-h                                                                                                      "></div>
					<div class="-MzZI ">
						<div class="_9GP1n   ">
							<label class="f0n8F "><input class="_2hvTZ pexuQ zyHYP email"
								placeholder="전화번호, 사용자 이름 또는 이메일" aria-required="true"
								autocapitalize="off" autocorrect="off" maxlength="75"
								name="j_username" type="text" ></label>
							<div class="i24fI"></div>
						</div>
					</div>
					<div class="-MzZI">
						<div class="_9GP1n   ">
							<label class="f0n8F "><input
								class="_2hvTZ pexuQ zyHYP pwd" placeholder="비밀번호"
								aria-required="true" autocapitalize="off" autocorrect="off"
								name="j_password" type="password" ></label>
							<div class="i24fI"></div>
						</div>
					</div>
					<div
						class=" Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3    CovQj jKUp7     DhRcB  ">
						<button class="_0mzm- sqdOP  L3NKy  loginbtn" 
							type="submit">
							<div
								class="                  Igw0E     IwRSH      eGOV_         _4EzTm   ">로그인</div>
						</button>
					</div>
					<div class="K-1uj Z7p_S">
						
					</div>
					<div
						class="    Igw0E     IwRSH      eGOV_     _4EzTm      _9Gu4M  XTCZH     ">
						
					</div>
					<a class="_2Lks6" href="/accounts/password/reset/">비밀번호를 잊으셨나요?</a>
				</form>
				
<script>
$(".pwd").on("keydown",function(){
  // alert($('.email').val());
	if ( $(".email").val() == "") {
		alert("이메일을 입력하세요")
	}else {
		$(".sqdOP[disabled]:not(.A086a)").css("opacity","1");
	}
})		

</script>
			</div>
		</div>
		<div class="gr27e">
			<div class="_7UhW9   xLCgt      MMzan   _0PwGv       uL8Hv         ">
				<p class="izU2O">
					계정이 없으신가요? <a href="regMember"><span
						class="_7UhW9   xLCgt       qyrsm     se6yk        ">가입하기</span></a>
				</p>
			</div>
		</div>
		
	</div>
	</article>
</div>