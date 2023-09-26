  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>포인트 적립내용 추가</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container mt-5">
		<h2>포인트 적립내용 추가</h2>
		<form action="<c:url value='/point/insert'/>" method="post" class="mt-4"  onsubmit="return validateForm()">
		 	<div class = "form-group">
				<label>포인트</label>
				<input type="text" class="form-control" name="po_point" placeholder="포인트" required>
			</div>
			<div class = "form-group">
				<label>포인트 내용</label>
				<input type="text" class="form-control" name="po_content" placeholder="내용" required>
			</div>
			<div class = "form-group">
				<label>적립 대상자</label>
				<div class="input-group mb-3">
				  <input type="text" class="form-control col-12" name="po_search" placeholder="적립대상자">
				  <button class="btn btn-search btn-outline-dark col-2" type="button">검색</button>
				</div>
				<select class="form-control" name="memberSelect" id="mySelect">
					<option value="0">적립대상자 선택</option>
					<c:forEach items="${memberList}" var="member">
						<option value="${member.me_id }">${member.me_id }</option>
					</c:forEach>
				</select>
			</div>
	 		<button class="btn btn-outline-warning col-12 mt-2">등록</button>
	 	</form>	
 	</div>
 	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>	
 	<script>
		function validateForm() {
			    var selectedOption = document.getElementById('mySelect').value;
			
			    // 특정한 옵션을 선택한 경우 (예: "option1"을 선택한 경우) 제출을 막습니다.
			    if (selectedOption === '' || selectedOption === '0') {
			        alert('적립 대상자를 선택해주세요.');
			        return false; // 폼 제출을 막음
			    }
			
			    return true; // 다른 옵션을 선택한 경우 폼 제출을 허용
			}
	</script>
 	
 	
 	
 	<script type="text/javascript">
 	let po_search  
 	$(document).on('change','[name=po_search]',function(){
		po_search = $(this).val(); 		
 	})
 	$(document).on('click','.btn-search',function(){
 		
 		let data = {
 				po_search : po_search
 		}
 		let th = $(this)
 		
 		ajaxObjectToJson2(false,'post','<c:url value="/point/search"/>',data,(a)=>{
 			th.parents().find('[name=memberSelect]').empty()
 			console.log(a)
 			if(a==''){
 				alert('해당하는 회원이 없습니다.')
 				return;
 			}
 			for(member of a){
				let obj = JSON.parse(member)
				console.log(obj)
				var option = `<option value="\${obj.me_id}">\${obj.me_id }</option>`;
				th.parents().find('[name=memberSelect]').append(option)
			}
 		})
 		
 	})
 	
 	</script>
 	
	<script>
		<% 
			Boolean result = (Boolean)request.getAttribute("ok");
			if(result != null && result){
		%>
			alert('포인드 등록 성공!');
			location.href = '<c:url value="/point/main"/>';
		<%
			}else if(result != null && !result){
		%>
			alert('포인트등록 실패!')
		<%
			}
		%>
		
		if ('${user}' == null || '${user.me_authority}' != 'ADMIN') {
	    	alert('권한이 없습니다.');
		    location.href="/semi_project";
	    }
	</script>
</body>
</html>