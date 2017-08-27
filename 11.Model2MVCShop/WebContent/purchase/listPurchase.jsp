<%@ page language="java" contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">


<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	
	 function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
	} 
	
	$(function(){
	 	 $(".ct_list_pop td:contains('���������ϱ�')").on("click",function(){
	 		  self.location="/purchase/getPurchase?tranNo="+$($("p")[0],this).text().trim()+"&prodNo="
	 				  +$("span",this).text().trim();
	 		console.log("�������"+ $(this).html());
	 	 });
	});
	
	$(function(){
	 	 $(".ct_list_pop:contains('��ǰ����')").on("click",function(){
				self.location="/purchase/updateTranCode?tranNo="
					+$($("p")[0],this).text().trim()+"&prodNo="+$($("p",this)[1]).text().trim()+"&tranCode="+$($("p",this)[2]).text().trim()+
						"&menu=${param.menu}";
	 	 });
	});
	
	 		 
	 		 

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${ resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">��ǰ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����ּ�</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
		
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ǰ����</td>
		
		
	</tr>
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
		<td>${purchase.divyAddr }</td>
		<td align="left"></td>
		<td>${purchase.receiverPhone}</td>
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
		<td align="left"><td align="left">
		<c:if test="${purchase.tranCode=='1  '}">
		<div style="display:none">
		<p>${purchase.tranNo }</p>
		<span>${purchase.purchaseProd.prodNo }</span>
		</div>
		���������ϱ�
		</td>
		</c:if>
		<c:if test="${purchase.tranCode!='1  '}">
		�����Ұ�.
		</c:if>
		
		
		<td align="left"></td>
		<td>
		
		<c:if test="${purchase.tranCode=='1  '}">
 			���
		</c:if>
		<c:if test="${purchase.tranCode=='2  '}">
		<div style="display:none">
		<p>${purchase.tranNo }</p>
		<p>${purchase.purchaseProd.prodNo }</p>
		<p>${purchase.tranCode }</p>
		</div>
			��ǰ����
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


</table>

<!-- PageNavigation Start... -->
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value="1"/>	
			
			<jsp:include page="../common/pageNavigator.jsp"/>
		
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>

</div>

</body>
</html> 