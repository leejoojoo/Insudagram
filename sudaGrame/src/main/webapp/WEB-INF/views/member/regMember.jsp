<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(".tm-text-white").removeClass("active");
	$(".loginBtn").addClass("active")
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<main class="SCxLW  o64aR" role="main">
<div class="tbpKJ">
	<article class="agXmL">
	<div class="rgFsT ">
		<div class="gr27e ">
			<h1 class="NXVPg Szr5J  coreSpriteLoggedOutWordmark">Sudastagram</h1>
			<div class="P8adC">
				<form class="XFYOY" method="post">
					<h2 class="vvzhL ">친구들의 사진과 동영상을 보려면 가입하세요.</h2>
					<div
						class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                          CovQj                  jKUp7          DhRcB                                                    ">
					</div>
					<div class="K-1uj hKTMS">
					</div>
					<div class="WZdjL">
						<div class="_9GP1n   ">
							<label class="f0n8F "><span class="_9nyy2"></span><input name = "userEmail" id="userEmail" class="_2hvTZ pexuQ zyHYP1"
								aria-label="휴대폰 번호 또는 이메일 주소" aria-required="true"
								autocapitalize="off" autocorrect="off" autocomplete="tel"
								name="emailOrPhone" type="text" placeholder="이메일 주소"></label>
							<div class="i24fI"></div>
						</div>
					</div>

					<div class="WZdjL">
						<div class="_9GP1n   ">
							<label class="f0n8F "><span class="_9nyy2"></span><input name="nickName" id="nickName"
								class="_2hvTZ pexuQ zyHYP2" aria-label="사용자 닉네임"
								aria-required="true" autocapitalize="off" autocorrect="off"
								maxlength="30" name="username" type="text" placeholder="사용자 닉네임"></label>
							<div class="i24fI"></div>
						</div>
					</div>
					<div class="WZdjL">
						<div class="_9GP1n   ">
							<label class="f0n8F "><span class="_9nyy2"></span><input id="userName"
								class="_2hvTZ pexuQ zyHYP2"
								maxlength="30" name="username" type="text" placeholder="사용자 이름"></label>
							<div class="i24fI"></div>
						</div>
					</div>
					<div class="WZdjL">
						<div class="_9GP1n   ">
							<label class="f0n8F "><span class="_9nyy2"></span><input id="passWord" name="passWord" type="password"
								class="_2hvTZ pexuQ zyHYP3"
								placeholder="비밀번호"></label>
							<div class="i24fI"></div>
						</div>
					</div>
					<div class="WZdjL">
						<div class="_9GP1n   ">
							<span class="_9nyy2">비밀번호는 8자리이상 영문과 특수문자로 작성</span>
							<div class="i24fI"></div>
						</div>
					</div>
					<div>
						<div
							class="                  Igw0E     IwRSH      eGOV_         _4EzTm    bkEs3                          CovQj                  jKUp7          DhRcB                                                    ">
							<button id="signButton" class="_0mzm-sqdOP L3NKy" type="submit">가입</button>
						</div>
					</div>
					<p class="g4Vm4">
						가입하면 Sudastagram의 <a target="_blank"
							href="https://help.instagram.com/581066165581870">약관</a>, <a
							target="_blank" href="https://help.instagram.com/519522125107875">데이터
							정책</a> 및 <a target="_blank" href="/legal/cookies/">쿠키 정책</a>에 동의하게
						됩니다.
					</p>
				</form>
			</div>
		</div>
		<div class="gr27e">
			<p class="izU2O">
				계정이 있으신가요? <a href="login">로그인</a>
			</p>
		</div>
		
	</div>
	</article>
</div>
</main>

<script type="text/javascript">
var idck = 0;
    $("#signButton").click(function() {
    	event.preventDefault();
        //userid 를 param.
        var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        var userEmail =  $("#userEmail").val();
        if (userEmail.match(regExp) == null) {
			alert('이메일 형식을 정확하게 입력해주세요.');
		}
        var nickName =  $("#nickName").val(); 
        var userName =  $("#userName").val();
        var passwordRules = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
        var passWord = $("#passWord").val(); 
        if (passWord.match(passwordRules) == null) {
    		$("#passWord").val("사용중인 닉네임입니다 :p");
			$("#passWord").css("color", "red");
		}
        if (userName == "" || nickName == "") {
			alert('공백이 있습니다.')
		}

        
        $.ajax({
            url : 'regMemberCheck',
            type : 'POST',
            data : {
            	userEmail:userEmail,
            	nickName:nickName
            	},
            dataType : "json",
            success : function(data) {
            	
            	if (data[0] != "") {
            		for (var i = 0; i < data.length; i++) {
                    	if (data[i]==1) {
                    		$("#nickName").val("사용중인 닉네임입니다 :p");
        					$("#nickName").css("color", "red");
        				}
                    	if(data[i]==2){
        					$("#userEmail").val("사용중인 아이디입니다 :p");
        					$("#userEmail").css("color", "red");
                    	}
        				}
				}if(data[0] == null || userEmail.match(regExp) == null || passWord.match(passwordRules) == null || userName == "" || nickName == ""){
					  $.ajax({
						 url : 'insertMember',
				            type : 'POST',
				            data : {
				            	userEmail:userEmail,
				            	nickName:nickName,
				            	passWord:passWord,
				            	userName:userName
				            	},
				            dataType : "json",
				            success : function(data1) {
				            	if(data1 == 1){
				            		alert("회원가입이 정상적으로 완료되었습니다.");
				            		setTimeout(location.reload.bind(location), 1000);
				            		post_to_url("login");
				            	}
				            	
				            }
					 }); 
				}
				
        }
    });
    });
 
 
</script>
