<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<h1 style="margin-bottom: 20px">
			<span style="color: olive; font-weight: bold;">객실보기</span>
		</h1>
		<div class="branchselectbox">
			<label>지점을 선택해주세요</label> <select name="branchSelect">
				<option value="0">지점 선택</option>
				<c:forEach items="${branchList }" var="br">
					<option value="${br.br_num }"><b>${br.br_name }</b></option>
				</c:forEach>
			</select>
		</div>
		<div class="dateselectbox">
			<label>날짜선택</label>
			<input  type="text" id="date" name="date" class="datePicker" size="100%" style="margin-left: 30px">
		</div>
		
		<table class="table table-hover mt-4">
			<thead>
				<tr style="background: wheat; font-weight: bold;">
					<th>객실 번호</th>
					<th>객실 이름</th>
					<th>최대 수용 반려견 수</th>
					<th>예약가능 TO</th>
					<th>객실 타입</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${todaylist}" var="room">
					<tr>
						<td>${room.ro_num}</td>
						<td><a
							href="<c:url value='/room/detail?ro_num=${room.ro_num}'/>"><b
								style="color: olive;">${room.ro_name }</b></a></td>
						<td>${room.ro_max_cap}</td>
						<td>${room.TO}</td>
						<td>${room.ro_detail}</td>
						<td><c:if
								test="${user != null && user.me_authority == 'ADMIN'}">
								<form
									action="<c:url value='/room/update?ro_num=${room.ro_num}'/>"
									method="get">
									<input type="hidden" name="ro_num" value="${room.ro_num}">
									<button type="submit" class="btn btn-outline-dark">수정</button>
								</form>
								<form action="<c:url value='/room/delete'/>" method="post">
									<input type="hidden" name="ro_num" value="${room.ro_num}">
									<button type="submit" class="btn btn-outline-dark mt-1">삭제</button>
								</form>
							</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<a href="<c:url value='/room/insert'/>"
			class="btn btn-outline-warning mt-3 btn-add col-3">새 객실 등록</a>
		<div align="right" class="mt-3">
			<a class="btn btn-back btn-float-right btn-outline-dark mt-1 col-3 "
				href="/semi_project/admin" role="button">뒤로가기</a>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	
	
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script type="text/javascript">
	$('[name=date]').ready(function(){
		let date = $(this).val()
	})
	
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
							<tr  style="background: wheat; font-weight: bold;"> 
								<th>객실 번호</th> 
								<th>객실 이름</th> 
								<th>최대 수용 반려견 수</th> 
								<th>예약가능 TO</th> 
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
								<td><a href="<c:url value='/room/detail?ro_num=\${obj.ro_num}'/>" ><b
								style="color: olive;">\${obj.ro_name }</b></a></td>
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
	
	
	$(document).ready(function(){
		$(".datePicker").datepicker({
			minDate: 1,
			dateFormat: 'yy-mm-dd' //달력 날짜 형태
			,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
			,changeYear: true //option값 년 선택 가능
			,changeMonth: true //option값  월 선택 가능                
			,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
			,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
			,prevText: '이전 달'
		    ,nextText: '다음 달'
			,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
			,dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'] //달력의 요일 텍스트
			,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
			,onClose: function( selectedDate ) {
				var max_date = $('#from').datepicker('getDate');
                  //시작일(from) datepicker가 닫힐때
                  //종료일(to)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                  $("#to").datepicker( "option", "minDate", max_date);
              }    
		})
		
		$('.datePicker').datepicker('setDate', 'today'+1); //input창에 초기값을 내일로
	});
	
	
	
		if ('${user}' == null || '${user.me_authority}' != 'ADMIN') {
			$('.btn-add').hide();
			$('.btn-back').hide();
		}
</script>

</body>
</html>