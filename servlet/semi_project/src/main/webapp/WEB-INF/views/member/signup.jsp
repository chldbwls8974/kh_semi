<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>

<title>회원가입</title>
<style>
		[class^=error]{
			color: red; margin-bottom: 10px;
		}
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<div class="container mt-5">
	<h2>회원가입</h2>
 	<form action="<c:url value='/member/signup'/>" method="post" class="signup mt-4">
 		<div class = "form-group">
 			<label>아이디</label>
 			<input type="text" class="form-control" name="me_id" placeholder="아이디는 영문으로 시작하고, 6~10자로 조합하세요." required>
 		</div>
 		<div class="error-id"></div>
 		<div class = "form-group">
 			<label>비번</label>
 			<input type="password" class="form-control" name="me_pw" id="pw" placeholder="비번은 영문,숫자,!@#$%로 이루어지고 6~15자 로 조합하세요" required>
 		</div>
 		<div class="error-pw"></div>
 		<div class = "form-group">
 			<label>비번확인</label>
 			<input type="password" class="form-control" name="me_pw2" required>
 		</div>
	 		<div class="error-pw2"></div>
 		<div class = "form-group">
 			<label>성함</label>
 			<input type="text" class="form-control" name="me_name" required>
 		</div>
 		<div class = "form-group">
 			<label>주소</label>
 			<input type="text" class="form-control" name="me_address" required>
 		</div>
 		<div class = "form-group">
 			<label>핸드폰 번호</label>
 			<input type="number" maxlength="11" oninput="phoneLength(this);" class="form-control" name="me_phone" required>
 		</div>
 		<button class="btn btn-outline-warning col-12">회원가입</button>
 	</form>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>	
	<script>
	   <% 
       Boolean result = (Boolean)request.getAttribute("Ok");
	   if(result != null && result){
	    %>
	       alert('회원가입 성공');
	       location.href="/semi_project";
	    <% 
	       }else if(result != null && !result){ %>
	       alert('회원가입 실패')
	    <%
	       }
	    %>
	</script>
	
	<script type="text/javascript">
		$('[name=me_id]').change(checkId);
		$('[name=me_pw]').change(checkPw);
		$('[name=me_pw2]').change(checkPw2);

		$('form').submit(function(){
			let ok = true;

			if(!checkId){
				ok = false;
			}
			if(!checkPw){
				ok = false;
			}
			if(!checkPw2){
				ok = false;
			}
			return ok;
		});

		function checkId() {
		    let id = $('[name=me_id]').val();
		    let regex = /^\w{6,10}$/;

		    if (!regex.test(id)) {
		        $('.error-id').text('아이디는 영문,숫자 6자에서 10자 이어야 합니다.');
		        return false;
		    }
			
		    $.ajax({
		        type: 'post',
		        url: '<c:url value="/member/checkId"/>',
		        data: { me_id: id },
		        async: false,
		        success: function (data) {
		            if (data.isIdDuplicate) {
		                $('.error-id').text('이미 사용 중인 아이디입니다.');
		            } else {
		                $('.error-id').text('사용 가능한 아이디입니다.');
		            }
		        }
		    });

		    return true;
		}
			
		function checkPw(){
			let pw = $('[name=me_pw]').val();
			let regex = /^[a-zA-Z0-9!@#$%]{8,20}$/;

			if(regex.test(pw)){
				$('.error-pw').text('');
				return true;
			}else{
				$('.error-pw').text('비번은 영문,숫자,!@#$%로 이루어지고 8~20자 이어야 합니다.');
				return false;
			}
		}
		function checkPw2(){
			let pw = $('[name=me_pw]').val();
			let pw2 = $('[name=me_pw2]').val();
			if(pw == pw2){
				$('.error-pw2').text('');
				return true;
			}else{
				$('.error-pw2').text('비밀번호와 일치하지 않습니다.');
				return false;
			}
		}
		
	    //전화번호 길이제한
	    function phoneLength(e){
	    	if(e.value.length > e.maxLength){
	    		e.value = e.value.slice(0,e.maxLength);
	    	}
	    }
		
	</script>
</body>
</html>