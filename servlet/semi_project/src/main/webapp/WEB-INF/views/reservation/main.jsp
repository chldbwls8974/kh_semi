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
		<h1 style="margin-bottom: 20px"><span style="color: olive; font-weight: bold;">예약하기</span></h1>
		
		<form action="<c:url value='/reservation/insert'/>" method="post" class="reserv-box">
			<input type="hidden" class="form-control" name="re_me_id" value="${user.me_id }">
			<div class="form-container">
				<div class="form-group">
					<label>입실 날짜</label>
					<input  type="text" id="from" name="from" class="datePicker" size="100%" style="margin-left: 30px">
				</div>
				<div class="form-group">	
					<label>퇴실 날짜</label>
					<input type="text" id="to" name="to" class="datePicker" size="100%" style="margin-left: 30px">
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
				<label>맡기고자 하는 반려견을 선택해주세요</label>
				<select class="form-control" name="dogSelect">
					<option value="0">반려견 선택</option>
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
				<label>예약하고자 하는 객실을 선택해주세요</label>
				<select class="form-control" name="roomSelect">
					<option value="0">객실 선택</option>
				</select>
			</div>
			<div class="form-group">
				<input type="button" name="btn-add" class="btn btn-add btn-outline-secondary col-12" value="+">
			</div>
			<button name="btn-submit" class="btn btn-float-right btn-outline-dark col-3 mt-2">확인</button>
		</form>
	</div>
	
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>		
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">

	
	
/* function indexOfDogs(dogList, dogNum){
	if(dogList | dogList.length == 0){
		return -1;
	}
	for(index in dogList){
		if(dogList[index].d_num == dogNum){
			return index;
		}
	}
	return -1;
	} */
	//전역변수
	//let dogs = ${dogList}
	// 보유 멍멍 마릿수
	let count = 0;
	let str = '';
	let d_count =  $('[name=dogSelect] option').length -1
	let br_num
	let d_num
	let start_date
	let end_date
	$('[name=branchSelect]').change(function(){
		br_num = $(this).val()
	})
	$(document).on('change', '[name=dogSelect]', function(){
		d_num = $(this).val()
	})
	$(document).on('change', '[name=from]', function(){
		start_date = $(this).val()
	})
	$(document).on('change', '[name=to]', function(){
		end_date = $(this).val()
	})
	
	
	// 시작-종료 일 사이의 날짜 구하는 함수 
	function getDatesStartToLast(start_date, end_date) {
	var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
	if(!(regex.test(start_date) && regex.test(end_date))) return "Not Date Format";
	var result = [];
	var curDate = new Date(start_date);
	while(curDate <= new Date(end_date)) {
		result.push(curDate.toISOString().split("T")[0]);
		curDate.setDate(curDate.getDate() + 1);
		}
		return result;
	}

	
	
 	// 두번째 방 추가
	$(document).on('click','.btn-add',function(){
		/* //
		$('[name=dogSelect]').each(function(){
			let index = indexOfDogs(dogs, $(this).val());
			if(index == -1){
				return;
			}
			dogs.splice(index, 1);
		}); */
		
		count++;
		if(count > d_count -1){
			alert('더 이상 예약할 수 있는 반려견이 없습니다')
			return;
		}
			let data = {
					br_num : br_num,
					d_num :  $(this).parents('div').find('[name=dogSelect]').val()
			}
			let add ='';
			/* let dogselectStr ='';
			for(dog of dogs){
				dogselectStr +=`<option value="\${dog.d_num }">\${dog.d_name }</option>`
			}
			 */
			
			add += `
				<hr>
				<div class="form-group" name="dog-box">
					<label>맡기고자 하는 반려견을 선택해주세요</label>
					<select class="form-control" name="dogSelect">
						<option value="0">반려견 선택</option>
						<c:forEach items="${dogList }" var="dog">
							<option value="${dog.d_num }">${dog.d_name }</option>
						</c:forEach>
					</select>
				</div>
				<div  class="form-group" name="btn-searchbox">
					<button type="button" name="btn-search" class="btn btn-outline-dark btn-float-right col-1">검색</button>
				</div>
				<div class="form-group" name="room-box">
					<label>예약하고자 하는 객실을 선택해주세요</label>
					<select class="form-control" name="roomSelect">
						<option value="0">객실 선택</option>
					</select>
				</div>
				<div class="form-group">
					<input type="button" class="btn btn-add btn-outline-warning col-12" value="+">
				</div>
			`;
			
			$(this).hide()
			$(this).after(add)
	})
	
	
	
	// 조건에 맞는 객실 찾기
	$(document).on('click','[name=btn-search]',function(){
// 		let date = getDatesStartToLast(start_date, end_date)
		let data = {
				br_num : br_num,
				d_num :  d_num    /* d_size -> d_num */
		}
		let th = $(this);
		
		ajaxObjectToJson(false,'post','<c:url value="/reservation/select"/>',data,(a)=>{
			//서버에서 가져온 객실이 없는 경우
			if(a==''){
				alert('예약할 수 있는 객실이 없습니다.')
			//서버에서 가져온 객실이 있는 경우	
			}else{
				//th = btn-search, 
				th.parent().next().find('[name=roomSelect]').empty();
				//가져온 방의 갯수만큼 반복됨 (향상된 for문)
				for(room of a){
					//toString으로 받아온 room을 객체화
					let obj = JSON.parse(room)
					var option = `<option value="\${obj.ro_num }">\${obj.ro_name }</option>`;
					th.parent().next().find('[name=roomSelect]').append(option)
				}
			}
		})
		
	})
	
		
	//데이트피커
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
				 max_date.setDate(max_date.getDate()+1);
                  //시작일(from) datepicker가 닫힐때
                  //종료일(to)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                  $("#to").datepicker( "option", "minDate", max_date);
              }    
		})
		$("#to").datepicker({
			minDate: 2
		})
		
		$('.datePicker').datepicker('setDate', 'today'+1); //input창에 초기값을 내일로
		$('#to').datepicker('setDate', 'today'+2); //input창에 초기값을 내일 모래로
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