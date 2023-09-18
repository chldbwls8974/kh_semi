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

<title>Reservation</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="container mt-5">
		<h1>예약하기</h1>
		
		<form action="<c:url value='/reservation/insert'/>" method="post" class="reserv-box">
			<input type="hidden" class="form-control" name="re_me_id" value="${user.me_id }">
			<div class="form-container">
				<div class="form-group">
					<label>입실 날짜</label>
					<input  type="text" id="from" name="from" class="datePicker" size="100%">
				</div>
				<div class="form-group">	
					<label>퇴실 날짜</label>
					<input type="text" id="to" name="to" class="datePicker" size="100%">
				</div>
			</div>	
			
			<div class="form-group">
				<label>지점을 선택해주세요</label>
				<select class="form-control" name="branchSelect">
					<option value="0">지점 선택</option>
					<c:forEach items="${branchList }" var="br">
						<option value="${br.br_num }">${br.br_name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group" name="dog-box">
				<label>맡기고자 하는 개를 선택해주세요</label>
				<select class="form-control" name="dogSelect">
					<option value="0">반려동물 선택</option>
					<c:forEach items="${dogList }" var="dog">
					<!-- d_si_name -> d_num  -->
						<option value="${dog.d_num }">${dog.d_name }</option>
					</c:forEach>
				</select>
			</div>
			<div  class="form-group" name="btn-searchbox">
				<button type="button" name="btn-search" class="btn btn-outline-dark btn-float-right col-1">검색</button>
			</div>
			<div class="form-group" name="room-box">
				<label>예약하고자 하는 방을 선택해주세요</label>
				<select class="form-control" name="roomSelect">
					<option value="0">방 선택</option>
				</select>
			</div>
			<div class="form-group">
				<input type="button" class="btn btn-add btn-outline-warning col-12" value="+">
			</div>
			<button class="btn btn-float-right btn-outline-success col-3  mt-2">확인</button>
		</form>
	</div>
	
	
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script type="text/javascript">
	
		// 보유 멍멍 마릿수
		var d_count =  $('[name=dogSelect] option').length -1
		var br_num
		var d_num
		$('[name=branchSelect]').change(function(){
			br_num = $(this).val()
		})
		$(document).on('change', '[name=dogSelect]', function(){
			d_num = $(this).val()
			console.log(d_num)
		})
		var count = 0;
		var str = '';
	
	
	 	// 두번째 방 추가
		$(document).on('click','.btn-add',function(){
			count++;
			if(count > d_count -1){
				alert('더 이상 예약할 수 있는 반려견이 없습니다')
				return;
			}else{
				let data = {
						br_num : br_num,
						d_num :  $(this).parents('div').find('[name=dogSelect]').val()
				}
				let add ='';
				add += `
					<hr>
					<div class="form-group" name="dog-box">
						<label>맡기고자 하는 개를 선택해주세요</label>
						<select class="form-control" name="dogSelect">
							<option value="0">반려동물 선택</option>
							<c:forEach items="${dogList }" var="dog">
								<option value="${dog.d_num }">${dog.d_name }</option>
							</c:forEach>
						</select>
					</div>
					<div  class="form-group" name="btn-searchbox">
						<button type="button" name="btn-search" class="btn btn-outline-dark btn-float-right col-1">검색</button>
					</div>
					<div class="form-group" name="room-box">
						<label>예약하고자 하는 방을 선택해주세요</label>
						<select class="form-control" name="roomSelect">
							<option value="0">방 선택</option>
						</select>
					</div>
					<div class="form-group">
						<input type="button" class="btn btn-add btn-outline-warning col-12" value="+">
					</div>
				`;
				$(this).hide()
				$(this).after(add)
			} 
			
		})
		
		
		
		// 조건에 맞는 방 찾기
		$(document).on('click','[name=btn-search]',function(){
			let data = {
					br_num : br_num,
					/* d_size -> d_num */
					d_num :  d_num
			}
			console.log(data)
			let th = $(this);
			
			ajaxObjectToJson(false,'post','<c:url value="/reservation/select"/>',data,(a)=>{
				if(a==''){
					
					alert('예약할수 있는 방이 없습니다.')
				}else{
					th.parent().next().find('[name=roomSelect]').empty();
					for(room of a){
						let obj = JSON.parse(room)
						var option = `<option value="\${obj.ro_detail }">\${obj.ro_name }</option>`;
						th.parent().next().find('[name=roomSelect]').append(option)
						}
					}
				})
			
			})
			

			
	
		
		
		
		
		
		
		//데이트피커
		$(document).ready(function(){
			$(".datePicker").datepicker({
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
                   //시작일(from) datepicker가 닫힐때
                   //종료일(to)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                   $("#to").datepicker( "option", "minDate", selectedDate );
                   // 종료일(to) datepicker가 닫힐때
                   // 시작일(from)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                   $("#from").datepicker( "option", "maxDate", selectedDate ); 
               }    
			})
			
			$('.datePicker').datepicker('setDate', 'today'); //input창에 초기값을 오늘로
		});
		
	
		
		  <% 
	       Boolean result = (Boolean)request.getAttribute("ok");
		   if(result != null && result){
	    %>
	       alert('예약 성공');
	       location.href="/semi_project";
	    <% 
	       }else if(result != null && !result){ %>
	       alert('예약 실패')
	    <%
	       }
	    %>
	    
	</script>

</body>
</html>