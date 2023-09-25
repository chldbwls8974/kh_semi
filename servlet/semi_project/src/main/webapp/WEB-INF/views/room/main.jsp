<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 
  <style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>
  
<title>객실 상세보기</title>
</head>
<body>

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
 <div class="container mt-5">
	<h1 style="margin-bottom: 20px"><span style="color: olive; font-weight: bold;">객실보기</span></h1>
	<div class="selectbox">
		<label>지점을 선택해주세요</label>
			<select name="branchSelect">
				<option value="0">지점 선택</option>
				<c:forEach items="${branchList }" var="br">
					<option value="${br.br_num }"><b>${br.br_name }</b></option>
				</c:forEach>
			</select>
	</div>
		<table class="table table-hover mt-4">
		<thead>
			<tr style="background: wheat; font-weight: bold;">
				<th>객실 번호</th>
				<th>객실 이름</th>
				<th>최대 수용 반려견 수</th>
				<th>현재 수용 반려견 수</th>
				<th>객실 타입</th>
				<th></th>
			</tr>
		</thead>
			<tbody>
				<c:forEach items="${list}" var="room">
						<tr>
							<td>${room.ro_num}</td>
							<td><a href="<c:url value='/room/detail?ro_num=${room.ro_num}'/>" ><b style="color: olive;">${room.ro_name }</b></a></td>
							<td>${room.ro_max_cap}</td>
							<td>${room.ro_now_cap}</td>
							<td>${room.ro_detail}</td>
							<td>
								<c:if test="${user != null && user.me_authority == 'ADMIN'}">
									<form action="<c:url value='/room/update?ro_num=${room.ro_num}'/>" method="get">
								        <input type="hidden" name="ro_num" value="${room.ro_num}">
									    <button type="submit" class="btn btn-outline-dark">수정</button>
								    </form>
									<form action="<c:url value='/room/delete'/>" method="post">
								        <input type="hidden" name="ro_num" value="${room.ro_num}">
									    <button type="submit" class="btn btn-outline-dark mt-1">삭제</button>
								    </form>
								</c:if>
			      		 	</td>
						</tr>
				</c:forEach>
			</tbody>
		</table>

<a href="<c:url value='/room/insert'/>" class="btn btn-outline-warning mt-3 btn-add col-3">새 객실 등록</a>
<a role="button" class="btn btn-outline-dark  mt-3" href="/semi_project/admin">뒤로가기</a>
</div>	
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>	
<script type="text/javascript">
	$('[name=branchSelect]').change(function(){
		let data={
				br_num : $(this).val()
		}
		
		ajaxObjectToJson(false,'post','<c:url value="/room/select"/>',data,(a)=>{
			if(a==''){
				$('.table').hide()
				alert('해당 지점에는 등록된 객실이 없습니다.')
			}else{
				$('.table').hide()
				let str='';
				str=`
				<table class="table table-hover mt-4"> 
						<thead> 
							<tr> 
								<th>객실번호</th> 
							<th>객실 이름</th> 
								<th>최대 수용 반려견 수</th> 
								<th>현재 수용 반려견 수</th> 
								<th>객실 타입</th> 
								</tr> 
							</thead> 
							<tbody> 
				`;
				for(room of a){
					let obj = JSON.parse(room)
					console.log(obj)
					
					str+=`
							<tr> 
								<td>\${obj.ro_num}</td>
								<td><a href="<c:url value='/room/detail?ro_num=\${obj.ro_num}'/>" >\${obj.ro_name}</a></td>
								<td>\${obj.ro_max_cap}</td>
								<td>\${obj.ro_now_cap}</td>
								<td>\${obj.ro_detail}</td>
							</tr> 
							
					`;
					
				}
				str+=`
					</tbody> 
					</table> 
				`;
				$('.selectbox').after(str);
				
			}
		})
	})
	
		if ('${user}' == null || '${user.me_authority}' != 'ADMIN') {
			$('.btn-add').hide();
		}
</script>

</body>
</html>