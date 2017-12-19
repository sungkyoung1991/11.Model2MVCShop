<%@ page language="java" contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <style>
   
    body {
            padding-top : 70px;
            background-image: url('../images/uploadFiles/10.jpg');
            min-height:100%;
        min-width:1024px;
        width:100%;
        height:auto;
        position:fixed;
        top:0;
        left:0;
        position:relative;
        }
        
             img.bg{
        min-height:100%;
        min-width:1024px;
        width:100%;
        height:auto;
        position:fixed;
        top:0;
        left:0;
        }
        
        @media screen and (max-width: 1024px){
        	img.bg{
        		left:50%;
        		margin-left: -512px:
        	}
        }
        
        div#container{
        	position:relative;
        }
        
        div > *{
        color: orange;
        }
   
   </style>
   
<script type="text/javascript">

	
	 function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
	} 
	
	$(function(){
	 	 /* $(".ct_list_pop td:contains('정보수정하기')").on("click",function(){ */
	 	$(".updateInfo").on("click",function(){
	 		console.log("수정찌금"+ $(this).html());
	 		  self.location="/purchase/getPurchase?tranNo="+$($("p")[0],this).text().trim()+"&prodNo="
	 				  +$("span",this).text().trim();
	 		
	 	 });
	});
	
	$(function(){
	 	 /* $(".ct_list_pop:contains('상품수령')").on("click",function(){ */
	 		 $(".inHandle").on("click",function(){
				self.location="/purchase/updateTranCode?tranNo="
					+$($("p")[0],this).text().trim()+"&prodNo="+$($("p",this)[1]).text().trim()+"&tranCode="+$($("p",this)[2]).text().trim()+
						"&menu=${param.menu}";
	 	 });
	});
	
	 		 
	 		 

</script>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />


<form name="detailForm">


				<div class="container">
					<div class="page-header text-info">
	      		 <h3>상품 관리</h3>
	      		 </div>
	      		 </div>

<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<h6>
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</h6>
		    </div>
		    
		     <table class="table table-hover table-striped" >
		     
	<thead>
	<tr>
		<td class="ct_list_b" width="100" align="center">상품번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150" align="center">물품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150" align="center">배송주소</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" align="center">전화번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" align="center">배송현황</td>
		<td class="ct_line02" align="center"></td>
		<td class="ct_list_b" align="center">정보수정</td>
		
		<td class="ct_line02"></td>
		<td class="ct_list_b">상품수령</td>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	

	
<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list }">
		<c:set var="i" value="${i+1 }"/>
	
	
	<tr class="ct_list_pop">
		<td align="center" id="prodNo">${purchase.purchaseProd.prodNo}</td>
		<td align="center"></td>
		<td align="center">${purchase.purchaseProd.prodName }</td>
		<td align="left"></td>
		<td align="center">${purchase.divyAddr }</td>
		<td align="left"></td>
		<td align="center">${purchase.receiverPhone}</td>
		<td align="left"></td>
		<td>
		
		<!-- 배송현황 -->
		<c:if test="${purchase.tranCode=='1  '}">
		배송준비중
		</c:if>
		<c:if test="${purchase.tranCode=='2  '}">
		배송중
		</c:if>
		<c:if test="${purchase.tranCode=='3  '}">
		배송완료
		</c:if>
		</td>
		<td align="left">
		<td align="center">
		<c:if test="${purchase.tranCode=='1  '}">
		
			<div class="updateInfo">
				정보수정하기
				<div style="display:none">
					<p>${purchase.tranNo }</p>
					<span>${purchase.purchaseProd.prodNo }</span>
				</div>
			</div>
		</td>
		</c:if>
		<c:if test="${purchase.tranCode!='1  '}">
		수정불가.
		</c:if>
		
		
		<td align="center"></td>
		<td>
		
		<c:if test="${purchase.tranCode=='1  '}">
 			대기
		</c:if>
		<c:if test="${purchase.tranCode=='2  '}">
		
		
		<div class="inHandle" role="button">
			<div style="display:none">
				<p>${purchase.tranNo }</p>
				<p>${purchase.purchaseProd.prodNo }</p>
				<p>${purchase.tranCode }</p>
			</div>
				상품수령
		</div>
		
		</td>
		</c:if>
		<c:if test="${purchase.tranCode=='3  '}">
		상품수령완료
		</c:if>
		
		
		</td>
		
		
		
			
	</tr>
	
	
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	
	
	</c:forEach>

</tbody>
</table>

<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value="1"/>	
			
			<jsp:include page="../common/pageNavigator_new.jsp"/>
		
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>

</div>

</body>
</html> 