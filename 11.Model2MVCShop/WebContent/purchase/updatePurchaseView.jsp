<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">


<head>


<!DOCTYPE html>

<html lang="ko">

 <head>

	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" /> <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script> <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
	
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<style>
        body {
            	padding-top: 70px;
				height: 100%;
				background-image: url('../images/uploadFiles/20.jpg');
				background-repeat: no-repeat;
				background-size: cover;
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
        
        
       strong{
	color:yellow;
}

div.col-xs-8.col-md-4{
	color: yellow;
}
        
        
        
   	</style> 



<script type="text/javascript">

function fncUpdatePurchase(){
	
	$('form').attr("method","post").attr("action","/purchase/updatePurchase").submit();
}

$(function(){
	$("button:contains('수정')").on("click",function(){
		console.log("수정 .... : " + $(this).html());
		fncUpdatePurchase();
	});
});

$(function(){
	$("button:contains('취소')").on("click",function(){
		history.go(-1);
	});
});

$(function(){
	   $('#divyDate').datepicker({ 
		   
		   dateFormat: "yy-mm-dd",
		   showMonthAfterYear: true,
		   dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
		   monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	        });
	  });




</script>
</head>

<body>

<form name="detailForm" class="form-horizontal">

<jsp:include page="/layout/toolbar.jsp" />

<input type="hidden" name="prodNo" value= "${product.prodNo }"/>
<input type="hidden" name="tranNo" value="${purchase.tranNo }"/>
<input type="hidden" name="tranCode" value="${purchase.tranCode }"/>


	<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자아이디</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
		<hr/>
		 
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매방법</strong></div><br/><br/>
	  		<select class="form-control" name="paymentOption">
			  <option value="1" selected="selected">현금구매</option>
			  <option value="2">신용구매</option>
			</select>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자이름</strong></div>
			<input type="text" id="receiverName" name="receiverName" class="form-control" value="${purchase.receiverName}">
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자연락처</strong></div>
			<input type="text" id="receiverPhone" name="receiverPhone" class="form-control" value="${purchase.receiverPhone}">
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자주소</strong></div>
			<input type="text" id="divyAddr" name="divyAddr" class="form-control" value="${purchase.divyAddr}">
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자요청사항</strong></div>
			<input type="text" id="divyRequest" name="divyRequest" class="form-control" value="${purchase.divyRequest}">
		</div>
		
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>배송희망일자</strong></div>
				<div class="col-sm-4">
					<input type="text" id="divyDate" name="divyDate"
						class="form-control" readonly="readonly" style="width: 500px; height: 25px">
				</div>
			</div>
			
				
            
            
             <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취소</a>
		    </div>
		  </div>
		  
		</form>










<%--




<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">

<tr>
		<td width="104" class="ct_write">
			구매자아이디 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="buyerId" value="${purchase.buyer.userId}" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>

	<tr>
		<td width="104" class="ct_write">
		구매방법<img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
		
			<select 	name="paymentOption"		class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20">
				<option value="1  ">현금구매</option>
				<option value="2  ">신용구매</option>
			</select>
		</td>
	</tr>
<!-- 				</tr>
			</table>
		</td>
	</tr> -->
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
<tr>
		<td width="104" class="ct_write">
			구매자이름 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="receiverName" value="${purchase.receiverName}" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			구매자연락처 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="receiverPhone" value="${purchase.receiverPhone}" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			구매자주소 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="divyAddr" value="${purchase.divyAddr}" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			구매요청사항 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="divyRequest" value="${purchase.divyRequest}" class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10"	minLength="6">
		</td>
	</tr>
		
	<tr>
		<td width="104" class="ct_write">
			배송희망일자 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" readonly="readonly" name="divyDate" value="${purchase.orderDate}" 	
						class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6">&nbsp;
						<img 	src="../images/ct_icon_date.gif" width="15" height="15" 
									onclick="show_calendar('document.detailForm.divyDate', document.detailForm.divyDate.value)" />
		</td>
	</tr>
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;">
						<!-- <a href="javascript:fncUpdatePurchase();">수정</a> -->
						수정
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif"width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!-- <a href="javascript:history.go(-1)">취소</a> -->
						취소
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</body>
</html> --%>