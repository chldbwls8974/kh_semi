<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

</head>

<body style="background-color: ivory;">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<div class="container mt-5">
<h2>예약하기</h2> <br>
  <form action="<c:url value='/reservation/insert'/>" method="post" class="reserv-box">
        <input type="hidden" class="form-control" name="re_me_id" value="${user.me_id }">
        <!-- 날짜 입력은 데이터피커로 받을 것 -->
        <div class="form-group">
            <label for="from">호텔 이용 시작 날짜</label>
			<input type="date" id="from" name="re_date">
            <label for="to">호텔 이용 종료 날짜</label>
            <input type="date" id="to" name="re_stay">         
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
        <div class="form-group">
            <label>맡기고 자 하는 개를 선택해주세요</label>
            <select class="form-control" name="dogSelect">
                <option value="0">반려동물 선택</option>
                <c:forEach items="${dogList }" var="dog">
                    <option value="${dog.d_si_name }">${dog.d_name }</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
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

	<script type="text/javascript">
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
	</script>

</body>
</html>