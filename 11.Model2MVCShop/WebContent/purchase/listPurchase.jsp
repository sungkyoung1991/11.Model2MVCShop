<%@ page language="java" contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	 	 /* $(".ct_list_pop td:contains('���������ϱ�')").on("click",function(){ */
	 	$(".updateInfo").on("click",function(){
	 		console.log("�������"+ $(this).html());
	 		  self.location="/purchase/getPurchase?tranNo="+$($("p")[0],this).text().trim()+"&prodNo="
	 				  +$("span",this).text().trim();
	 		
	 	 });
	});
	
	$(function(){
	 	 /* $(".ct_list_pop:contains('��ǰ����')").on("click",function(){ */
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
	      		 <h3>��ǰ ����</h3>
	      		 </div>
	      		 </div>

<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<h6>
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</h6>
		    </div>
		    
		     <table class="table table-hover table-striped" >
		     
	<thead>
	<tr>
		<td class="ct_list_b" width="100" align="center">��ǰ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150" align="center">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150" align="center">����ּ�</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" align="center">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" align="center">�����Ȳ</td>
		<td class="ct_line02" align="center"></td>
		<td class="ct_list_b" align="center">��������</td>
		
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ǰ����</td>
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
		
		<!-- �����Ȳ -->
		<c:if test="${purchase.tranCode=='1  '}">
		����غ���
		</c:if>
		<c:if test="${purchase.tranCode=='2  '}">
		�����
		</c:if>
		<c:if test="${purchase.tranCode=='3  '}">
		��ۿϷ�
		</c:if>
		</td>
		<td align="left">
		<td align="center">
		<c:if test="${purchase.tranCode=='1  '}">
		
			<div class="updateInfo">
				���������ϱ�
				<div style="display:none">
					<p>${purchase.tranNo }</p>
					<span>${purchase.purchaseProd.prodNo }</span>
				</div>
			</div>
		</td>
		</c:if>
		<c:if test="${purchase.tranCode!='1  '}">
		�����Ұ�.
		</c:if>
		
		
		<td align="center"></td>
		<td>
		
		<c:if test="${purchase.tranCode=='1  '}">
 			���
		</c:if>
		<c:if test="${purchase.tranCode=='2  '}">
		
		
		<div class="inHandle" role="button">
			<div style="display:none">
				<p>${purchase.tranNo }</p>
				<p>${purchase.purchaseProd.prodNo }</p>
				<p>${purchase.tranCode }</p>
			</div>
				��ǰ����
		</div>
		
		</td>
		</c:if>
		<c:if test="${purchase.tranCode=='3  '}">
		��ǰ���ɿϷ�
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