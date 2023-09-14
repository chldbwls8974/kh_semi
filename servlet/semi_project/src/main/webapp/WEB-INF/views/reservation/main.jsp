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
						<option value="${dog.d_si_name }">${dog.d_name }</option>
					</c:forEach>
				</select>
			</div>
			<div  class="form-group" >
				<button type="button" name="btn-search">검색</button>
			</div>
			<div class="form-group" name="room-box">
				<label>예약하고자 하는 방을 선택해주세요</label>
				<select class="form-control" name="roomSelect">
					<option value="0">방 선택</option>
					<c:forEach items="${roomList }" var="room">
						<option value="${room.ro_detail }">${room.ro_name }</option>
					</c:forEach>
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
	
		$(document).on('click','[name=btn-search]',function(){
			
			let data = {
					br_num : $(this).parents().find('[name=branchSelect]').val(),
					d_size :  $(this).parents().find('[name=dogSelect]').val()
			}
			
			ajaxObjectToJson(false,'post','<c:url value="/reservation/select"/>',data,(a)=>{
				if(a==''){
					$('[name=room-box]').hide()
					alert('예약할수 있는 방이 없습니다.')
				}else{
					$('[name=room-box]').hide()
					let str = '';
					
					str += `
							<div class="form-group" name="room-box">
							<label>예약하고자 하는 방을 선택해주세요</label>
							<select class="form-control" name="roomSelect">
								<option value="0">방 선택</option>
						`;
				for(room of a){
					let obj = JSON.parse(room)
					console.log(obj)
					str += `
						<option value="\${obj.ro_detail }">\${obj.ro_name }</option>
					`;
				}
				str+=`
						</select>
						</div>
					`;
					$('[name=dog-box]').after(str)
					
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
/*
은영언니 구현
function getTodayType(){
			var date = new Date();
			return date.getFullYear() +"-"+("0"+(date.getMonth()+1)).slice(-2) + "-"+ ("0"+date.getDate()).slice(-2);
		}
		
		$(function() {
		    var dateFormat = "mm/dd/yy",
		    let today = getTodayType()
		      from = $( "#from" )
		        .datepicker({
		          defaultDate: "+1w",
		          changeMonth: true,
		          numberOfMonths: 3,
		          minDate: today  	          
	        })
	        .on( "change", function() {
	        	console.log($(this).val())
	          to.datepicker( "option", "minDate", getDate(this));
	        }),
	     to = $( "#to" ).datepicker({
	        defaultDate: "+1w",
	        changeMonth: true,
	        numberOfMonths: 3
	     })
	     .on("change", function() {
	        from.datepicker( "option", "maxDate", getDate(this));
	     });
 
	    function getDate( element ) {
	      var date;
	      try {
	        date = $.datepicker.parseDate( dateFormat, element.value );
	      } catch( error ) {
	        date = null;
	      }
	 
	      return date;
	    }
	  } );
		*/
	</script>

</body>
</html>