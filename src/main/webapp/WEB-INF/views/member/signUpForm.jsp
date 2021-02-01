<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/style.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${path }/resources/js/function.js"></script>
<script type="text/javascript">

//이름 유효성 검사
function nameCheck(){
  var nameReg = /^[가-힝]{2,}$/;  // 2자리 이상 한글만 가능
  var name = document.getElementById("member_name");
  var nameResult = document.getElementById("nameResult");
  if(!nameReg.test(name.value)){
    nameResult.innerHTML = "한글만 가능합니다";
    nameResult.style.color = "red";
  }else{
    nameResult.innerHTML = "";
  }
}

//아이디 중복확인
function idCheck(){
  var idReg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,12}$/;   /* 영문,숫자 4~12자리만 가능 */
  var member_id = $("#member_id").val();
  $.ajax({
    url: "${pageContext.request.contextPath}/member/idCheck.do",		
    		type:"post", 
			data: {"member_id" : member_id},
			success:function(data){
				if($.trim(data) == 1){
					$("#idResult").html("이미 사용 중인 아이디입니다");
					$("#idResult").css("color", "red");
				}else if($.trim(data) == 0){
					/* $("#idResult").html("사용 가능한 아이디입니다");
					$("#idResult").css("color", "green"); */
					
					if(!idReg.test(member_id)){
						$("#idResult").html("영문,숫자포함 4~12자리");
						$("#idResult").css("color", "red");
					}else{
						$("#idResult").html("사용 가능한 아이디입니다");
						$("#idResult").css("color", "green");
					}
				}
			},
			error: function(){
				console.log("아이디 중복확인 ajax 에러");
			}
  });
}

//비밀번호 유효성 검사
function pwRegCheck(){
	var pwc = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{4,12}$/;
  var pw = document.getElementById("pw");
  var pwReg = document.getElementById("pwReg");

  if(!pwc.test(pw.value)){
    pwReg.innerHTML = "영문자,숫자,특수문자 조합으로 4~12자리를 입력해주세요";
    pwReg.style.color = "red";
  }else if(pwc.test(pw.value)){
    pwReg.innerHTML = "";
  }
}
// 비밀번호 일치
function pwRCh(){
  var pw = document.getElementById("pw");
  var pwCheck = document.getElementById("pwCheck");
  var pwResult = document.getElementById("pwResult");
  if(pw.value != pwCheck.value){
    pwResult.innerHTML = "비밀번호가 일치하지 않습니다";
    pwResult.style.color = "red";
	}else if(pwCheck.value == pw.value){
    pwResult.innerHTML = "";
  }
}

//이메일 유효성 검사
function checkEmail(){
    //이메일 정규식
    var emailReg =  /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
    var email = document.getElementById("email");
    var emailResult = document.getElementById("emailResult");
    if(!emailReg.test(email.value)){
      emailResult.innerHTML = "올바른 이메일 형식이 아닙니다";
      emailResult.style.color = "red";
    }else{
      emailResult.innerHTML = "";
    }
}

//전화번호 유효성 검사
function phoneCheck(){
  //숫자만 입력하는 정규식
  var reg = /^[0-9]+/g;
  var phone = document.getElementById("phone");
  var phoneResult = document.getElementById("phoneResult");
  if(!reg.test(phone.value)){
    phoneResult.innerHTML = "숫자만 입력하세요";
    phoneResult.style.color = "red";
  }else{
    phoneResult.innerHTML = "";
  }
}
</script>
</head>
<body>
	<section>
	    <div class="signUp-wrap">
	      <div class="signUp-inner">
	        <form action="${path }/member/signUp.do" method="POST" onsubmit="return signUpCheck()">
	          <table>
	            <colgroup>
	              <col width="21%" />
	            </colgroup>
	            <thead>
	              <tr>
	                <th colspan="7"><h2>후즈백 간편회원가입</h2></th>
	              </tr>
	            </thead>
	            <tbody>
	              <tr>
	                <td><label for="member_name">이름</label></td>
	                <td colspan="6">
	                	<input type="text" name="member_name" id="member_name" oninput="nameCheck()" placeholder="이름을 입력하세요" />
	                	<span id="nameResult"></span>
	                </td>
	              </tr>
	              <tr>
	                <td><label for="member_id">아이디</label></td>
	                <td colspan="6">
	                	<input type="text" name="member_id" id="member_id" oninput="idCheck()" maxlength="12" placeholder="아이디를 입력하세요" />
	                	<span id="idResult"></span>
	                </td>
	              </tr>
	              <tr>
	                <td><label for="pw">비밀번호</label></td>
	                <td colspan="6">
	                	<input type="password" name="pw" id="pw" onkeyup="pwRegCheck()" maxlength="12" placeholder="영문,숫자,특수문자포함 4~12글자" />
	                	<span id="pwReg"></span>
	                </td>
	              </tr>
	              <tr>
	                <td><label for="pwCheck">비밀번호 확인</label></td>
	                <td colspan="6">
	                	<input type="password" name="pwCheck" id="pwCheck" onkeyup="pwRCh()" maxlength="12" placeholder="비밀번호 확인" />
	                	<span id="pwResult"></span>
	                </td>
	              </tr>
	              <tr>
	                <td><label for="email">이메일</label></td>
	                <td colspan="6">
	                	<input type="text" name="email" id="email" oninput="checkEmail()" placeholder="이메일을 입력하세요" />
	                	<span id="emailResult"></span>
	                </td>
	              </tr>
	              <tr>
	                <td><label for="phone">전화번호</label></td>
	                <td colspan="6">
	                	<input type="text" name="phone" id="phone" oninput="phoneCheck()" placeholder="-을 뺀 숫자만 입력하세요" maxlength="11" />
	                	<span id="phoneResult"></span>
	                </td>
	              </tr>
	            </tbody>
	          </table>
	          <div class="signUp-button-wrap">
	            <button type="submit" class="signUp-button">가입하기</button>
	          </div>
	        </form>
	      </div>
	    </div>
	</section>
</body>
</html>