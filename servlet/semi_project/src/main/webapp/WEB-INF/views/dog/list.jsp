<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Dog Hotel</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

	<div class="container mt-5">

		<c:if test="${user.me_authority == 'ADMIN' }">
			<h2>회원 반려견 목록</h2>
			<div class="input-group mb-3 mt-3">
				<input type="text" class="form-control col-12 " name="dog_search"
					placeholder="아이디로 검색">
				<button class="btn btn-dark col-2" type="button">검색</button>
			</div>
		</c:if>

		<c:if test="${user.me_authority == 'USER' }">
			<h2><span style="color: olive; font-weight: bold;">나의 반려견</span></h2>
		</c:if>
		
		<table class="table table-hover mt-4">
			<thead>
				<tr style="background: wheat; font-weight: bold;">
					<th>반려견 번호</th>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
					<th>무게(kg)</th>
					<th>특이사항</th>
					<th>견주ID</th>
					<th>크기</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<!-- 세션 이용자의 권한이 user이면 본인의 개만 출력-->
			<c:if test="${user.me_authority =='USER'}">
			<tbody>
				<c:forEach items="${list}" var="dog">
					<tr>
						<td>${dog.d_num }</td>
						<td>${dog.d_name}</td>
						<td>${dog.d_age}</td>
						<td>${dog.d_gen}</td>
						<td>${dog.d_kg}</td>
						<td>${dog.d_detail}</td>
						<td>${dog.d_me_id }</td>
						<td>${dog.d_si_name }</td>
						<td><a
							href="<c:url value='/dog/update?d_num=${dog.d_num }'/>"
							class="btn btn-outline-secondary" role="button">수정</a></td>
						<td>
							<form action="<c:url value='/dog/delete'/>" method="post">
								<button class="btn btn-outline-dark btn-dog-delete">삭제</button>
								<input type="hidden" name="d_num" value="${dog.d_num}">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			</c:if>
			
			
			<!-- 세션 이용자의 권한이 ADMIN이면 모든 개를 출력 -->
			<c:if test="${user.me_authority =='ADMIN'}">
				<tbody>
					<c:forEach items="${allList}" var="dog">
						<tr>
							<td>${dog.d_num }</td>
							<td>${dog.d_name}</td>
							<td>${dog.d_age}</td>
							<td>${dog.d_gen}</td>
							<td>${dog.d_kg}</td>
							<td>${dog.d_detail}</td>
							<td>${dog.d_me_id }</td>
							<td>${dog.d_si_name }</td>
							<td><a
								href="<c:url value='/dog/update?d_num=${dog.d_num }'/>"
								class="btn btn-outline-success" role="button">수정</a></td>
							<td>
								<form action="<c:url value='/dog/delete'/>" method="post">
									<button class="btn btn-outline-danger btn-dog-delete">삭제</button>
									<input type="hidden" name="d_num" value="${dog.d_num}">
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>	
			</c:if>
		</table>
		<c:if test="${user.me_authority=='USER'}">
			<c:choose>
				<c:when test="${fn:length(list) < 3 }">
					<!-- 3마리 이하인 경우 -->
					<a href="<c:url value='/dog/insert'/>"
						class="btn btn-outline-dark col-12">반려견 등록</a>
				</c:when>
				<c:otherwise>
					<!-- 3마리 이상인 경우 -->
					<a href="<c:url value='/dog/list'/>"
						class="btn btn-outline-dark col-12" id="btnAdd">반려견 등록</a>
					<script type="text/javascript">
					$("#btnAdd").click(function() {
						alert('반려견은 3마리 까지 등록할 수 있습니다.');
					})
				</script>
				</c:otherwise>
			</c:choose>
		</c:if>
		<script type="text/javascript">
			if ('${user}' == null) {
				alert('로그인이 필요한 서비스입니다.');
				location.href = "/semi_project/member/login";
			}
		</script>
		<c:if test="${user.me_authority=='ADMIN'}">
			<div align="left" class="mt-3">
				<a class="btn btn-float-right btn-outline-dark mt-1 col-3 "
					href="/semi_project/admin" role="button">뒤로가기</a>
			</div>
		</c:if>
	</div>
	
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	let d_search
	$(document).on('change','[name=dog_search]',function(){
		d_search = $(this).val()
	})

	$(document).on('click','.btn',function(){
		data = {
				d_search : d_search
		}

		ajaxObjectToJson(false,'post','<c:url value="/dog/search"/>',data,(a)=>{
			if(a!=''){
				$('.table').hide()
				let str='';
				str=`
				<table class="table table-hover mt-4"> 
						<thead> 
							<tr style="background: wheat; font-weight: bold;"> 
								<th>반려견 번호</th>
								<th>이름</th>
								<th>나이</th>
								<th>성별</th>
								<th>무게(kg)</th>
								<th>특이사항</th>
								<th>견주ID</th>
								<th>크기</th>
								<th>수정</th>
								<th>삭제</th>
							</tr> 
						</thead> 
						<c:if test="${user.me_authority =='ADMIN'}">
						<tbody>
				`;
				for(dog of a){
					let obj = JSON.parse(dog)
					console.log(obj)
					
					str+=`
								<tr>
									<td>\${obj.d_num }</td>
									<td>\${obj.d_name}</td>
									<td>\${obj.d_age}</td>
									<td>\${obj.d_gen}</td>
									<td>\${obj.d_kg}</td>
									<td>\${obj.d_detail}</td>
									<td>\${obj.d_me_id }</td>
									<td>\${obj.d_si_name }</td>
									<td><a
										href="<c:url value='/dog/update?d_num=${obj.d_num }'/>"
										class="btn btn-outline-success" role="button">수정</a></td>
									<td>
										<form action="<c:url value='/dog/delete'/>" method="post">
											<button class="btn btn-outline-danger btn-dog-delete">삭제</button>
											<input type="hidden" name="d_num" value="${obj.d_num}">
										</form>
									</td>
								</tr>
				
							
					`;
					
				}
				str+=`
					</tbody>	
					</c:if>
				</table>
				`;
				$('.input-group').after(str);
				
			}
		})
	})
</script>
</html>

















