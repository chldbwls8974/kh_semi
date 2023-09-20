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
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

	<div class="container mt-5">
		<h2>포인트 적립 관리 페이지</h2>
		<table class="table table-hover mt-4">
		    <thead>
		      <tr>
		        <th>포인트</th>
		        <th>포인트 내용</th>
		        <th>적립대상자</th>
		        <th></th>
		      </tr>
		    </thead>
		    <tbody>
		      <c:forEach items="${list }" var="point">
			      <tr>
			        <td>
				        <input type="hidden" value="${point.po_num}" class="form-control" name="po_num">
				        <input type="number" value="${point.po_point}" class="form-control" name="po_point">
			        </td>
			        <td>
			       	 <input type="text" value="${point.po_content}" class="form-control" name="po_content">
			        </td>
			        <td>${point.po_me_id} </td>
			        <td>
				        <a class="btn btn-outline-warning" name="btn-update" data-num="${point.po_num}">수정</a>
				     	<a href="javascript:void(0);" name="btn-delete" data-num="${point.po_num}" class="btn btn-delete btn-outline-warning">삭제</a>
			        </td>
			      </tr>
		      </c:forEach>
		    </tbody>
		</table>
		<a href="<c:url value='/point/insert'/>" class="btn btn-outline-dark col-3 btn float-right">포인트 적립</a>
	 </div> 
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>	
	<script type="text/javascript">
		
	$(document).on('click','[name=btn-update]',function(){
		let data = {
				num : $(this).parents('tr').find('[name=po_num]').val(),
				point : $(this).parents('tr').find('[name=po_point]').val(),
				content : $(this).parents('tr').find('[name=po_content]').val()
		}
		
		
		ajaxObjectToJson(false, 'post','<c:url value="/point/update"/>', data, (a)=>{
			alert('수정완료')
		})			
		
	})

		$(document).on('click','[name=btn-delete]',function(){
		let data = {
				num : $(this).parents('tr').find('[name=po_num]').val(),
				point : $(this).parents('tr').find('[name=po_point]').val(),
				content : $(this).parents('tr').find('[name=po_content]').val()
		}
		
		
		ajaxObjectToJson(false, 'post','<c:url value="/point/delete"/>', data, (a)=>{
			alert('삭제완료')
		})			
		
	})
	
	if ('${user}' == null || '${user.me_authority}' != 'ADMIN') {
	    	alert('권한이 없습니다.');
		    location.href="/semi_project";
	    }
	
	</script>

</body>
</html>